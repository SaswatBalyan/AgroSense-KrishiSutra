import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/data/remote/appwrite_config.dart';
import 'package:krishi_sutra/data/remote/remote_payload_mappers.dart';

void main() {
  final timestamp = DateTime(2026, 8, 23, 6, 40).toIso8601String();

  test('maps a complete weather payload', () {
    final companion = RemotePayloadMappers.weather({
      'location': 'Sinnar, Nashik',
      'temperature': '31 C',
      'summary': 'Haze, light wind',
      'humidity': 54,
      'rainChance': 12,
      'observedAt': timestamp,
    });

    expect(companion, isNotNull);
    expect(companion!.location.value, 'Sinnar, Nashik');
    expect(companion.humidity.value, 54);
  });

  test('rejects incomplete market payloads', () {
    final companion = RemotePayloadMappers.marketPrice({
      'crop': 'Soybean',
      'mandi': 'Lasalgaon',
      'pricePerQuintal': 4285,
      'observedAt': timestamp,
    });

    expect(companion, isNull);
  });

  test('maps all remaining synchronized payloads', () {
    expect(
      RemotePayloadMappers.diagnosis({
        'farmId': 'farm-1',
        'subject': 'Soybean leaf',
        'diagnosis': 'Stem fly',
        'remedy': 'Remove affected leaves',
        'source': 'offline-tflite',
        'createdAt': timestamp,
      }),
      isNotNull,
    );
    expect(
      RemotePayloadMappers.marketPrice({
        'crop': 'Soybean',
        'mandi': 'Lasalgaon',
        'pricePerQuintal': '4285',
        'delta': -110,
        'observedAt': timestamp,
      }),
      isNotNull,
    );
    expect(
      RemotePayloadMappers.roadmapTask({
        'weekLabel': 'Week 3',
        'title': 'Gap fill and weeding',
        'details': 'Hand weed once',
        'isDone': false,
        'updatedAt': timestamp,
      }),
      isNotNull,
    );
    expect(
      RemotePayloadMappers.chatMessage({
        'role': 'assistant',
        'message': 'Skip irrigation if rain arrives.',
        'source': 'offline',
        'createdAt': timestamp,
      }),
      isNotNull,
    );
  });

  test('routes configured Appwrite collections by entity', () {
    const config = AppwriteConfig(
      endpoint: 'https://cloud.appwrite.io/v1',
      projectId: 'project',
      databaseId: 'database',
      farmCollectionId: 'farms',
      diagnosisCollectionId: 'diagnoses',
      marketPriceCollectionId: 'market-prices',
      weatherCollectionId: 'weather',
      roadmapTaskCollectionId: 'roadmap',
      chatMessageCollectionId: 'chat',
    );

    expect(config.isConfigured, isTrue);
    expect(config.collectionIdFor('market_price'), 'market-prices');
    expect(config.collectionIdFor('unknown'), isNull);
  });
}
