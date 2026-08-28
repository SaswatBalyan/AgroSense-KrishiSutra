// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_daos.dart';

// ignore_for_file: type=lint
mixin _$MarketPricesDaoMixin on DatabaseAccessor<AppDatabase> {
  $MarketPricesTable get marketPrices => attachedDatabase.marketPrices;
  MarketPricesDaoManager get managers => MarketPricesDaoManager(this);
}

class MarketPricesDaoManager {
  final _$MarketPricesDaoMixin _db;
  MarketPricesDaoManager(this._db);
  $$MarketPricesTableTableManager get marketPrices =>
      $$MarketPricesTableTableManager(_db.attachedDatabase, _db.marketPrices);
}

mixin _$WeatherCacheDaoMixin on DatabaseAccessor<AppDatabase> {
  $WeatherCacheTable get weatherCache => attachedDatabase.weatherCache;
  WeatherCacheDaoManager get managers => WeatherCacheDaoManager(this);
}

class WeatherCacheDaoManager {
  final _$WeatherCacheDaoMixin _db;
  WeatherCacheDaoManager(this._db);
  $$WeatherCacheTableTableManager get weatherCache =>
      $$WeatherCacheTableTableManager(_db.attachedDatabase, _db.weatherCache);
}
