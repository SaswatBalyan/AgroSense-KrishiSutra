import 'package:workmanager/workmanager.dart';

import 'appwrite_config.dart';
import 'appwrite_services.dart';
import 'appwrite_sync_service.dart';
import '../local/app_database.dart';

const backgroundSyncTask = 'krishi-sutra-background-sync';

@pragma('vm:entry-point')
void backgroundCallback() {
  Workmanager().executeTask((task, inputData) async {
    if (task != backgroundSyncTask) return true;

    final config = AppwriteConfig.fromEnvironment();
    if (!config.isConfigured) return true;

    final database = AppDatabase();
    try {
      final sync = AppwriteSyncService(AppwriteServices(config), database);
      await sync.syncPendingChanges();
      for (final entity in ['farm', 'market_price', 'weather', 'roadmap_task', 'product']) {
        await sync.pullEntity(entity);
      }
      return true;
    } finally {
      await database.close();
    }
  });
}
