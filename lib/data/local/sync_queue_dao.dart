import 'package:drift/drift.dart';

import 'app_database.dart';

part 'sync_queue_dao.g.dart';

@DriftAccessor(tables: [SyncQueue])
class SyncQueueDao extends DatabaseAccessor<AppDatabase>
    with _$SyncQueueDaoMixin {
  SyncQueueDao(super.attachedDatabase);

  Future<List<SyncQueueData>> getPending() {
    return (select(
      syncQueue,
    )..orderBy([(entry) => OrderingTerm.asc(entry.queuedAt)])).get();
  }

  Future<int> enqueue(SyncQueueCompanion entry) {
    return into(syncQueue).insert(entry);
  }

  Future<void> remove(int id) {
    return (delete(syncQueue)..where((entry) => entry.id.equals(id))).go();
  }
}
