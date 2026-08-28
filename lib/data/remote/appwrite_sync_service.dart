import 'dart:convert';

import '../local/app_database.dart';
import 'appwrite_services.dart';
import 'remote_payload_mappers.dart';

enum SyncStatus {
  nothingToSync,
  notConfigured,
  blocked,
  conflictResolved,
  completed,
}

enum _EntryResult { synced, conflictApplied }

class SyncResult {
  const SyncResult(this.status, this.processedCount);

  final SyncStatus status;
  final int processedCount;
}

class PullResult {
  const PullResult(this.appliedCount, this.failedCount);

  final int appliedCount;
  final int failedCount;
}

class AppwriteSyncService {
  const AppwriteSyncService(this.services, this.database);

  final AppwriteServices services;
  final AppDatabase database;

  Future<PullResult> pullEntity(String entity) async {
    if (!services.isReady) return const PullResult(0, 0);
    final collectionId = services.config.collectionIdFor(entity);
    if (collectionId == null) return const PullResult(0, 0);

    try {
      final documents = await services.databases.listDocuments(
        databaseId: services.config.databaseId,
        collectionId: collectionId,
      );
      var applied = 0;
      var failed = 0;
      for (final document in documents.documents) {
        final data = Map<String, dynamic>.from(document.data as Map);
        final didApply = entity == 'farm'
            ? await _applyRemoteFarm(document.$id, data)
            : await database.remoteReconciliationDao.applyRemoteData(
                entity,
                document.$id,
                data,
              );
        if (didApply) {
          applied++;
        } else {
          failed++;
        }
      }
      return PullResult(applied, failed);
    } on Exception {
      return const PullResult(0, 1);
    }
  }

  Future<bool> reconcileRemoteDelete(String entity, String documentId) {
    if (entity == 'farm') {
      return database.farmsDao.removeRemoteFarm(documentId);
    }
    return database.remoteReconciliationDao.removeRemoteData(
      entity,
      documentId,
    );
  }

  Future<SyncResult> syncPendingChanges() async {
    final pending = await database.syncQueueDao.getPending();
    if (pending.isEmpty) return const SyncResult(SyncStatus.nothingToSync, 0);
    if (!services.isReady) return const SyncResult(SyncStatus.notConfigured, 0);

    var processed = 0;
    for (final entry in pending) {
      final result = await _syncEntry(entry);
      if (result == null) return SyncResult(SyncStatus.blocked, processed);
      await database.syncQueueDao.remove(entry.id);
      processed++;
      if (result == _EntryResult.conflictApplied) {
        return SyncResult(SyncStatus.conflictResolved, processed);
      }
    }

    return SyncResult(SyncStatus.completed, processed);
  }

  Future<_EntryResult?> _syncEntry(SyncQueueData entry) async {
    try {
      final payload = jsonDecode(entry.payload);
      if (payload is! Map<String, dynamic>) return null;
      final documentId = payload['documentId'] as String?;
      if (documentId == null || documentId.isEmpty) return null;

      final rawData = payload['data'];
      final data = rawData is Map ? Map<String, dynamic>.from(rawData) : null;
      if (entry.operation != 'delete' && data == null) {
        return null;
      }
      if (entry.operation != 'delete' && _versionedAt(data!) == null) {
        return null;
      }
      if (entry.operation != 'delete' &&
          !_hasLocalMapper(entry.entity, data!)) {
        return null;
      }

      final config = services.config;
      final collectionId = config.collectionIdFor(entry.entity);
      if (collectionId == null) return null;
      if (entry.operation == 'update') {
        final remote = await _newerRemoteDocument(
          databaseId: config.databaseId,
          collectionId: collectionId,
          documentId: documentId,
          localUpdatedAt: _versionedAt(data!)!,
        );
        if (remote != null) {
          final remoteData = Map<String, dynamic>.from(remote.data as Map);
          final applied = entry.entity == 'farm'
              ? await _applyRemoteFarm(documentId, remoteData)
              : await database.remoteReconciliationDao.applyRemoteData(
                  entry.entity,
                  documentId,
                  remoteData,
                );
          if (!applied) {
            return null;
          }
          return _EntryResult.conflictApplied;
        }
      }
      switch (entry.operation) {
        case 'create':
          await services.databases.createDocument(
            databaseId: config.databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data!,
          );
        case 'update':
          await services.databases.updateDocument(
            databaseId: config.databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data!,
          );
        case 'delete':
          await services.databases.deleteDocument(
            databaseId: config.databaseId,
            collectionId: collectionId,
            documentId: documentId,
          );
        default:
          return null;
      }
      return _EntryResult.synced;
    } on Exception {
      return null;
    }
  }

  Future<bool> _applyRemoteFarm(
    String documentId,
    Map<String, dynamic> data,
  ) async {
    final farmId = int.tryParse(documentId.replaceFirst('farm-', ''));
    return farmId != null &&
        await database.farmsDao.applyRemoteData(farmId, data);
  }

  Future<dynamic> _newerRemoteDocument({
    required String databaseId,
    required String collectionId,
    required String documentId,
    required DateTime localUpdatedAt,
  }) async {
    try {
      final remote = await services.databases.getDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: documentId,
      );
      final remoteUpdatedAt = DateTime.tryParse(remote.$updatedAt);
      return remoteUpdatedAt != null && remoteUpdatedAt.isAfter(localUpdatedAt)
          ? remote
          : null;
    } on Exception {
      return null;
    }
  }

  bool _hasLocalMapper(String entity, Map<String, dynamic> data) {
    return switch (entity) {
      'farm' => true,
      'diagnosis' => RemotePayloadMappers.diagnosis(data) != null,
      'market_price' => RemotePayloadMappers.marketPrice(data) != null,
      'weather' => RemotePayloadMappers.weather(data) != null,
      'roadmap_task' => RemotePayloadMappers.roadmapTask(data) != null,
      'chat_message' => RemotePayloadMappers.chatMessage(data) != null,
      _ => false,
    };
  }

  DateTime? _versionedAt(Map<String, dynamic> data) {
    for (final key in ['updatedAt', 'observedAt', 'createdAt']) {
      final value = DateTime.tryParse('${data[key]}');
      if (value != null) return value;
    }
    return null;
  }
}
