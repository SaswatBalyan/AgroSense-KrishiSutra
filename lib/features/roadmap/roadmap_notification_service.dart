import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Schedules a single weekly reminder summarising pending roadmap tasks.
/// Safe to call repeatedly — it replaces the previous schedule.
class RoadmapNotificationService {
  RoadmapNotificationService._();

  static final _plugin = FlutterLocalNotificationsPlugin();
  static bool _initialized = false;
  static const _channelId = 'roadmap_reminders';
  static const _notificationId = 4201;

  static Future<void> _ensureInitialized() async {
    if (_initialized) return;
    tzdata.initializeTimeZones();
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
      onDidReceiveNotificationResponse: _onNotificationTap,
    );
    _initialized = true;
  }

  @pragma('vm:entry-point')
  static void _onNotificationTap(NotificationResponse response) {
    // Handle notification tap if needed
  }

  /// Shows nothing when [pendingCount] is zero; otherwise schedules the next
  /// Monday 07:00 local reminder (replacing any earlier one).
  static Future<void> scheduleWeeklyReminder(int pendingCount) async {
    try {
      if (!_initialized) {
        await _ensureInitialized();
        final granted =
            await _plugin
                .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin
                >()
                ?.requestNotificationsPermission() ??
            true;
        if (!granted) return;
      }

      await _plugin.cancel(id: _notificationId);
      if (pendingCount <= 0) return;

      final scheduled = _nextMondaySevenAm();
      await _plugin.zonedSchedule(
        id: _notificationId,
        title: 'Krishi-Sutra roadmap',
        body: '$pendingCount farm tasks are planned for this week. Tap to review.',
        scheduledDate: tz.TZDateTime.from(scheduled, tz.local),
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            'Roadmap reminders',
            channelDescription: 'Weekly reminders for Zero-to-Harvest tasks',
            importance: Importance.defaultImportance,
            priority: Priority.defaultPriority,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.inexact,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    } on Exception {
      // Notifications are best-effort; never block the UI on them.
    }
  }

  static DateTime _nextMondaySevenAm() {
    final now = DateTime.now();
    var next = DateTime(now.year, now.month, now.day, 7, 0);
    do {
      next = next.add(const Duration(days: 1));
    } while (next.weekday != DateTime.monday);
    return next;
  }
}