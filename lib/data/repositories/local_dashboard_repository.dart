import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../local/app_database.dart';
import '../remote/agmarknet_service.dart';
import '../remote/open_weather_service.dart';
import '../../shared/providers/database_provider.dart';

class LocalDashboardRepository {
  const LocalDashboardRepository(this.database);

  final AppDatabase database;

  Future<int> saveFarm(FarmsCompanion farm) async {
    final existing = await database.farmsDao.getFarm();
    final id = await database.farmsDao.saveFarm(farm);
    final saved = await database.farmsDao.getFarm();
    if (saved != null) {
      await database.syncQueueDao.enqueue(
        SyncQueueCompanion.insert(
          entity: 'farm',
          operation: existing == null ? 'create' : 'update',
          payload: jsonEncode({
            'documentId': 'farm-${saved.id}',
            'data': {
              'name': saved.name,
              'place': saved.place,
              'sizeHectares': saved.sizeHectares,
              'primaryCrop': saved.primaryCrop,
              'latitude': saved.latitude,
              'longitude': saved.longitude,
              'updatedAt': saved.updatedAt.toIso8601String(),
            },
          }),
          queuedAt: DateTime.now(),
        ),
      );
    }
    return id;
  }

  Stream<Farm?> watchFarm() => database.farmsDao.watchFarm();

  Stream<List<MarketPrice>> watchMarketPrices() {
    return database.marketPricesDao.watchPrices();
  }

  Future<WeatherCacheData?> getLatestWeather() {
    return database.weatherCacheDao.getLatest();
  }

  Stream<WeatherCacheData?> watchLatestWeather() {
    return database.weatherCacheDao.watchLatest();
  }

  /// Fetches live conditions for the registered farm when a weather API key is
  /// configured and the cached row is older than [maxAge]. Returns true when a
  /// fresh row was stored.
  Future<bool> refreshWeatherFromApi({
    Duration maxAge = const Duration(hours: 3),
  }) async {
    final farm = await database.farmsDao.getFarm();
    if (farm == null) {
      return false;
    }

    final latest = await database.weatherCacheDao.getLatest();
    final isStale =
        latest == null ||
        DateTime.now().difference(latest.observedAt) > maxAge;
    if (!isStale) return false;

    final fetched = await OpenWeatherService().fetchCurrentWeather(
      latitude: farm.latitude,
      longitude: farm.longitude,
      locationLabel: farm.place,
    );
    if (fetched == null) return false;

    await database.weatherCacheDao.save(fetched);
    return true;
  }

  Future<void> saveWeather(WeatherCacheCompanion weather) {
    return database.weatherCacheDao.save(weather);
  }

  Future<void> replaceMarketPrices(List<MarketPricesCompanion> prices) {
    return database.marketPricesDao.replacePrices(prices);
  }

  /// Fetches live mandi prices for the farm's primary crop when an
  /// AGMARKNET_API_KEY is configured. Refreshes are throttled by cache
  /// staleness ([maxAge]); deltas are computed against previously cached rows.
  /// Returns true when fresh rows were stored.
  Future<bool> refreshMarketPricesFromApi({
    Duration maxAge = const Duration(hours: 6),
  }) async {
    final farm = await database.farmsDao.getFarm();
    final commodity = farm?.primaryCrop.trim() ?? '';
    if (commodity.isEmpty) return false;

    final cached = await database.marketPricesDao.getPricesForCrop(commodity);
    final freshest = cached.isEmpty ? null : cached.first.observedAt;
    if (freshest != null &&
        DateTime.now().difference(freshest) <= maxAge) {
      return false;
    }

    final fetched = await AgmarknetService().fetchPricesForCommodity(commodity);
    if (fetched.isEmpty) return false;

    final now = DateTime.now();
    final companions = <MarketPricesCompanion>[];
    for (final price in fetched) {
      MarketPrice? previous;
      for (final row in cached) {
        if (row.mandi == price.mandi) {
          previous = row;
          break;
        }
      }
      companions.add(
        MarketPricesCompanion.insert(
          crop: commodity,
          mandi: price.mandi,
          pricePerQuintal: price.pricePerQuintal,
          delta: previous == null
              ? 0
              : price.pricePerQuintal - previous.pricePerQuintal,
          observedAt: now,
        ),
      );
    }
    await database.marketPricesDao.replacePrices(companions);
    return true;
  }

  Future<void> seedDashboardCache({
    required WeatherCacheCompanion weather,
    required List<MarketPricesCompanion> prices,
  }) async {
    await saveWeather(weather);
    await replaceMarketPrices(prices);
  }
}

final localDashboardRepositoryProvider = Provider<LocalDashboardRepository>(
  (ref) => LocalDashboardRepository(ref.watch(databaseProvider)),
);
