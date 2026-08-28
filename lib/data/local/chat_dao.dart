import 'dart:convert';

import 'package:drift/drift.dart';

import 'app_database.dart';

class ChatDao extends DatabaseAccessor<AppDatabase> {
  ChatDao(super.attachedDatabase);

  Stream<List<ChatHistoryData>> watchMessages() {
    return (attachedDatabase.select(
      attachedDatabase.chatHistory,
    )..orderBy([(message) => OrderingTerm.asc(message.createdAt)])).watch();
  }

  Future<ChatHistoryData> addMessage({
    required String role,
    required String message,
    required String source,
  }) async {
    final createdAt = DateTime.now().toUtc();
    final id = await attachedDatabase
        .into(attachedDatabase.chatHistory)
        .insert(
          ChatHistoryCompanion.insert(
            role: role,
            message: message,
            source: source,
            createdAt: createdAt,
          ),
        );
    await attachedDatabase.syncQueueDao.enqueue(
      SyncQueueCompanion.insert(
        entity: 'chat_message',
        operation: 'create',
        payload: jsonEncode({
          'documentId': 'chat-$id',
          'data': {
            'role': role,
            'message': message,
            'source': source,
            'createdAt': createdAt.toIso8601String(),
          },
        }),
        queuedAt: createdAt,
      ),
    );
    return (attachedDatabase.select(
      attachedDatabase.chatHistory,
    )..where((row) => row.id.equals(id))).getSingle();
  }

  Future<void> clearMessages() =>
      attachedDatabase.delete(attachedDatabase.chatHistory).go();
}
