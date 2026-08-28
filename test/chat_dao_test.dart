import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/data/local/app_database.dart';
import 'package:krishi_sutra/data/local/chat_dao.dart';

void main() {
  late AppDatabase database;
  late ChatDao chatDao;

  setUp(() {
    database = AppDatabase.forTesting();
    chatDao = ChatDao(database);
  });

  tearDown(() => database.close());

  test('message is persisted and queued for later sync', () async {
    final saved = await chatDao.addMessage(
      role: 'user',
      message: 'Should I irrigate soybean this week?',
      source: 'local',
    );

    expect(saved.role, 'user');
    expect(saved.message, contains('irrigate soybean'));

    final pending = await database.syncQueueDao.getPending();
    expect(pending, hasLength(1));
    expect(pending.single.entity, 'chat_message');
    expect(pending.single.operation, 'create');
    expect(pending.single.payload, contains('Should I irrigate soybean'));
  });
}
