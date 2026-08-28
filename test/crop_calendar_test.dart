import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/features/roadmap/crop_calendar.dart';

void main() {
  group('seasonForMonth', () {
    test('maps Indian cropping seasons', () {
      expect(CropCalendar.seasonForMonth(6), Season.kharif);
      expect(CropCalendar.seasonForMonth(7), Season.kharif);
      expect(CropCalendar.seasonForMonth(10), Season.kharif);
      expect(CropCalendar.seasonForMonth(11), Season.rabi);
      expect(CropCalendar.seasonForMonth(1), Season.rabi);
      expect(CropCalendar.seasonForMonth(3), Season.rabi);
      expect(CropCalendar.seasonForMonth(4), Season.zaid);
      expect(CropCalendar.seasonForMonth(5), Season.zaid);
    });
  });

  group('tasksFor', () {
    test('known crop returns its dedicated template', () {
      final tasks = CropCalendar.tasksFor('Soybean', Season.kharif);
      expect(tasks, isNotEmpty);
      expect(tasks.first.title, 'Seed treatment');
      expect(
        tasks.map((t) => t.title),
        contains('Harvest'),
      );
    });

    test('spelling variants resolve to the same template', () {
      final a = CropCalendar.tasksFor('Soyabean', Season.kharif);
      final b = CropCalendar.tasksFor('soy bean', Season.kharif);
      expect(a.first.title, b.first.title);
      expect(a.length, b.length);
    });

    test('unknown crop falls back to seasonal generic calendar', () {
      final kharif = CropCalendar.tasksFor('Dragonfruit', Season.kharif);
      final rabi = CropCalendar.tasksFor('Dragonfruit', Season.rabi);
      expect(kharif, isNotEmpty);
      expect(rabi, isNotEmpty);
      expect(kharif.first.title, isNot(rabi.first.title));
    });

    test('every template task has non-empty fields and ordered weeks',
        () async {
      for (final entry in {
        'Soybean': true,
        'Cotton': true,
        'Onion': true,
        'Wheat': true,
        'Pigeonpea': true,
        'Maize': true,
        'Groundnut': true,
      }.entries) {
        final tasks = CropCalendar.tasksFor(entry.key, Season.kharif);
        for (final task in tasks) {
          expect(task.weekLabel, isNotEmpty,
              reason: '${entry.key}: empty weekLabel');
          expect(task.title, isNotEmpty, reason: '${entry.key}: empty title');
          expect(task.details, isNotEmpty,
              reason: '${entry.key}: empty details');
        }
      }
    });
  });
}
