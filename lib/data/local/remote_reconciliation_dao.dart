import 'package:drift/drift.dart';

import '../remote/remote_payload_mappers.dart';
import 'app_database.dart';

part 'remote_reconciliation_dao.g.dart';

@DriftAccessor(
  tables: [
    Diagnoses,
    MarketPrices,
    WeatherCache,
    RoadmapTasks,
    ChatHistory,
    Products,
  ],
)
class RemoteReconciliationDao extends DatabaseAccessor<AppDatabase>
    with _$RemoteReconciliationDaoMixin {
  RemoteReconciliationDao(super.attachedDatabase);

  Future<bool> applyRemoteData(
    String entity,
    String remoteId,
    Map<String, dynamic> data,
  ) async {
    return switch (entity) {
      'diagnosis' => _diagnosis(remoteId, data),
      'market_price' => _marketPrice(remoteId, data),
      'weather' => _weather(remoteId, data),
      'roadmap_task' => _roadmapTask(remoteId, data),
      'chat_message' => _chatMessage(remoteId, data),
      'product' => _product(remoteId, data),
      _ => false,
    };
  }

  Future<bool> removeRemoteData(String entity, String remoteId) async {
    final deleted = switch (entity) {
      'diagnosis' => await (delete(
        diagnoses,
      )..where((row) => row.remoteId.equals(remoteId))).go(),
      'market_price' => await (delete(
        marketPrices,
      )..where((row) => row.remoteId.equals(remoteId))).go(),
      'weather' => await (delete(
        weatherCache,
      )..where((row) => row.remoteId.equals(remoteId))).go(),
      'roadmap_task' => await (delete(
        roadmapTasks,
      )..where((row) => row.remoteId.equals(remoteId))).go(),
      'chat_message' => await (delete(
        chatHistory,
      )..where((row) => row.remoteId.equals(remoteId))).go(),
      'product' => await (delete(
        products,
      )..where((row) => row.remoteId.equals(remoteId))).go(),
      _ => 0,
    };
    return deleted == 1;
  }

  Future<bool> _diagnosis(String remoteId, Map<String, dynamic> data) async {
    final mapped = RemotePayloadMappers.diagnosis(data);
    if (mapped == null) return false;
    final companion = mapped.copyWith(remoteId: Value(remoteId));
    final changed = await (update(
      diagnoses,
    )..where((row) => row.remoteId.equals(remoteId))).write(companion);
    if (changed == 0) await into(diagnoses).insert(companion);
    return true;
  }

  Future<bool> _marketPrice(String remoteId, Map<String, dynamic> data) async {
    final mapped = RemotePayloadMappers.marketPrice(data);
    if (mapped == null) return false;
    final companion = mapped.copyWith(remoteId: Value(remoteId));
    final changed = await (update(
      marketPrices,
    )..where((row) => row.remoteId.equals(remoteId))).write(companion);
    if (changed == 0) await into(marketPrices).insert(companion);
    return true;
  }

  Future<bool> _weather(String remoteId, Map<String, dynamic> data) async {
    final mapped = RemotePayloadMappers.weather(data);
    if (mapped == null) return false;
    final companion = mapped.copyWith(remoteId: Value(remoteId));
    final changed = await (update(
      weatherCache,
    )..where((row) => row.remoteId.equals(remoteId))).write(companion);
    if (changed == 0) await into(weatherCache).insert(companion);
    return true;
  }

  Future<bool> _roadmapTask(String remoteId, Map<String, dynamic> data) async {
    final mapped = RemotePayloadMappers.roadmapTask(data);
    if (mapped == null) return false;
    final companion = mapped.copyWith(remoteId: Value(remoteId));
    final changed = await (update(
      roadmapTasks,
    )..where((row) => row.remoteId.equals(remoteId))).write(companion);
    if (changed == 0) await into(roadmapTasks).insert(companion);
    return true;
  }

  Future<bool> _chatMessage(String remoteId, Map<String, dynamic> data) async {
    final mapped = RemotePayloadMappers.chatMessage(data);
    if (mapped == null) return false;
    final companion = mapped.copyWith(remoteId: Value(remoteId));
    final changed = await (update(
      chatHistory,
    )..where((row) => row.remoteId.equals(remoteId))).write(companion);
    if (changed == 0) await into(chatHistory).insert(companion);
    return true;
  }

  Future<bool> _product(String remoteId, Map<String, dynamic> data) async {
    final mapped = RemotePayloadMappers.product(data);
    if (mapped == null) return false;
    final companion = mapped.copyWith(remoteId: Value(remoteId));
    final changed = await (update(
      products,
    )..where((row) => row.remoteId.equals(remoteId))).write(companion);
    if (changed == 0) await into(products).insert(companion);
    return true;
  }
}
