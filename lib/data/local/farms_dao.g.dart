// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farms_dao.dart';

// ignore_for_file: type=lint
mixin _$FarmsDaoMixin on DatabaseAccessor<AppDatabase> {
  $FarmsTable get farms => attachedDatabase.farms;
  FarmsDaoManager get managers => FarmsDaoManager(this);
}

class FarmsDaoManager {
  final _$FarmsDaoMixin _db;
  FarmsDaoManager(this._db);
  $$FarmsTableTableManager get farms =>
      $$FarmsTableTableManager(_db.attachedDatabase, _db.farms);
}
