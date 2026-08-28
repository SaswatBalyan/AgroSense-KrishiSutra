import 'package:drift/drift.dart';

import '../local/app_database.dart';

class RemotePayloadMappers {
  RemotePayloadMappers._();

  static DiagnosesCompanion? diagnosis(Map<String, dynamic> data) {
    final farmId = data['farmId'] as String?;
    final subject = data['subject'] as String?;
    final diagnosis = data['diagnosis'] as String?;
    final remedy = data['remedy'] as String?;
    final source = data['source'] as String?;
    final createdAt = _date(data['createdAt']);
    if (farmId == null ||
        subject == null ||
        diagnosis == null ||
        remedy == null ||
        source == null ||
        createdAt == null) {
      return null;
    }
    return DiagnosesCompanion.insert(
      farmId: farmId,
      subject: subject,
      diagnosis: diagnosis,
      remedy: remedy,
      source: source,
      createdAt: createdAt,
    );
  }

  static MarketPricesCompanion? marketPrice(Map<String, dynamic> data) {
    final crop = data['crop'] as String?;
    final mandi = data['mandi'] as String?;
    final price = _integer(data['pricePerQuintal']);
    final delta = _integer(data['delta']);
    final observedAt = _date(data['observedAt']);
    if (crop == null ||
        mandi == null ||
        price == null ||
        delta == null ||
        observedAt == null) {
      return null;
    }
    return MarketPricesCompanion.insert(
      crop: crop,
      mandi: mandi,
      pricePerQuintal: price,
      delta: delta,
      observedAt: observedAt,
    );
  }

  static WeatherCacheCompanion? weather(Map<String, dynamic> data) {
    final location = data['location'] as String?;
    final temperature = data['temperature'] as String?;
    final summary = data['summary'] as String?;
    final humidity = _integer(data['humidity']);
    final rainChance = _integer(data['rainChance']);
    final observedAt = _date(data['observedAt']);
    if (location == null ||
        temperature == null ||
        summary == null ||
        humidity == null ||
        rainChance == null ||
        observedAt == null) {
      return null;
    }
    return WeatherCacheCompanion.insert(
      location: location,
      temperature: temperature,
      summary: summary,
      humidity: humidity,
      rainChance: rainChance,
      observedAt: observedAt,
    );
  }

  static RoadmapTasksCompanion? roadmapTask(Map<String, dynamic> data) {
    final weekLabel = data['weekLabel'] as String?;
    final title = data['title'] as String?;
    final details = data['details'] as String?;
    final isDone = data['isDone'] as bool?;
    final updatedAt = _date(data['updatedAt']);
    if (weekLabel == null ||
        title == null ||
        details == null ||
        isDone == null ||
        updatedAt == null) {
      return null;
    }
    return RoadmapTasksCompanion.insert(
      weekLabel: weekLabel,
      title: title,
      details: details,
      isDone: Value(isDone),
      updatedAt: updatedAt,
    );
  }

  static ChatHistoryCompanion? chatMessage(Map<String, dynamic> data) {
    final role = data['role'] as String?;
    final message = data['message'] as String?;
    final source = data['source'] as String?;
    final createdAt = _date(data['createdAt']);
    if (role == null ||
        message == null ||
        source == null ||
        createdAt == null) {
      return null;
    }
    return ChatHistoryCompanion.insert(
      role: role,
      message: message,
      source: source,
      createdAt: createdAt,
    );
  }

  static ProductsCompanion? product(Map<String, dynamic> data) {
    final name = data['name'] as String?;
    final seller = data['seller'] as String?;
    final priceLabel = data['priceLabel'] as String?;
    final category = data['category'] as String?;
    final detail = data['detail'] as String?;
    final updatedAt = _date(data['updatedAt']);
    if (name == null ||
        seller == null ||
        priceLabel == null ||
        category == null ||
        detail == null ||
        updatedAt == null) {
      return null;
    }
    return ProductsCompanion.insert(
      name: name,
      seller: seller,
      priceLabel: priceLabel,
      category: category,
      detail: detail,
      updatedAt: updatedAt,
    );
  }

  static DateTime? _date(Object? value) => DateTime.tryParse('$value');

  static int? _integer(Object? value) {
    return value is num ? value.toInt() : int.tryParse('$value');
  }
}
