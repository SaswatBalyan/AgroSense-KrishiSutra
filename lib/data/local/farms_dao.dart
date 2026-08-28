import 'package:drift/drift.dart';

import 'app_database.dart';

part 'farms_dao.g.dart';

@DriftAccessor(tables: [Farms])
class FarmsDao extends DatabaseAccessor<AppDatabase> with _$FarmsDaoMixin {
  FarmsDao(super.attachedDatabase);

  Stream<Farm?> watchFarm() => select(farms).watchSingleOrNull();

  Future<Farm?> getFarm() => select(farms).getSingleOrNull();

  Future<int> saveFarm(FarmsCompanion farm) async {
    final existing = await getFarm();
    if (existing == null) return into(farms).insert(farm);

    return (update(
      farms,
    )..where((row) => row.id.equals(existing.id))).write(farm);
  }

  Future<bool> applyRemoteData(int id, Map<String, dynamic> data) async {
    final name = data['name'] as String?;
    final place = data['place'] as String?;
    final primaryCrop = data['primaryCrop'] as String?;
    final sizeHectares = _number(data['sizeHectares']);
    final latitude = _number(data['latitude']);
    final longitude = _number(data['longitude']);
    final updatedAt = DateTime.tryParse('${data['updatedAt']}');
    if (name == null ||
        place == null ||
        primaryCrop == null ||
        sizeHectares == null ||
        latitude == null ||
        longitude == null ||
        updatedAt == null) {
      return false;
    }

    final changed = await (update(farms)..where((row) => row.id.equals(id)))
        .write(
          FarmsCompanion(
            name: Value(name),
            place: Value(place),
            sizeHectares: Value(sizeHectares),
            primaryCrop: Value(primaryCrop),
            latitude: Value(latitude),
            longitude: Value(longitude),
            updatedAt: Value(updatedAt),
          ),
        );
    return changed == 1;
  }

  Future<bool> removeRemoteFarm(String documentId) async {
    final id = int.tryParse(documentId.replaceFirst('farm-', ''));
    if (id == null) return false;
    return await (delete(farms)..where((row) => row.id.equals(id))).go() == 1;
  }

  double? _number(Object? value) {
    return value is num ? value.toDouble() : double.tryParse('$value');
  }
}
