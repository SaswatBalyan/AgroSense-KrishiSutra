import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:krishi_sutra/data/remote/open_weather_service.dart';

const _apiKey = String.fromEnvironment('WEATHER_API_KEY');
final _apiKeyPresent = _apiKey.isNotEmpty;

void main() {
  test('missing API key returns null without any network call', () async {
    var calls = 0;
    final client = MockClient((request) async {
      calls++;
      return http.Response('{}', 200);
    });

    final result = await OpenWeatherService(client: client)
        .fetchCurrentWeather(latitude: 19.83, longitude: 74.0, locationLabel: 'Sinnar');

    // Without --dart-define=WEATHER_API_KEY this must short-circuit before I/O.
    expect(result, isNull);
    expect(calls, 0);
  }, skip: _apiKeyPresent);

  group('with API key configured', () {
    late int calls;
    late List<RequestStub> stubs;

    setUp(() {
      calls = 0;
      stubs = [];
    });

    test('maps current conditions and forecast rain chance into cache row',
        () async {
      final client = MockClient((request) async {
        calls++;
        for (final stub in stubs) {
          if (request.url.toString().startsWith(stub.urlPrefix)) {
            return http.Response(jsonEncode(stub.body), 200);
          }
        }
        return http.Response('not found', 404);
      });
      stubs = [
        RequestStub(
          'https://api.openweathermap.org/data/2.5/weather',
          {
            'main': {'temp': 31.4, 'humidity': 54},
            'weather': [
              {'description': 'haze, light wind'},
            ],
          },
        ),
        RequestStub(
          'https://api.openweathermap.org/data/2.5/forecast',
          {
            'list': [
              {'pop': 0.12},
            ],
          },
        ),
      ];

      final result = await OpenWeatherService(client: client)
          .fetchCurrentWeather(latitude: 19.83, longitude: 74.0, locationLabel: 'Sinnar');

      expect(result, isNotNull);
      expect(result!.location.value, 'Sinnar');
      expect(result.temperature.value, '31 C');
      expect(result.summary.value, 'Haze, light wind');
      expect(result.humidity.value, 54);
      expect(result.rainChance.value, 12);
      expect(result.observedAt.value, isNotNull);
      expect(calls, 2);
    });

    test('network error returns null instead of throwing', () async {
      final client = MockClient((request) async => throw Exception('offline'));

      final result = await OpenWeatherService(client: client)
          .fetchCurrentWeather(latitude: 19.83, longitude: 74.0, locationLabel: 'Sinnar');

      expect(result, isNull);
    });

    test('malformed payload returns null instead of throwing', () async {
      final client = MockClient((request) async =>
          http.Response(jsonEncode({'unexpected': true}), 200));

      final result = await OpenWeatherService(client: client)
          .fetchCurrentWeather(latitude: 19.83, longitude: 74.0, locationLabel: 'Sinnar');

      expect(result, isNull);
    });
  }, skip: !_apiKeyPresent);
}

class RequestStub {
  const RequestStub(this.urlPrefix, this.body);

  final String urlPrefix;
  final Map<String, dynamic> body;
}
