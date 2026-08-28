import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/data/local/app_database.dart';

void main() {
  late AppDatabase database;

  setUp(() => database = AppDatabase.forTesting());
  tearDown(() => database.close());

  test('sync queue preserves order and removes processed entries', () async {
    final firstId = await database.syncQueueDao.enqueue(
      SyncQueueCompanion.insert(
        entity: 'farm',
        operation: 'update',
        payload: '{}',
        queuedAt: DateTime(2026, 8, 23, 6, 40),
      ),
    );
    await database.syncQueueDao.enqueue(
      SyncQueueCompanion.insert(
        entity: 'weather',
        operation: 'update',
        payload: '{}',
        queuedAt: DateTime(2026, 8, 23, 6, 41),
      ),
    );

    final pending = await database.syncQueueDao.getPending();
    expect(pending.map((entry) => entry.id), [firstId, firstId + 1]);

    await database.syncQueueDao.remove(firstId);
    expect((await database.syncQueueDao.getPending()).single.entity, 'weather');
  });

  test('remote weather data upserts by remote document id', () async {
    final data = {
      'location': 'Sinnar, Nashik',
      'temperature': '31 C',
      'summary': 'Haze, light wind',
      'humidity': 54,
      'rainChance': 12,
      'observedAt': '2026-08-23T06:40:00.000',
    };

    expect(
      await database.remoteReconciliationDao.applyRemoteData(
        'weather',
        'weather-sinnar',
        data,
      ),
      isTrue,
    );
    expect(
      await database.remoteReconciliationDao.applyRemoteData(
        'weather',
        'weather-sinnar',
        {...data, 'temperature': '32 C'},
      ),
      isTrue,
    );

    final weather = await database.weatherCacheDao.getLatest();
    expect(weather?.temperature, '32 C');
  });
}
