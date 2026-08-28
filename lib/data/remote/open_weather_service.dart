import 'dart:convert';

import 'package:http/http.dart' as http;

import '../local/app_database.dart';

class OpenWeatherService {
  OpenWeatherService({http.Client? client}) : _client = client ?? http.Client();

  static const _currentEndpoint = 'https://api.openweathermap.org/data/2.5/weather';
  static const _forecastEndpoint = 'https://api.openweathermap.org/data/2.5/forecast';
  final http.Client _client;

  /// Fetches current conditions for [latitude]/[longitude] and maps them into a
  /// [WeatherCacheCompanion]. Returns null when no API key is configured, the
  /// network fails, or the response is malformed — callers keep showing cached
  /// data in that case.
  Future<WeatherCacheCompanion?> fetchCurrentWeather({
    required double latitude,
    required double longitude,
    required String locationLabel,
  }) async {
    const apiKey = String.fromEnvironment('WEATHER_API_KEY');
    if (apiKey.isEmpty) return null;

    try {
      final current = await _getJson(
        Uri.parse(
          '$_currentEndpoint?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey',
        ),
      );
      if (current == null) return null;

      final main = current['main'];
      final weatherList = current['weather'];
      if (main is! Map<String, dynamic> || weatherList is! List || weatherList.isEmpty) {
        return null;
      }
      final condition = weatherList.first;
      final summaryText = condition is Map<String, dynamic>
          ? (condition['description'] as String?)
          : null;

      final temperature = (main['temp'] as num?)?.round();
      if (temperature == null) return null;
      final humidity = (main['humidity'] as num?)?.toInt() ?? 0;

      final rainChance = await _fetchRainChance(latitude, longitude, apiKey);

      return WeatherCacheCompanion.insert(
        location: locationLabel,
        temperature: '$temperature C',
        summary: (summaryText == null || summaryText.trim().isEmpty)
            ? 'Unavailable'
            : _capitalize(summaryText.trim()),
        humidity: humidity,
        rainChance: rainChance,
        observedAt: DateTime.now(),
      );
    } on Exception {
      return null;
    }
  }

  Future<int> _fetchRainChance(
    double latitude,
    double longitude,
    String apiKey,
  ) async {
    try {
      final forecast = await _getJson(
        Uri.parse(
          '$_forecastEndpoint?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey',
        ),
      );
      final list = forecast?['list'];
      if (list is List && list.isNotEmpty) {
        final first = list.first;
        if (first is Map<String, dynamic>) {
          final pop = first['pop'];
          if (pop is num) return (pop * 100).round().clamp(0, 100);
        }
      }
    } on Exception {
      // Rain chance is best-effort; fall through to 0.
    }
    return 0;
  }

  Future<Map<String, dynamic>?> _getJson(Uri uri) async {
    final response = await _client.get(uri).timeout(const Duration(seconds: 15));
    if (response.statusCode < 200 || response.statusCode >= 300) return null;
    final decoded = jsonDecode(response.body);
    return decoded is Map<String, dynamic> ? decoded : null;
  }

  String _capitalize(String input) =>
      input.isEmpty ? input : '${input[0].toUpperCase()}${input.substring(1)}';
}
