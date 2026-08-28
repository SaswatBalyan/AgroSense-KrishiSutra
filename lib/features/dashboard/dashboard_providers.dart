import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/repositories/local_dashboard_repository.dart';

final localFarmProvider = StreamProvider<Farm?>((ref) {
  return ref.watch(localDashboardRepositoryProvider).watchFarm();
});

final cachedMarketPricesProvider = StreamProvider<List<MarketPrice>>((ref) {
  // One-shot background refresh when the dashboard starts listening. Without
  // AGMARKNET_API_KEY or a farm profile this is a no-op; the repository
  // throttles repeat calls by cache staleness (6 hours).
  unawaited(
    ref.read(localDashboardRepositoryProvider).refreshMarketPricesFromApi(),
  );
  return ref.watch(localDashboardRepositoryProvider).watchMarketPrices();
});

final cachedWeatherProvider = StreamProvider<WeatherCacheData?>((ref) {
  // Kick a one-shot background refresh when the dashboard starts listening.
  // Without WEATHER_API_KEY or farm location this is a no-op; the repository
  // throttles repeat calls by cache staleness (3 hours).
  unawaited(
    ref.read(localDashboardRepositoryProvider).refreshWeatherFromApi(),
  );
  return ref.watch(localDashboardRepositoryProvider).watchLatestWeather();
});
