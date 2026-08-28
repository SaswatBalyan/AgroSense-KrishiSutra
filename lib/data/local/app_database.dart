import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import 'cache_daos.dart';
import 'farms_dao.dart';
import 'products_dao.dart';
import 'roadmap_dao.dart';
import 'sync_queue_dao.dart';
import 'remote_reconciliation_dao.dart';

part 'app_database.g.dart';

class Farms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get place => text()();
  RealColumn get sizeHectares => real()();
  TextColumn get primaryCrop => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  DateTimeColumn get updatedAt => dateTime()();
}

class Diagnoses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remoteId => text().nullable()();
  TextColumn get farmId => text()();
  TextColumn get subject => text()();
  TextColumn get diagnosis => text()();
  TextColumn get remedy => text()();
  TextColumn get source => text()();
  DateTimeColumn get createdAt => dateTime()();
}

class MarketPrices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remoteId => text().nullable()();
  TextColumn get crop => text()();
  TextColumn get mandi => text()();
  IntColumn get pricePerQuintal => integer()();
  IntColumn get delta => integer()();
  DateTimeColumn get observedAt => dateTime()();
}

class WeatherCache extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remoteId => text().nullable()();
  TextColumn get location => text()();
  TextColumn get temperature => text()();
  TextColumn get summary => text()();
  IntColumn get humidity => integer()();
  IntColumn get rainChance => integer()();
  DateTimeColumn get observedAt => dateTime()();
}

class RoadmapTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remoteId => text().nullable()();
  TextColumn get weekLabel => text()();
  TextColumn get title => text()();
  TextColumn get details => text()();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();
}

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remoteId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get seller => text()();
  TextColumn get priceLabel => text()();
  TextColumn get category => text()();
  TextColumn get detail => text()();
  DateTimeColumn get updatedAt => dateTime()();
}

class ChatHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remoteId => text().nullable()();
  TextColumn get role => text()();
  TextColumn get message => text()();
  TextColumn get source => text()();
  DateTimeColumn get createdAt => dateTime()();
}

class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entity => text()();
  TextColumn get operation => text()();
  TextColumn get payload => text()();
  DateTimeColumn get queuedAt => dateTime()();
}

@DriftDatabase(
  daos: [
    FarmsDao,
    MarketPricesDao,
    WeatherCacheDao,
    SyncQueueDao,
    RemoteReconciliationDao,
    RoadmapDao,
    ProductsDao,
  ],
  tables: [
    Farms,
    Diagnoses,
    MarketPrices,
    WeatherCache,
    RoadmapTasks,
    ChatHistory,
    SyncQueue,
    Products,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.addColumn(diagnoses, diagnoses.remoteId);
        await migrator.addColumn(marketPrices, marketPrices.remoteId);
        await migrator.addColumn(weatherCache, weatherCache.remoteId);
        await migrator.addColumn(roadmapTasks, roadmapTasks.remoteId);
        await migrator.addColumn(chatHistory, chatHistory.remoteId);
      }
      if (from < 3) {
        await migrator.createTable(products);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(
      '${directory.path}${Platform.pathSeparator}krishi_sutra.sqlite',
    );
    return NativeDatabase.createInBackground(file);
  });
}
