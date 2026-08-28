// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_reconciliation_dao.dart';

// ignore_for_file: type=lint
mixin _$RemoteReconciliationDaoMixin on DatabaseAccessor<AppDatabase> {
  $DiagnosesTable get diagnoses => attachedDatabase.diagnoses;
  $MarketPricesTable get marketPrices => attachedDatabase.marketPrices;
  $WeatherCacheTable get weatherCache => attachedDatabase.weatherCache;
  $RoadmapTasksTable get roadmapTasks => attachedDatabase.roadmapTasks;
  $ChatHistoryTable get chatHistory => attachedDatabase.chatHistory;
  $ProductsTable get products => attachedDatabase.products;
  RemoteReconciliationDaoManager get managers =>
      RemoteReconciliationDaoManager(this);
}

class RemoteReconciliationDaoManager {
  final _$RemoteReconciliationDaoMixin _db;
  RemoteReconciliationDaoManager(this._db);
  $$DiagnosesTableTableManager get diagnoses =>
      $$DiagnosesTableTableManager(_db.attachedDatabase, _db.diagnoses);
  $$MarketPricesTableTableManager get marketPrices =>
      $$MarketPricesTableTableManager(_db.attachedDatabase, _db.marketPrices);
  $$WeatherCacheTableTableManager get weatherCache =>
      $$WeatherCacheTableTableManager(_db.attachedDatabase, _db.weatherCache);
  $$RoadmapTasksTableTableManager get roadmapTasks =>
      $$RoadmapTasksTableTableManager(_db.attachedDatabase, _db.roadmapTasks);
  $$ChatHistoryTableTableManager get chatHistory =>
      $$ChatHistoryTableTableManager(_db.attachedDatabase, _db.chatHistory);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db.attachedDatabase, _db.products);
}
