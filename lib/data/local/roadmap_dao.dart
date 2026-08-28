import 'package:drift/drift.dart';

import 'app_database.dart';

part 'roadmap_dao.g.dart';

@DriftAccessor(tables: [RoadmapTasks])
class RoadmapDao extends DatabaseAccessor<AppDatabase>
    with _$RoadmapDaoMixin {
  RoadmapDao(super.attachedDatabase);

  Stream<List<RoadmapTask>> watchTasks() {
    return (select(roadmapTasks)..orderBy([(task) => OrderingTerm.asc(task.id)]))
        .watch();
  }

  Future<List<RoadmapTask>> getTasks() {
    return (select(roadmapTasks)..orderBy([(task) => OrderingTerm.asc(task.id)]))
        .get();
  }

  Future<void> setDone(int id, bool done) {
    return (update(roadmapTasks)..where((task) => task.id.equals(id))).write(
      RoadmapTasksCompanion(
        isDone: Value(done),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  /// Replaces the whole plan while carrying over completion state for tasks
  /// whose (weekLabel, title) pair is unchanged — so regenerating the plan
  /// after a crop switch does not wipe progress on shared tasks.
  Future<void> replacePlan(List<RoadmapTasksCompanion> tasks) async {
    final existing = await getTasks();
    final doneKeys = existing
        .where((task) => task.isDone)
        .map((task) => '${task.weekLabel}|${task.title}')
        .toSet();

    await transaction(() async {
      await delete(roadmapTasks).go();
      for (final companion in tasks) {
        final label = companion.weekLabel.value;
        final title = companion.title.value;
        final wasDone = doneKeys.contains('$label|$title');
        await into(roadmapTasks).insert(
          RoadmapTasksCompanion.insert(
            weekLabel: label,
            title: title,
            details: companion.details.value,
            updatedAt: companion.updatedAt.value,
          ).copyWith(isDone: Value(wasDone)),
        );
      }
    });
  }
}
