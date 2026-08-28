import 'package:drift/drift.dart';

import 'app_database.dart';

part 'cache_daos.g.dart';

@DriftAccessor(tables: [MarketPrices])
class MarketPricesDao extends DatabaseAccessor<AppDatabase>
    with _$MarketPricesDaoMixin {
  MarketPricesDao(super.attachedDatabase);

  Stream<List<MarketPrice>> watchPrices() {
    return (select(
      marketPrices,
    )..orderBy([(price) => OrderingTerm.desc(price.observedAt)])).watch();
  }

  Future<List<MarketPrice>> getPricesForCrop(String crop) {
    return (select(marketPrices)
          ..where((price) => price.crop.equals(crop))
          ..orderBy([(price) => OrderingTerm.desc(price.observedAt)]))
        .get();
  }

  Future<void> replacePrices(List<MarketPricesCompanion> prices) async {
    await transaction(() async {
      await delete(marketPrices).go();
      await batch((batch) => batch.insertAll(marketPrices, prices));
    });
  }
}

@DriftAccessor(tables: [WeatherCache])
class WeatherCacheDao extends DatabaseAccessor<AppDatabase>
    with _$WeatherCacheDaoMixin {
  WeatherCacheDao(super.attachedDatabase);

  Future<WeatherCacheData?> getLatest() {
    return (select(weatherCache)
          ..orderBy([(weather) => OrderingTerm.desc(weather.observedAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Stream<WeatherCacheData?> watchLatest() {
    return (select(weatherCache)
          ..orderBy([(weather) => OrderingTerm.desc(weather.observedAt)])
          ..limit(1))
        .watchSingleOrNull();
  }

  Future<void> save(WeatherCacheCompanion weather) {
    return into(weatherCache).insert(weather);
  }
}
