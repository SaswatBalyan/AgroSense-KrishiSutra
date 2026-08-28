import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/data/local/app_database.dart';
import 'package:krishi_sutra/data/local/roadmap_dao.dart';

void main() {
  late AppDatabase database;
  late RoadmapDao dao;

  setUp(() {
    database = AppDatabase.forTesting();
    dao = RoadmapDao(database);
  });

  tearDown(() => database.close());

  RoadmapTasksCompanion task(String week, String title, String details) {
    return RoadmapTasksCompanion.insert(
      weekLabel: week,
      title: title,
      details: details,
      updatedAt: DateTime(2026, 8, 26),
    );
  }

  test('replacePlan stores tasks in order', () async {
    await dao.replacePlan([
      task('Week 1', 'Sowing', 'Sow after monsoon onset.'),
      task('Week 3', 'Weeding', 'First weeding.'),
    ]);

    final rows = await dao.getTasks();
    expect(rows, hasLength(2));
    expect(rows[0].weekLabel, 'Week 1');
    expect(rows[0].title, 'Sowing');
    expect(rows[1].title, 'Weeding');
  });

  test('setDone persists and watch stream emits updates', () async {
    await dao.replacePlan([task('Week 2', 'Irrigate', 'Check moisture.')]);
    final row = (await dao.getTasks()).single;

    await dao.setDone(row.id, true);

    final updated = await dao.watchTasks().first;
    expect(updated.single.isDone, isTrue);
  });

  test('regenerating preserves done state for unchanged tasks only',
      () async {
    await dao.replacePlan([
      task('Week 1', 'Sowing', 'Sow after monsoon onset.'),
      task('Week 3', 'Weeding', 'First weeding.'),
    ]);
    final sowing = (await dao.getTasks()).first;
    await dao.setDone(sowing.id, true);

    // New plan: Week 1 Sowing survives with done state; Weeding is gone;
    // a new unrelated Week 4 task starts not-done.
    await dao.replacePlan([
      task('Week 1', 'Sowing', 'Sow after monsoon onset.'),
      task('Week 4', 'Top dressing', 'Split nitrogen now.'),
    ]);

    final rows = await dao.getTasks();
    expect(rows, hasLength(2));
    expect(rows[0].isDone, isTrue, reason: 'same weekLabel+title keeps done');
    expect(rows[1].title, 'Top dressing');
    expect(rows[1].isDone, isFalse);
  });
}
