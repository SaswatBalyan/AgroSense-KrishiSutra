import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'appwrite_sync_service.dart';

class SyncScheduler {
  SyncScheduler(
    this.syncService,
    this.connectivity, {
    DateTime Function()? now,
    this.minimumRefreshInterval = const Duration(minutes: 15),
  }) : _now = now ?? DateTime.now;

  final AppwriteSyncService syncService;
  final Connectivity connectivity;
  final Duration minimumRefreshInterval;
  final DateTime Function() _now;
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  bool _running = false;
  DateTime? _lastSyncAt;

  void start() {
    _subscription ??= connectivity.onConnectivityChanged.listen((results) {
      if (_isOnline(results)) unawaited(syncNow());
    });
    unawaited(_checkInitialConnection());
  }

  Future<void> syncNow() async {
    if (!syncService.services.isReady) return;
    if (_running ||
        (_lastSyncAt != null &&
            _now().difference(_lastSyncAt!) < minimumRefreshInterval)) {
      return;
    }
    _running = true;
    try {
      await syncService.syncPendingChanges();
      for (final entity in ['farm', 'market_price', 'weather', 'roadmap_task', 'product']) {
        await syncService.pullEntity(entity);
      }
      _lastSyncAt = _now();
    } finally {
      _running = false;
    }
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  Future<void> _checkInitialConnection() async {
    final results = await connectivity.checkConnectivity();
    if (_isOnline(results)) await syncNow();
  }

  bool _isOnline(List<ConnectivityResult> results) {
    return results.any((result) => result != ConnectivityResult.none);
  }
}
