import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:krishi_sutra/data/remote/agmarknet_service.dart';

const _apiKey = String.fromEnvironment('AGMARKNET_API_KEY');
final _apiKeyPresent = _apiKey.isNotEmpty;

void main() {
  test('missing API key returns empty list without any network call',
      () async {
    var calls = 0;
    final client = MockClient((request) async {
      calls++;
      return http.Response('{}', 200);
    });

    final result = await AgmarknetService(client: client)
        .fetchPricesForCommodity('Soybean');

    // Without --dart-define=AGMARKNET_API_KEY this must short-circuit.
    expect(result, isEmpty);
    expect(calls, 0);
  }, skip: _apiKeyPresent);

  group('with API key configured', () {
    test('parses records, drops malformed rows, sorts by modal price',
        () async {
      final client = MockClient((request) async {
        expect(request.url.queryParameters['format'], 'json');
        expect(request.url.queryParameters['filters[commodity]'], 'Soybean');
        return http.Response(
          jsonEncode({
            'records': [
              {'market': 'Lasalgaon', 'modal_price': '4285'},
              {'market': 'Pimpalgaon', 'modal_price': '4,100'},
              {'market': '', 'modal_price': '4000'},
              {'market': 'Bad Row'},
              {'market': 'Zero Price', 'modal_price': '0'},
            ],
          }),
          200,
        );
      });

      final result = await AgmarknetService(client: client)
          .fetchPricesForCommodity('Soybean');

      expect(result, hasLength(2));
      expect(result.first.mandi, 'Pimpalgaon');
      expect(result.first.pricePerQuintal, 4100);
      expect(result.last.mandi, 'Lasalgaon');
      expect(result.last.pricePerQuintal, 4285);
    });

    test('falls back to loose search when exact commodity name misses',
        () async {
      final client = MockClient((request) async {
        final url = request.url.toString();
        if (url.contains('filters%5Bcommodity%5D=Soybean') ||
            url.contains('filters[commodity]=Soybean')) {
          return http.Response(
            jsonEncode({
              'records': <dynamic>[],
            }),
            200,
          );
        }
        // Loose q-search returns Agmarknet's own spelling.
        return http.Response(
          jsonEncode({
            'records': [
              {
                'market': 'Lasalgaon',
                'commodity': 'Soyabean',
                'modal_price': '4285',
              },
              {
                'market': 'Nashik',
                'commodity': 'Cabbage',
                'modal_price': '900',
              },
            ],
          }),
          200,
        );
      });

      final result = await AgmarknetService(client: client)
          .fetchPricesForCommodity('Soybean');

      // Only the Soyabean record survives the skeleton filter; Cabbage is
      // unrelated noise from the free-text search.
      expect(result, hasLength(1));
      expect(result.first.mandi, 'Lasalgaon');
      expect(result.first.pricePerQuintal, 4285);
    });

    test('network error returns empty list instead of throwing', () async {
      final client = MockClient((request) async => throw Exception('offline'));

      final result = await AgmarknetService(client: client)
          .fetchPricesForCommodity('Soybean');

      expect(result, isEmpty);
    });

    test('http error status returns empty list', () async {
      final client = MockClient((request) async =>
          http.Response(jsonEncode({'error': 'invalid key'}), 403));

      final result = await AgmarknetService(client: client)
          .fetchPricesForCommodity('Soybean');

      expect(result, isEmpty);
    });
  }, skip: !_apiKeyPresent);
}
