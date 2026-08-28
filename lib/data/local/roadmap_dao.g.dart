// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roadmap_dao.dart';

// ignore_for_file: type=lint
mixin _$RoadmapDaoMixin on DatabaseAccessor<AppDatabase> {
  $RoadmapTasksTable get roadmapTasks => attachedDatabase.roadmapTasks;
  RoadmapDaoManager get managers => RoadmapDaoManager(this);
}

class RoadmapDaoManager {
  final _$RoadmapDaoMixin _db;
  RoadmapDaoManager(this._db);
  $$RoadmapTasksTableTableManager get roadmapTasks =>
      $$RoadmapTasksTableTableManager(_db.attachedDatabase, _db.roadmapTasks);
}
