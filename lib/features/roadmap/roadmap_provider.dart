import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/local/roadmap_dao.dart';
import '../../data/repositories/local_dashboard_repository.dart';
import '../../shared/providers/database_provider.dart';
import 'crop_calendar.dart';
import 'roadmap_notification_service.dart';

final roadmapDaoProvider = Provider<RoadmapDao>(
  (ref) => RoadmapDao(ref.watch(databaseProvider)),
);

final roadmapTasksProvider = StreamProvider<List<RoadmapTask>>(
  (ref) => ref.watch(roadmapDaoProvider).watchTasks(),
);

/// Generates the week-by-week plan from the farm profile when the table is
/// empty or the crop changed since the last generation. Call [ensurePlan] on
/// screen entry; [force] regenerates even when a plan already exists.
class RoadmapController {
  RoadmapController(this.ref);

  final Ref ref;

  String? _lastGeneratedSignature;
  bool _inFlight = false;

  Future<void> ensurePlan({bool force = false}) async {
    if (_inFlight) return;
    _inFlight = true;
    try {
      final dao = ref.read(roadmapDaoProvider);
      final farm = await ref
          .read(localDashboardRepositoryProvider)
          .database
          .farmsDao
          .getFarm();
      if (farm == null) return;

      final season = CropCalendar.seasonForMonth(DateTime.now().month);
      final signature =
          '${farm.primaryCrop.trim().toLowerCase()}|${CropCalendar.seasonLabel(season)}';
      if (!force && _lastGeneratedSignature == signature) return;

      final existing = force ? <RoadmapTask>[] : await dao.getTasks();
      if (!force &&
          existing.isNotEmpty &&
          _lastGeneratedSignature != null) {
        // Plan present from an earlier session for the same crop — keep it.
        _lastGeneratedSignature = signature;
        return;
      }

      final template = CropCalendar.tasksFor(farm.primaryCrop, season);
      final now = DateTime.now();
      await dao.replacePlan(
        template
            .map(
              (task) => RoadmapTasksCompanion.insert(
                weekLabel: task.weekLabel,
                title: task.title,
                details: task.details,
                updatedAt: now,
              ),
            )
            .toList(),
      );
      _lastGeneratedSignature = signature;
      await _rescheduleReminder();
    } finally {
      _inFlight = false;
    }
  }

  Future<void> setDone(int id, bool done) async {
    await ref.read(roadmapDaoProvider).setDone(id, done);
    unawaited(_rescheduleReminder());
  }

  Future<void> _rescheduleReminder() async {
    final tasks = await ref.read(roadmapDaoProvider).getTasks();
    final pending = tasks.where((task) => !task.isDone).length;
    await RoadmapNotificationService.scheduleWeeklyReminder(pending);
  }
}

final roadmapControllerProvider = Provider<RoadmapController>(
  (ref) => RoadmapController(ref),
);
