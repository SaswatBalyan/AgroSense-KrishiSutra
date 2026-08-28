import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'appwrite_config.dart';
import 'appwrite_services.dart';
import 'appwrite_sync_service.dart';
import 'sync_scheduler.dart';
import '../../shared/providers/database_provider.dart';

final appwriteConfigProvider = Provider<AppwriteConfig>((ref) {
  return AppwriteConfig.fromEnvironment();
});

final appwriteServicesProvider = Provider<AppwriteServices>((ref) {
  return AppwriteServices(ref.watch(appwriteConfigProvider));
});

final appwriteSyncServiceProvider = Provider<AppwriteSyncService>((ref) {
  return AppwriteSyncService(
    ref.watch(appwriteServicesProvider),
    ref.watch(databaseProvider),
  );
});

final syncSchedulerProvider = Provider<SyncScheduler>((ref) {
  final scheduler = SyncScheduler(
    ref.watch(appwriteSyncServiceProvider),
    Connectivity(),
  );
  scheduler.start();
  ref.onDispose(scheduler.dispose);
  return scheduler;
});
