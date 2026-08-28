import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/data/local/app_database.dart';
import 'package:krishi_sutra/data/remote/appwrite_config.dart';
import 'package:krishi_sutra/data/remote/appwrite_services.dart';
import 'package:krishi_sutra/data/remote/appwrite_sync_service.dart';

void main() {
  testWidgets('keeps queued work when Appwrite is not configured', (_) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    const config = AppwriteConfig(
      endpoint: '',
      projectId: '',
      databaseId: '',
      farmCollectionId: '',
      diagnosisCollectionId: '',
      marketPriceCollectionId: '',
      weatherCollectionId: '',
      roadmapTaskCollectionId: '',
      chatMessageCollectionId: '',
    );
    final database = AppDatabase.forTesting();
    final service = AppwriteSyncService(AppwriteServices(config), database);

    await database.syncQueueDao.enqueue(
      SyncQueueCompanion.insert(
        entity: 'farm',
        operation: 'update',
        payload: '{}',
        queuedAt: DateTime(2026, 8, 23),
      ),
    );

    final result = await service.syncPendingChanges();

    expect(result.status, SyncStatus.notConfigured);
    expect(await database.syncQueueDao.getPending(), hasLength(1));
    await database.close();
  });
}
