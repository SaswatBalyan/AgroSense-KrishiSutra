// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FarmsTable extends Farms with TableInfo<$FarmsTable, Farm> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _placeMeta = const VerificationMeta('place');
  @override
  late final GeneratedColumn<String> place = GeneratedColumn<String>(
    'place',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeHectaresMeta = const VerificationMeta(
    'sizeHectares',
  );
  @override
  late final GeneratedColumn<double> sizeHectares = GeneratedColumn<double>(
    'size_hectares',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _primaryCropMeta = const VerificationMeta(
    'primaryCrop',
  );
  @override
  late final GeneratedColumn<String> primaryCrop = GeneratedColumn<String>(
    'primary_crop',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    place,
    sizeHectares,
    primaryCrop,
    latitude,
    longitude,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farms';
  @override
  VerificationContext validateIntegrity(
    Insertable<Farm> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('place')) {
      context.handle(
        _placeMeta,
        place.isAcceptableOrUnknown(data['place']!, _placeMeta),
      );
    } else if (isInserting) {
      context.missing(_placeMeta);
    }
    if (data.containsKey('size_hectares')) {
      context.handle(
        _sizeHectaresMeta,
        sizeHectares.isAcceptableOrUnknown(
          data['size_hectares']!,
          _sizeHectaresMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sizeHectaresMeta);
    }
    if (data.containsKey('primary_crop')) {
      context.handle(
        _primaryCropMeta,
        primaryCrop.isAcceptableOrUnknown(
          data['primary_crop']!,
          _primaryCropMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_primaryCropMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Farm map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Farm(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      place: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place'],
      )!,
      sizeHectares: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}size_hectares'],
      )!,
      primaryCrop: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}primary_crop'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $FarmsTable createAlias(String alias) {
    return $FarmsTable(attachedDatabase, alias);
  }
}

class Farm extends DataClass implements Insertable<Farm> {
  final int id;
  final String name;
  final String place;
  final double sizeHectares;
  final String primaryCrop;
  final double latitude;
  final double longitude;
  final DateTime updatedAt;
  const Farm({
    required this.id,
    required this.name,
    required this.place,
    required this.sizeHectares,
    required this.primaryCrop,
    required this.latitude,
    required this.longitude,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['place'] = Variable<String>(place);
    map['size_hectares'] = Variable<double>(sizeHectares);
    map['primary_crop'] = Variable<String>(primaryCrop);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FarmsCompanion toCompanion(bool nullToAbsent) {
    return FarmsCompanion(
      id: Value(id),
      name: Value(name),
      place: Value(place),
      sizeHectares: Value(sizeHectares),
      primaryCrop: Value(primaryCrop),
      latitude: Value(latitude),
      longitude: Value(longitude),
      updatedAt: Value(updatedAt),
    );
  }

  factory Farm.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Farm(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      place: serializer.fromJson<String>(json['place']),
      sizeHectares: serializer.fromJson<double>(json['sizeHectares']),
      primaryCrop: serializer.fromJson<String>(json['primaryCrop']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'place': serializer.toJson<String>(place),
      'sizeHectares': serializer.toJson<double>(sizeHectares),
      'primaryCrop': serializer.toJson<String>(primaryCrop),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Farm copyWith({
    int? id,
    String? name,
    String? place,
    double? sizeHectares,
    String? primaryCrop,
    double? latitude,
    double? longitude,
    DateTime? updatedAt,
  }) => Farm(
    id: id ?? this.id,
    name: name ?? this.name,
    place: place ?? this.place,
    sizeHectares: sizeHectares ?? this.sizeHectares,
    primaryCrop: primaryCrop ?? this.primaryCrop,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Farm copyWithCompanion(FarmsCompanion data) {
    return Farm(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      place: data.place.present ? data.place.value : this.place,
      sizeHectares: data.sizeHectares.present
          ? data.sizeHectares.value
          : this.sizeHectares,
      primaryCrop: data.primaryCrop.present
          ? data.primaryCrop.value
          : this.primaryCrop,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Farm(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('place: $place, ')
          ..write('sizeHectares: $sizeHectares, ')
          ..write('primaryCrop: $primaryCrop, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    place,
    sizeHectares,
    primaryCrop,
    latitude,
    longitude,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Farm &&
          other.id == this.id &&
          other.name == this.name &&
          other.place == this.place &&
          other.sizeHectares == this.sizeHectares &&
          other.primaryCrop == this.primaryCrop &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.updatedAt == this.updatedAt);
}

class FarmsCompanion extends UpdateCompanion<Farm> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> place;
  final Value<double> sizeHectares;
  final Value<String> primaryCrop;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<DateTime> updatedAt;
  const FarmsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.place = const Value.absent(),
    this.sizeHectares = const Value.absent(),
    this.primaryCrop = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  FarmsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String place,
    required double sizeHectares,
    required String primaryCrop,
    required double latitude,
    required double longitude,
    required DateTime updatedAt,
  }) : name = Value(name),
       place = Value(place),
       sizeHectares = Value(sizeHectares),
       primaryCrop = Value(primaryCrop),
       latitude = Value(latitude),
       longitude = Value(longitude),
       updatedAt = Value(updatedAt);
  static Insertable<Farm> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? place,
    Expression<double>? sizeHectares,
    Expression<String>? primaryCrop,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (place != null) 'place': place,
      if (sizeHectares != null) 'size_hectares': sizeHectares,
      if (primaryCrop != null) 'primary_crop': primaryCrop,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  FarmsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? place,
    Value<double>? sizeHectares,
    Value<String>? primaryCrop,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<DateTime>? updatedAt,
  }) {
    return FarmsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      place: place ?? this.place,
      sizeHectares: sizeHectares ?? this.sizeHectares,
      primaryCrop: primaryCrop ?? this.primaryCrop,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (place.present) {
      map['place'] = Variable<String>(place.value);
    }
    if (sizeHectares.present) {
      map['size_hectares'] = Variable<double>(sizeHectares.value);
    }
    if (primaryCrop.present) {
      map['primary_crop'] = Variable<String>(primaryCrop.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('place: $place, ')
          ..write('sizeHectares: $sizeHectares, ')
          ..write('primaryCrop: $primaryCrop, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DiagnosesTable extends Diagnoses
    with TableInfo<$DiagnosesTable, Diagnose> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiagnosesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _farmIdMeta = const VerificationMeta('farmId');
  @override
  late final GeneratedColumn<String> farmId = GeneratedColumn<String>(
    'farm_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectMeta = const VerificationMeta(
    'subject',
  );
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
    'subject',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _diagnosisMeta = const VerificationMeta(
    'diagnosis',
  );
  @override
  late final GeneratedColumn<String> diagnosis = GeneratedColumn<String>(
    'diagnosis',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remedyMeta = const VerificationMeta('remedy');
  @override
  late final GeneratedColumn<String> remedy = GeneratedColumn<String>(
    'remedy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    farmId,
    subject,
    diagnosis,
    remedy,
    source,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diagnoses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Diagnose> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('farm_id')) {
      context.handle(
        _farmIdMeta,
        farmId.isAcceptableOrUnknown(data['farm_id']!, _farmIdMeta),
      );
    } else if (isInserting) {
      context.missing(_farmIdMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(
        _subjectMeta,
        subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('diagnosis')) {
      context.handle(
        _diagnosisMeta,
        diagnosis.isAcceptableOrUnknown(data['diagnosis']!, _diagnosisMeta),
      );
    } else if (isInserting) {
      context.missing(_diagnosisMeta);
    }
    if (data.containsKey('remedy')) {
      context.handle(
        _remedyMeta,
        remedy.isAcceptableOrUnknown(data['remedy']!, _remedyMeta),
      );
    } else if (isInserting) {
      context.missing(_remedyMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Diagnose map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Diagnose(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      farmId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}farm_id'],
      )!,
      subject: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject'],
      )!,
      diagnosis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}diagnosis'],
      )!,
      remedy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remedy'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DiagnosesTable createAlias(String alias) {
    return $DiagnosesTable(attachedDatabase, alias);
  }
}

class Diagnose extends DataClass implements Insertable<Diagnose> {
  final int id;
  final String? remoteId;
  final String farmId;
  final String subject;
  final String diagnosis;
  final String remedy;
  final String source;
  final DateTime createdAt;
  const Diagnose({
    required this.id,
    this.remoteId,
    required this.farmId,
    required this.subject,
    required this.diagnosis,
    required this.remedy,
    required this.source,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['farm_id'] = Variable<String>(farmId);
    map['subject'] = Variable<String>(subject);
    map['diagnosis'] = Variable<String>(diagnosis);
    map['remedy'] = Variable<String>(remedy);
    map['source'] = Variable<String>(source);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DiagnosesCompanion toCompanion(bool nullToAbsent) {
    return DiagnosesCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      farmId: Value(farmId),
      subject: Value(subject),
      diagnosis: Value(diagnosis),
      remedy: Value(remedy),
      source: Value(source),
      createdAt: Value(createdAt),
    );
  }

  factory Diagnose.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Diagnose(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      farmId: serializer.fromJson<String>(json['farmId']),
      subject: serializer.fromJson<String>(json['subject']),
      diagnosis: serializer.fromJson<String>(json['diagnosis']),
      remedy: serializer.fromJson<String>(json['remedy']),
      source: serializer.fromJson<String>(json['source']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'farmId': serializer.toJson<String>(farmId),
      'subject': serializer.toJson<String>(subject),
      'diagnosis': serializer.toJson<String>(diagnosis),
      'remedy': serializer.toJson<String>(remedy),
      'source': serializer.toJson<String>(source),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Diagnose copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    String? farmId,
    String? subject,
    String? diagnosis,
    String? remedy,
    String? source,
    DateTime? createdAt,
  }) => Diagnose(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    farmId: farmId ?? this.farmId,
    subject: subject ?? this.subject,
    diagnosis: diagnosis ?? this.diagnosis,
    remedy: remedy ?? this.remedy,
    source: source ?? this.source,
    createdAt: createdAt ?? this.createdAt,
  );
  Diagnose copyWithCompanion(DiagnosesCompanion data) {
    return Diagnose(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      subject: data.subject.present ? data.subject.value : this.subject,
      diagnosis: data.diagnosis.present ? data.diagnosis.value : this.diagnosis,
      remedy: data.remedy.present ? data.remedy.value : this.remedy,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Diagnose(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('farmId: $farmId, ')
          ..write('subject: $subject, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('remedy: $remedy, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    remoteId,
    farmId,
    subject,
    diagnosis,
    remedy,
    source,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Diagnose &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.farmId == this.farmId &&
          other.subject == this.subject &&
          other.diagnosis == this.diagnosis &&
          other.remedy == this.remedy &&
          other.source == this.source &&
          other.createdAt == this.createdAt);
}

class DiagnosesCompanion extends UpdateCompanion<Diagnose> {
  final Value<int> id;
  final Value<String?> remoteId;
  final Value<String> farmId;
  final Value<String> subject;
  final Value<String> diagnosis;
  final Value<String> remedy;
  final Value<String> source;
  final Value<DateTime> createdAt;
  const DiagnosesCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.farmId = const Value.absent(),
    this.subject = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.remedy = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DiagnosesCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String farmId,
    required String subject,
    required String diagnosis,
    required String remedy,
    required String source,
    required DateTime createdAt,
  }) : farmId = Value(farmId),
       subject = Value(subject),
       diagnosis = Value(diagnosis),
       remedy = Value(remedy),
       source = Value(source),
       createdAt = Value(createdAt);
  static Insertable<Diagnose> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? farmId,
    Expression<String>? subject,
    Expression<String>? diagnosis,
    Expression<String>? remedy,
    Expression<String>? source,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (farmId != null) 'farm_id': farmId,
      if (subject != null) 'subject': subject,
      if (diagnosis != null) 'diagnosis': diagnosis,
      if (remedy != null) 'remedy': remedy,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DiagnosesCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<String>? farmId,
    Value<String>? subject,
    Value<String>? diagnosis,
    Value<String>? remedy,
    Value<String>? source,
    Value<DateTime>? createdAt,
  }) {
    return DiagnosesCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      farmId: farmId ?? this.farmId,
      subject: subject ?? this.subject,
      diagnosis: diagnosis ?? this.diagnosis,
      remedy: remedy ?? this.remedy,
      source: source ?? this.source,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (farmId.present) {
      map['farm_id'] = Variable<String>(farmId.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (diagnosis.present) {
      map['diagnosis'] = Variable<String>(diagnosis.value);
    }
    if (remedy.present) {
      map['remedy'] = Variable<String>(remedy.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiagnosesCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('farmId: $farmId, ')
          ..write('subject: $subject, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('remedy: $remedy, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MarketPricesTable extends MarketPrices
    with TableInfo<$MarketPricesTable, MarketPrice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MarketPricesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cropMeta = const VerificationMeta('crop');
  @override
  late final GeneratedColumn<String> crop = GeneratedColumn<String>(
    'crop',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mandiMeta = const VerificationMeta('mandi');
  @override
  late final GeneratedColumn<String> mandi = GeneratedColumn<String>(
    'mandi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pricePerQuintalMeta = const VerificationMeta(
    'pricePerQuintal',
  );
  @override
  late final GeneratedColumn<int> pricePerQuintal = GeneratedColumn<int>(
    'price_per_quintal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deltaMeta = const VerificationMeta('delta');
  @override
  late final GeneratedColumn<int> delta = GeneratedColumn<int>(
    'delta',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _observedAtMeta = const VerificationMeta(
    'observedAt',
  );
  @override
  late final GeneratedColumn<DateTime> observedAt = GeneratedColumn<DateTime>(
    'observed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    crop,
    mandi,
    pricePerQuintal,
    delta,
    observedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'market_prices';
  @override
  VerificationContext validateIntegrity(
    Insertable<MarketPrice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('crop')) {
      context.handle(
        _cropMeta,
        crop.isAcceptableOrUnknown(data['crop']!, _cropMeta),
      );
    } else if (isInserting) {
      context.missing(_cropMeta);
    }
    if (data.containsKey('mandi')) {
      context.handle(
        _mandiMeta,
        mandi.isAcceptableOrUnknown(data['mandi']!, _mandiMeta),
      );
    } else if (isInserting) {
      context.missing(_mandiMeta);
    }
    if (data.containsKey('price_per_quintal')) {
      context.handle(
        _pricePerQuintalMeta,
        pricePerQuintal.isAcceptableOrUnknown(
          data['price_per_quintal']!,
          _pricePerQuintalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pricePerQuintalMeta);
    }
    if (data.containsKey('delta')) {
      context.handle(
        _deltaMeta,
        delta.isAcceptableOrUnknown(data['delta']!, _deltaMeta),
      );
    } else if (isInserting) {
      context.missing(_deltaMeta);
    }
    if (data.containsKey('observed_at')) {
      context.handle(
        _observedAtMeta,
        observedAt.isAcceptableOrUnknown(data['observed_at']!, _observedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_observedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MarketPrice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MarketPrice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      crop: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}crop'],
      )!,
      mandi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mandi'],
      )!,
      pricePerQuintal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price_per_quintal'],
      )!,
      delta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}delta'],
      )!,
      observedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}observed_at'],
      )!,
    );
  }

  @override
  $MarketPricesTable createAlias(String alias) {
    return $MarketPricesTable(attachedDatabase, alias);
  }
}

class MarketPrice extends DataClass implements Insertable<MarketPrice> {
  final int id;
  final String? remoteId;
  final String crop;
  final String mandi;
  final int pricePerQuintal;
  final int delta;
  final DateTime observedAt;
  const MarketPrice({
    required this.id,
    this.remoteId,
    required this.crop,
    required this.mandi,
    required this.pricePerQuintal,
    required this.delta,
    required this.observedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['crop'] = Variable<String>(crop);
    map['mandi'] = Variable<String>(mandi);
    map['price_per_quintal'] = Variable<int>(pricePerQuintal);
    map['delta'] = Variable<int>(delta);
    map['observed_at'] = Variable<DateTime>(observedAt);
    return map;
  }

  MarketPricesCompanion toCompanion(bool nullToAbsent) {
    return MarketPricesCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      crop: Value(crop),
      mandi: Value(mandi),
      pricePerQuintal: Value(pricePerQuintal),
      delta: Value(delta),
      observedAt: Value(observedAt),
    );
  }

  factory MarketPrice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MarketPrice(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      crop: serializer.fromJson<String>(json['crop']),
      mandi: serializer.fromJson<String>(json['mandi']),
      pricePerQuintal: serializer.fromJson<int>(json['pricePerQuintal']),
      delta: serializer.fromJson<int>(json['delta']),
      observedAt: serializer.fromJson<DateTime>(json['observedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'crop': serializer.toJson<String>(crop),
      'mandi': serializer.toJson<String>(mandi),
      'pricePerQuintal': serializer.toJson<int>(pricePerQuintal),
      'delta': serializer.toJson<int>(delta),
      'observedAt': serializer.toJson<DateTime>(observedAt),
    };
  }

  MarketPrice copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    String? crop,
    String? mandi,
    int? pricePerQuintal,
    int? delta,
    DateTime? observedAt,
  }) => MarketPrice(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    crop: crop ?? this.crop,
    mandi: mandi ?? this.mandi,
    pricePerQuintal: pricePerQuintal ?? this.pricePerQuintal,
    delta: delta ?? this.delta,
    observedAt: observedAt ?? this.observedAt,
  );
  MarketPrice copyWithCompanion(MarketPricesCompanion data) {
    return MarketPrice(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      crop: data.crop.present ? data.crop.value : this.crop,
      mandi: data.mandi.present ? data.mandi.value : this.mandi,
      pricePerQuintal: data.pricePerQuintal.present
          ? data.pricePerQuintal.value
          : this.pricePerQuintal,
      delta: data.delta.present ? data.delta.value : this.delta,
      observedAt: data.observedAt.present
          ? data.observedAt.value
          : this.observedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MarketPrice(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('crop: $crop, ')
          ..write('mandi: $mandi, ')
          ..write('pricePerQuintal: $pricePerQuintal, ')
          ..write('delta: $delta, ')
          ..write('observedAt: $observedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    remoteId,
    crop,
    mandi,
    pricePerQuintal,
    delta,
    observedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MarketPrice &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.crop == this.crop &&
          other.mandi == this.mandi &&
          other.pricePerQuintal == this.pricePerQuintal &&
          other.delta == this.delta &&
          other.observedAt == this.observedAt);
}

class MarketPricesCompanion extends UpdateCompanion<MarketPrice> {
  final Value<int> id;
  final Value<String?> remoteId;
  final Value<String> crop;
  final Value<String> mandi;
  final Value<int> pricePerQuintal;
  final Value<int> delta;
  final Value<DateTime> observedAt;
  const MarketPricesCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.crop = const Value.absent(),
    this.mandi = const Value.absent(),
    this.pricePerQuintal = const Value.absent(),
    this.delta = const Value.absent(),
    this.observedAt = const Value.absent(),
  });
  MarketPricesCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String crop,
    required String mandi,
    required int pricePerQuintal,
    required int delta,
    required DateTime observedAt,
  }) : crop = Value(crop),
       mandi = Value(mandi),
       pricePerQuintal = Value(pricePerQuintal),
       delta = Value(delta),
       observedAt = Value(observedAt);
  static Insertable<MarketPrice> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? crop,
    Expression<String>? mandi,
    Expression<int>? pricePerQuintal,
    Expression<int>? delta,
    Expression<DateTime>? observedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (crop != null) 'crop': crop,
      if (mandi != null) 'mandi': mandi,
      if (pricePerQuintal != null) 'price_per_quintal': pricePerQuintal,
      if (delta != null) 'delta': delta,
      if (observedAt != null) 'observed_at': observedAt,
    });
  }

  MarketPricesCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<String>? crop,
    Value<String>? mandi,
    Value<int>? pricePerQuintal,
    Value<int>? delta,
    Value<DateTime>? observedAt,
  }) {
    return MarketPricesCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      crop: crop ?? this.crop,
      mandi: mandi ?? this.mandi,
      pricePerQuintal: pricePerQuintal ?? this.pricePerQuintal,
      delta: delta ?? this.delta,
      observedAt: observedAt ?? this.observedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (crop.present) {
      map['crop'] = Variable<String>(crop.value);
    }
    if (mandi.present) {
      map['mandi'] = Variable<String>(mandi.value);
    }
    if (pricePerQuintal.present) {
      map['price_per_quintal'] = Variable<int>(pricePerQuintal.value);
    }
    if (delta.present) {
      map['delta'] = Variable<int>(delta.value);
    }
    if (observedAt.present) {
      map['observed_at'] = Variable<DateTime>(observedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarketPricesCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('crop: $crop, ')
          ..write('mandi: $mandi, ')
          ..write('pricePerQuintal: $pricePerQuintal, ')
          ..write('delta: $delta, ')
          ..write('observedAt: $observedAt')
          ..write(')'))
        .toString();
  }
}

class $WeatherCacheTable extends WeatherCache
    with TableInfo<$WeatherCacheTable, WeatherCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _temperatureMeta = const VerificationMeta(
    'temperature',
  );
  @override
  late final GeneratedColumn<String> temperature = GeneratedColumn<String>(
    'temperature',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _humidityMeta = const VerificationMeta(
    'humidity',
  );
  @override
  late final GeneratedColumn<int> humidity = GeneratedColumn<int>(
    'humidity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rainChanceMeta = const VerificationMeta(
    'rainChance',
  );
  @override
  late final GeneratedColumn<int> rainChance = GeneratedColumn<int>(
    'rain_chance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _observedAtMeta = const VerificationMeta(
    'observedAt',
  );
  @override
  late final GeneratedColumn<DateTime> observedAt = GeneratedColumn<DateTime>(
    'observed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    location,
    temperature,
    summary,
    humidity,
    rainChance,
    observedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weather_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeatherCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('temperature')) {
      context.handle(
        _temperatureMeta,
        temperature.isAcceptableOrUnknown(
          data['temperature']!,
          _temperatureMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_temperatureMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('humidity')) {
      context.handle(
        _humidityMeta,
        humidity.isAcceptableOrUnknown(data['humidity']!, _humidityMeta),
      );
    } else if (isInserting) {
      context.missing(_humidityMeta);
    }
    if (data.containsKey('rain_chance')) {
      context.handle(
        _rainChanceMeta,
        rainChance.isAcceptableOrUnknown(data['rain_chance']!, _rainChanceMeta),
      );
    } else if (isInserting) {
      context.missing(_rainChanceMeta);
    }
    if (data.containsKey('observed_at')) {
      context.handle(
        _observedAtMeta,
        observedAt.isAcceptableOrUnknown(data['observed_at']!, _observedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_observedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeatherCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherCacheData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      temperature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}temperature'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      )!,
      humidity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}humidity'],
      )!,
      rainChance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rain_chance'],
      )!,
      observedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}observed_at'],
      )!,
    );
  }

  @override
  $WeatherCacheTable createAlias(String alias) {
    return $WeatherCacheTable(attachedDatabase, alias);
  }
}

class WeatherCacheData extends DataClass
    implements Insertable<WeatherCacheData> {
  final int id;
  final String? remoteId;
  final String location;
  final String temperature;
  final String summary;
  final int humidity;
  final int rainChance;
  final DateTime observedAt;
  const WeatherCacheData({
    required this.id,
    this.remoteId,
    required this.location,
    required this.temperature,
    required this.summary,
    required this.humidity,
    required this.rainChance,
    required this.observedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['location'] = Variable<String>(location);
    map['temperature'] = Variable<String>(temperature);
    map['summary'] = Variable<String>(summary);
    map['humidity'] = Variable<int>(humidity);
    map['rain_chance'] = Variable<int>(rainChance);
    map['observed_at'] = Variable<DateTime>(observedAt);
    return map;
  }

  WeatherCacheCompanion toCompanion(bool nullToAbsent) {
    return WeatherCacheCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      location: Value(location),
      temperature: Value(temperature),
      summary: Value(summary),
      humidity: Value(humidity),
      rainChance: Value(rainChance),
      observedAt: Value(observedAt),
    );
  }

  factory WeatherCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherCacheData(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      location: serializer.fromJson<String>(json['location']),
      temperature: serializer.fromJson<String>(json['temperature']),
      summary: serializer.fromJson<String>(json['summary']),
      humidity: serializer.fromJson<int>(json['humidity']),
      rainChance: serializer.fromJson<int>(json['rainChance']),
      observedAt: serializer.fromJson<DateTime>(json['observedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'location': serializer.toJson<String>(location),
      'temperature': serializer.toJson<String>(temperature),
      'summary': serializer.toJson<String>(summary),
      'humidity': serializer.toJson<int>(humidity),
      'rainChance': serializer.toJson<int>(rainChance),
      'observedAt': serializer.toJson<DateTime>(observedAt),
    };
  }

  WeatherCacheData copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    String? location,
    String? temperature,
    String? summary,
    int? humidity,
    int? rainChance,
    DateTime? observedAt,
  }) => WeatherCacheData(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    location: location ?? this.location,
    temperature: temperature ?? this.temperature,
    summary: summary ?? this.summary,
    humidity: humidity ?? this.humidity,
    rainChance: rainChance ?? this.rainChance,
    observedAt: observedAt ?? this.observedAt,
  );
  WeatherCacheData copyWithCompanion(WeatherCacheCompanion data) {
    return WeatherCacheData(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      location: data.location.present ? data.location.value : this.location,
      temperature: data.temperature.present
          ? data.temperature.value
          : this.temperature,
      summary: data.summary.present ? data.summary.value : this.summary,
      humidity: data.humidity.present ? data.humidity.value : this.humidity,
      rainChance: data.rainChance.present
          ? data.rainChance.value
          : this.rainChance,
      observedAt: data.observedAt.present
          ? data.observedAt.value
          : this.observedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeatherCacheData(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('location: $location, ')
          ..write('temperature: $temperature, ')
          ..write('summary: $summary, ')
          ..write('humidity: $humidity, ')
          ..write('rainChance: $rainChance, ')
          ..write('observedAt: $observedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    remoteId,
    location,
    temperature,
    summary,
    humidity,
    rainChance,
    observedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherCacheData &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.location == this.location &&
          other.temperature == this.temperature &&
          other.summary == this.summary &&
          other.humidity == this.humidity &&
          other.rainChance == this.rainChance &&
          other.observedAt == this.observedAt);
}

class WeatherCacheCompanion extends UpdateCompanion<WeatherCacheData> {
  final Value<int> id;
  final Value<String?> remoteId;
  final Value<String> location;
  final Value<String> temperature;
  final Value<String> summary;
  final Value<int> humidity;
  final Value<int> rainChance;
  final Value<DateTime> observedAt;
  const WeatherCacheCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.location = const Value.absent(),
    this.temperature = const Value.absent(),
    this.summary = const Value.absent(),
    this.humidity = const Value.absent(),
    this.rainChance = const Value.absent(),
    this.observedAt = const Value.absent(),
  });
  WeatherCacheCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String location,
    required String temperature,
    required String summary,
    required int humidity,
    required int rainChance,
    required DateTime observedAt,
  }) : location = Value(location),
       temperature = Value(temperature),
       summary = Value(summary),
       humidity = Value(humidity),
       rainChance = Value(rainChance),
       observedAt = Value(observedAt);
  static Insertable<WeatherCacheData> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? location,
    Expression<String>? temperature,
    Expression<String>? summary,
    Expression<int>? humidity,
    Expression<int>? rainChance,
    Expression<DateTime>? observedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (location != null) 'location': location,
      if (temperature != null) 'temperature': temperature,
      if (summary != null) 'summary': summary,
      if (humidity != null) 'humidity': humidity,
      if (rainChance != null) 'rain_chance': rainChance,
      if (observedAt != null) 'observed_at': observedAt,
    });
  }

  WeatherCacheCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<String>? location,
    Value<String>? temperature,
    Value<String>? summary,
    Value<int>? humidity,
    Value<int>? rainChance,
    Value<DateTime>? observedAt,
  }) {
    return WeatherCacheCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
      summary: summary ?? this.summary,
      humidity: humidity ?? this.humidity,
      rainChance: rainChance ?? this.rainChance,
      observedAt: observedAt ?? this.observedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<String>(temperature.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<int>(humidity.value);
    }
    if (rainChance.present) {
      map['rain_chance'] = Variable<int>(rainChance.value);
    }
    if (observedAt.present) {
      map['observed_at'] = Variable<DateTime>(observedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherCacheCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('location: $location, ')
          ..write('temperature: $temperature, ')
          ..write('summary: $summary, ')
          ..write('humidity: $humidity, ')
          ..write('rainChance: $rainChance, ')
          ..write('observedAt: $observedAt')
          ..write(')'))
        .toString();
  }
}

class $RoadmapTasksTable extends RoadmapTasks
    with TableInfo<$RoadmapTasksTable, RoadmapTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoadmapTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weekLabelMeta = const VerificationMeta(
    'weekLabel',
  );
  @override
  late final GeneratedColumn<String> weekLabel = GeneratedColumn<String>(
    'week_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailsMeta = const VerificationMeta(
    'details',
  );
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
    'details',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    weekLabel,
    title,
    details,
    isDone,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roadmap_tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoadmapTask> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('week_label')) {
      context.handle(
        _weekLabelMeta,
        weekLabel.isAcceptableOrUnknown(data['week_label']!, _weekLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_weekLabelMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('details')) {
      context.handle(
        _detailsMeta,
        details.isAcceptableOrUnknown(data['details']!, _detailsMeta),
      );
    } else if (isInserting) {
      context.missing(_detailsMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoadmapTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoadmapTask(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      weekLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}week_label'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      details: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}details'],
      )!,
      isDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_done'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RoadmapTasksTable createAlias(String alias) {
    return $RoadmapTasksTable(attachedDatabase, alias);
  }
}

class RoadmapTask extends DataClass implements Insertable<RoadmapTask> {
  final int id;
  final String? remoteId;
  final String weekLabel;
  final String title;
  final String details;
  final bool isDone;
  final DateTime updatedAt;
  const RoadmapTask({
    required this.id,
    this.remoteId,
    required this.weekLabel,
    required this.title,
    required this.details,
    required this.isDone,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['week_label'] = Variable<String>(weekLabel);
    map['title'] = Variable<String>(title);
    map['details'] = Variable<String>(details);
    map['is_done'] = Variable<bool>(isDone);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RoadmapTasksCompanion toCompanion(bool nullToAbsent) {
    return RoadmapTasksCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      weekLabel: Value(weekLabel),
      title: Value(title),
      details: Value(details),
      isDone: Value(isDone),
      updatedAt: Value(updatedAt),
    );
  }

  factory RoadmapTask.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoadmapTask(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      weekLabel: serializer.fromJson<String>(json['weekLabel']),
      title: serializer.fromJson<String>(json['title']),
      details: serializer.fromJson<String>(json['details']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'weekLabel': serializer.toJson<String>(weekLabel),
      'title': serializer.toJson<String>(title),
      'details': serializer.toJson<String>(details),
      'isDone': serializer.toJson<bool>(isDone),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RoadmapTask copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    String? weekLabel,
    String? title,
    String? details,
    bool? isDone,
    DateTime? updatedAt,
  }) => RoadmapTask(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    weekLabel: weekLabel ?? this.weekLabel,
    title: title ?? this.title,
    details: details ?? this.details,
    isDone: isDone ?? this.isDone,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RoadmapTask copyWithCompanion(RoadmapTasksCompanion data) {
    return RoadmapTask(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      weekLabel: data.weekLabel.present ? data.weekLabel.value : this.weekLabel,
      title: data.title.present ? data.title.value : this.title,
      details: data.details.present ? data.details.value : this.details,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapTask(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('weekLabel: $weekLabel, ')
          ..write('title: $title, ')
          ..write('details: $details, ')
          ..write('isDone: $isDone, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, remoteId, weekLabel, title, details, isDone, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoadmapTask &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.weekLabel == this.weekLabel &&
          other.title == this.title &&
          other.details == this.details &&
          other.isDone == this.isDone &&
          other.updatedAt == this.updatedAt);
}

class RoadmapTasksCompanion extends UpdateCompanion<RoadmapTask> {
  final Value<int> id;
  final Value<String?> remoteId;
  final Value<String> weekLabel;
  final Value<String> title;
  final Value<String> details;
  final Value<bool> isDone;
  final Value<DateTime> updatedAt;
  const RoadmapTasksCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.weekLabel = const Value.absent(),
    this.title = const Value.absent(),
    this.details = const Value.absent(),
    this.isDone = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RoadmapTasksCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String weekLabel,
    required String title,
    required String details,
    this.isDone = const Value.absent(),
    required DateTime updatedAt,
  }) : weekLabel = Value(weekLabel),
       title = Value(title),
       details = Value(details),
       updatedAt = Value(updatedAt);
  static Insertable<RoadmapTask> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? weekLabel,
    Expression<String>? title,
    Expression<String>? details,
    Expression<bool>? isDone,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (weekLabel != null) 'week_label': weekLabel,
      if (title != null) 'title': title,
      if (details != null) 'details': details,
      if (isDone != null) 'is_done': isDone,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RoadmapTasksCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<String>? weekLabel,
    Value<String>? title,
    Value<String>? details,
    Value<bool>? isDone,
    Value<DateTime>? updatedAt,
  }) {
    return RoadmapTasksCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      weekLabel: weekLabel ?? this.weekLabel,
      title: title ?? this.title,
      details: details ?? this.details,
      isDone: isDone ?? this.isDone,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (weekLabel.present) {
      map['week_label'] = Variable<String>(weekLabel.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapTasksCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('weekLabel: $weekLabel, ')
          ..write('title: $title, ')
          ..write('details: $details, ')
          ..write('isDone: $isDone, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ChatHistoryTable extends ChatHistory
    with TableInfo<$ChatHistoryTable, ChatHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    role,
    message,
    source,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ChatHistoryTable createAlias(String alias) {
    return $ChatHistoryTable(attachedDatabase, alias);
  }
}

class ChatHistoryData extends DataClass implements Insertable<ChatHistoryData> {
  final int id;
  final String? remoteId;
  final String role;
  final String message;
  final String source;
  final DateTime createdAt;
  const ChatHistoryData({
    required this.id,
    this.remoteId,
    required this.role,
    required this.message,
    required this.source,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['role'] = Variable<String>(role);
    map['message'] = Variable<String>(message);
    map['source'] = Variable<String>(source);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ChatHistoryCompanion toCompanion(bool nullToAbsent) {
    return ChatHistoryCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      role: Value(role),
      message: Value(message),
      source: Value(source),
      createdAt: Value(createdAt),
    );
  }

  factory ChatHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatHistoryData(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      role: serializer.fromJson<String>(json['role']),
      message: serializer.fromJson<String>(json['message']),
      source: serializer.fromJson<String>(json['source']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'role': serializer.toJson<String>(role),
      'message': serializer.toJson<String>(message),
      'source': serializer.toJson<String>(source),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ChatHistoryData copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    String? role,
    String? message,
    String? source,
    DateTime? createdAt,
  }) => ChatHistoryData(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    role: role ?? this.role,
    message: message ?? this.message,
    source: source ?? this.source,
    createdAt: createdAt ?? this.createdAt,
  );
  ChatHistoryData copyWithCompanion(ChatHistoryCompanion data) {
    return ChatHistoryData(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      role: data.role.present ? data.role.value : this.role,
      message: data.message.present ? data.message.value : this.message,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatHistoryData(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('role: $role, ')
          ..write('message: $message, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, remoteId, role, message, source, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatHistoryData &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.role == this.role &&
          other.message == this.message &&
          other.source == this.source &&
          other.createdAt == this.createdAt);
}

class ChatHistoryCompanion extends UpdateCompanion<ChatHistoryData> {
  final Value<int> id;
  final Value<String?> remoteId;
  final Value<String> role;
  final Value<String> message;
  final Value<String> source;
  final Value<DateTime> createdAt;
  const ChatHistoryCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.role = const Value.absent(),
    this.message = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ChatHistoryCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String role,
    required String message,
    required String source,
    required DateTime createdAt,
  }) : role = Value(role),
       message = Value(message),
       source = Value(source),
       createdAt = Value(createdAt);
  static Insertable<ChatHistoryData> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? role,
    Expression<String>? message,
    Expression<String>? source,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (role != null) 'role': role,
      if (message != null) 'message': message,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ChatHistoryCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<String>? role,
    Value<String>? message,
    Value<String>? source,
    Value<DateTime>? createdAt,
  }) {
    return ChatHistoryCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      role: role ?? this.role,
      message: message ?? this.message,
      source: source ?? this.source,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatHistoryCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('role: $role, ')
          ..write('message: $message, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
    'entity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _queuedAtMeta = const VerificationMeta(
    'queuedAt',
  );
  @override
  late final GeneratedColumn<DateTime> queuedAt = GeneratedColumn<DateTime>(
    'queued_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entity,
    operation,
    payload,
    queuedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity')) {
      context.handle(
        _entityMeta,
        entity.isAcceptableOrUnknown(data['entity']!, _entityMeta),
      );
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('queued_at')) {
      context.handle(
        _queuedAtMeta,
        queuedAt.isAcceptableOrUnknown(data['queued_at']!, _queuedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_queuedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      queuedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}queued_at'],
      )!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final int id;
  final String entity;
  final String operation;
  final String payload;
  final DateTime queuedAt;
  const SyncQueueData({
    required this.id,
    required this.entity,
    required this.operation,
    required this.payload,
    required this.queuedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity'] = Variable<String>(entity);
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['queued_at'] = Variable<DateTime>(queuedAt);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      entity: Value(entity),
      operation: Value(operation),
      payload: Value(payload),
      queuedAt: Value(queuedAt),
    );
  }

  factory SyncQueueData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<int>(json['id']),
      entity: serializer.fromJson<String>(json['entity']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      queuedAt: serializer.fromJson<DateTime>(json['queuedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entity': serializer.toJson<String>(entity),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'queuedAt': serializer.toJson<DateTime>(queuedAt),
    };
  }

  SyncQueueData copyWith({
    int? id,
    String? entity,
    String? operation,
    String? payload,
    DateTime? queuedAt,
  }) => SyncQueueData(
    id: id ?? this.id,
    entity: entity ?? this.entity,
    operation: operation ?? this.operation,
    payload: payload ?? this.payload,
    queuedAt: queuedAt ?? this.queuedAt,
  );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      entity: data.entity.present ? data.entity.value : this.entity,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      queuedAt: data.queuedAt.present ? data.queuedAt.value : this.queuedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('entity: $entity, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('queuedAt: $queuedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entity, operation, payload, queuedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.entity == this.entity &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.queuedAt == this.queuedAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<int> id;
  final Value<String> entity;
  final Value<String> operation;
  final Value<String> payload;
  final Value<DateTime> queuedAt;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.entity = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.queuedAt = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String entity,
    required String operation,
    required String payload,
    required DateTime queuedAt,
  }) : entity = Value(entity),
       operation = Value(operation),
       payload = Value(payload),
       queuedAt = Value(queuedAt);
  static Insertable<SyncQueueData> custom({
    Expression<int>? id,
    Expression<String>? entity,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<DateTime>? queuedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entity != null) 'entity': entity,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (queuedAt != null) 'queued_at': queuedAt,
    });
  }

  SyncQueueCompanion copyWith({
    Value<int>? id,
    Value<String>? entity,
    Value<String>? operation,
    Value<String>? payload,
    Value<DateTime>? queuedAt,
  }) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      entity: entity ?? this.entity,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      queuedAt: queuedAt ?? this.queuedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (queuedAt.present) {
      map['queued_at'] = Variable<DateTime>(queuedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('entity: $entity, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('queuedAt: $queuedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sellerMeta = const VerificationMeta('seller');
  @override
  late final GeneratedColumn<String> seller = GeneratedColumn<String>(
    'seller',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceLabelMeta = const VerificationMeta(
    'priceLabel',
  );
  @override
  late final GeneratedColumn<String> priceLabel = GeneratedColumn<String>(
    'price_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailMeta = const VerificationMeta('detail');
  @override
  late final GeneratedColumn<String> detail = GeneratedColumn<String>(
    'detail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    name,
    seller,
    priceLabel,
    category,
    detail,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('seller')) {
      context.handle(
        _sellerMeta,
        seller.isAcceptableOrUnknown(data['seller']!, _sellerMeta),
      );
    } else if (isInserting) {
      context.missing(_sellerMeta);
    }
    if (data.containsKey('price_label')) {
      context.handle(
        _priceLabelMeta,
        priceLabel.isAcceptableOrUnknown(data['price_label']!, _priceLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_priceLabelMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('detail')) {
      context.handle(
        _detailMeta,
        detail.isAcceptableOrUnknown(data['detail']!, _detailMeta),
      );
    } else if (isInserting) {
      context.missing(_detailMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      seller: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}seller'],
      )!,
      priceLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price_label'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      detail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detail'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String? remoteId;
  final String name;
  final String seller;
  final String priceLabel;
  final String category;
  final String detail;
  final DateTime updatedAt;
  const Product({
    required this.id,
    this.remoteId,
    required this.name,
    required this.seller,
    required this.priceLabel,
    required this.category,
    required this.detail,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['name'] = Variable<String>(name);
    map['seller'] = Variable<String>(seller);
    map['price_label'] = Variable<String>(priceLabel);
    map['category'] = Variable<String>(category);
    map['detail'] = Variable<String>(detail);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      name: Value(name),
      seller: Value(seller),
      priceLabel: Value(priceLabel),
      category: Value(category),
      detail: Value(detail),
      updatedAt: Value(updatedAt),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      name: serializer.fromJson<String>(json['name']),
      seller: serializer.fromJson<String>(json['seller']),
      priceLabel: serializer.fromJson<String>(json['priceLabel']),
      category: serializer.fromJson<String>(json['category']),
      detail: serializer.fromJson<String>(json['detail']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'name': serializer.toJson<String>(name),
      'seller': serializer.toJson<String>(seller),
      'priceLabel': serializer.toJson<String>(priceLabel),
      'category': serializer.toJson<String>(category),
      'detail': serializer.toJson<String>(detail),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Product copyWith({
    int? id,
    Value<String?> remoteId = const Value.absent(),
    String? name,
    String? seller,
    String? priceLabel,
    String? category,
    String? detail,
    DateTime? updatedAt,
  }) => Product(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    name: name ?? this.name,
    seller: seller ?? this.seller,
    priceLabel: priceLabel ?? this.priceLabel,
    category: category ?? this.category,
    detail: detail ?? this.detail,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      name: data.name.present ? data.name.value : this.name,
      seller: data.seller.present ? data.seller.value : this.seller,
      priceLabel: data.priceLabel.present
          ? data.priceLabel.value
          : this.priceLabel,
      category: data.category.present ? data.category.value : this.category,
      detail: data.detail.present ? data.detail.value : this.detail,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('seller: $seller, ')
          ..write('priceLabel: $priceLabel, ')
          ..write('category: $category, ')
          ..write('detail: $detail, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    remoteId,
    name,
    seller,
    priceLabel,
    category,
    detail,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.name == this.name &&
          other.seller == this.seller &&
          other.priceLabel == this.priceLabel &&
          other.category == this.category &&
          other.detail == this.detail &&
          other.updatedAt == this.updatedAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String?> remoteId;
  final Value<String> name;
  final Value<String> seller;
  final Value<String> priceLabel;
  final Value<String> category;
  final Value<String> detail;
  final Value<DateTime> updatedAt;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.name = const Value.absent(),
    this.seller = const Value.absent(),
    this.priceLabel = const Value.absent(),
    this.category = const Value.absent(),
    this.detail = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String name,
    required String seller,
    required String priceLabel,
    required String category,
    required String detail,
    required DateTime updatedAt,
  }) : name = Value(name),
       seller = Value(seller),
       priceLabel = Value(priceLabel),
       category = Value(category),
       detail = Value(detail),
       updatedAt = Value(updatedAt);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? name,
    Expression<String>? seller,
    Expression<String>? priceLabel,
    Expression<String>? category,
    Expression<String>? detail,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (name != null) 'name': name,
      if (seller != null) 'seller': seller,
      if (priceLabel != null) 'price_label': priceLabel,
      if (category != null) 'category': category,
      if (detail != null) 'detail': detail,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProductsCompanion copyWith({
    Value<int>? id,
    Value<String?>? remoteId,
    Value<String>? name,
    Value<String>? seller,
    Value<String>? priceLabel,
    Value<String>? category,
    Value<String>? detail,
    Value<DateTime>? updatedAt,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      name: name ?? this.name,
      seller: seller ?? this.seller,
      priceLabel: priceLabel ?? this.priceLabel,
      category: category ?? this.category,
      detail: detail ?? this.detail,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (seller.present) {
      map['seller'] = Variable<String>(seller.value);
    }
    if (priceLabel.present) {
      map['price_label'] = Variable<String>(priceLabel.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String>(detail.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('seller: $seller, ')
          ..write('priceLabel: $priceLabel, ')
          ..write('category: $category, ')
          ..write('detail: $detail, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FarmsTable farms = $FarmsTable(this);
  late final $DiagnosesTable diagnoses = $DiagnosesTable(this);
  late final $MarketPricesTable marketPrices = $MarketPricesTable(this);
  late final $WeatherCacheTable weatherCache = $WeatherCacheTable(this);
  late final $RoadmapTasksTable roadmapTasks = $RoadmapTasksTable(this);
  late final $ChatHistoryTable chatHistory = $ChatHistoryTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final FarmsDao farmsDao = FarmsDao(this as AppDatabase);
  late final MarketPricesDao marketPricesDao = MarketPricesDao(
    this as AppDatabase,
  );
  late final WeatherCacheDao weatherCacheDao = WeatherCacheDao(
    this as AppDatabase,
  );
  late final SyncQueueDao syncQueueDao = SyncQueueDao(this as AppDatabase);
  late final RemoteReconciliationDao remoteReconciliationDao =
      RemoteReconciliationDao(this as AppDatabase);
  late final RoadmapDao roadmapDao = RoadmapDao(this as AppDatabase);
  late final ProductsDao productsDao = ProductsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    farms,
    diagnoses,
    marketPrices,
    weatherCache,
    roadmapTasks,
    chatHistory,
    syncQueue,
    products,
  ];
}

typedef $$FarmsTableCreateCompanionBuilder =
    FarmsCompanion Function({
      Value<int> id,
      required String name,
      required String place,
      required double sizeHectares,
      required String primaryCrop,
      required double latitude,
      required double longitude,
      required DateTime updatedAt,
    });
typedef $$FarmsTableUpdateCompanionBuilder =
    FarmsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> place,
      Value<double> sizeHectares,
      Value<String> primaryCrop,
      Value<double> latitude,
      Value<double> longitude,
      Value<DateTime> updatedAt,
    });

class $$FarmsTableFilterComposer extends Composer<_$AppDatabase, $FarmsTable> {
  $$FarmsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get place => $composableBuilder(
    column: $table.place,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sizeHectares => $composableBuilder(
    column: $table.sizeHectares,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get primaryCrop => $composableBuilder(
    column: $table.primaryCrop,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FarmsTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmsTable> {
  $$FarmsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get place => $composableBuilder(
    column: $table.place,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sizeHectares => $composableBuilder(
    column: $table.sizeHectares,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get primaryCrop => $composableBuilder(
    column: $table.primaryCrop,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FarmsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmsTable> {
  $$FarmsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get place =>
      $composableBuilder(column: $table.place, builder: (column) => column);

  GeneratedColumn<double> get sizeHectares => $composableBuilder(
    column: $table.sizeHectares,
    builder: (column) => column,
  );

  GeneratedColumn<String> get primaryCrop => $composableBuilder(
    column: $table.primaryCrop,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FarmsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmsTable,
          Farm,
          $$FarmsTableFilterComposer,
          $$FarmsTableOrderingComposer,
          $$FarmsTableAnnotationComposer,
          $$FarmsTableCreateCompanionBuilder,
          $$FarmsTableUpdateCompanionBuilder,
          (Farm, BaseReferences<_$AppDatabase, $FarmsTable, Farm>),
          Farm,
          PrefetchHooks Function()
        > {
  $$FarmsTableTableManager(_$AppDatabase db, $FarmsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> place = const Value.absent(),
                Value<double> sizeHectares = const Value.absent(),
                Value<String> primaryCrop = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => FarmsCompanion(
                id: id,
                name: name,
                place: place,
                sizeHectares: sizeHectares,
                primaryCrop: primaryCrop,
                latitude: latitude,
                longitude: longitude,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String place,
                required double sizeHectares,
                required String primaryCrop,
                required double latitude,
                required double longitude,
                required DateTime updatedAt,
              }) => FarmsCompanion.insert(
                id: id,
                name: name,
                place: place,
                sizeHectares: sizeHectares,
                primaryCrop: primaryCrop,
                latitude: latitude,
                longitude: longitude,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FarmsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmsTable,
      Farm,
      $$FarmsTableFilterComposer,
      $$FarmsTableOrderingComposer,
      $$FarmsTableAnnotationComposer,
      $$FarmsTableCreateCompanionBuilder,
      $$FarmsTableUpdateCompanionBuilder,
      (Farm, BaseReferences<_$AppDatabase, $FarmsTable, Farm>),
      Farm,
      PrefetchHooks Function()
    >;
typedef $$DiagnosesTableCreateCompanionBuilder =
    DiagnosesCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      required String farmId,
      required String subject,
      required String diagnosis,
      required String remedy,
      required String source,
      required DateTime createdAt,
    });
typedef $$DiagnosesTableUpdateCompanionBuilder =
    DiagnosesCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      Value<String> farmId,
      Value<String> subject,
      Value<String> diagnosis,
      Value<String> remedy,
      Value<String> source,
      Value<DateTime> createdAt,
    });

class $$DiagnosesTableFilterComposer
    extends Composer<_$AppDatabase, $DiagnosesTable> {
  $$DiagnosesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get farmId => $composableBuilder(
    column: $table.farmId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subject => $composableBuilder(
    column: $table.subject,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diagnosis => $composableBuilder(
    column: $table.diagnosis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remedy => $composableBuilder(
    column: $table.remedy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DiagnosesTableOrderingComposer
    extends Composer<_$AppDatabase, $DiagnosesTable> {
  $$DiagnosesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get farmId => $composableBuilder(
    column: $table.farmId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subject => $composableBuilder(
    column: $table.subject,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diagnosis => $composableBuilder(
    column: $table.diagnosis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remedy => $composableBuilder(
    column: $table.remedy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DiagnosesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiagnosesTable> {
  $$DiagnosesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get farmId =>
      $composableBuilder(column: $table.farmId, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<String> get diagnosis =>
      $composableBuilder(column: $table.diagnosis, builder: (column) => column);

  GeneratedColumn<String> get remedy =>
      $composableBuilder(column: $table.remedy, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DiagnosesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiagnosesTable,
          Diagnose,
          $$DiagnosesTableFilterComposer,
          $$DiagnosesTableOrderingComposer,
          $$DiagnosesTableAnnotationComposer,
          $$DiagnosesTableCreateCompanionBuilder,
          $$DiagnosesTableUpdateCompanionBuilder,
          (Diagnose, BaseReferences<_$AppDatabase, $DiagnosesTable, Diagnose>),
          Diagnose,
          PrefetchHooks Function()
        > {
  $$DiagnosesTableTableManager(_$AppDatabase db, $DiagnosesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiagnosesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiagnosesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiagnosesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> farmId = const Value.absent(),
                Value<String> subject = const Value.absent(),
                Value<String> diagnosis = const Value.absent(),
                Value<String> remedy = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DiagnosesCompanion(
                id: id,
                remoteId: remoteId,
                farmId: farmId,
                subject: subject,
                diagnosis: diagnosis,
                remedy: remedy,
                source: source,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                required String farmId,
                required String subject,
                required String diagnosis,
                required String remedy,
                required String source,
                required DateTime createdAt,
              }) => DiagnosesCompanion.insert(
                id: id,
                remoteId: remoteId,
                farmId: farmId,
                subject: subject,
                diagnosis: diagnosis,
                remedy: remedy,
                source: source,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DiagnosesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiagnosesTable,
      Diagnose,
      $$DiagnosesTableFilterComposer,
      $$DiagnosesTableOrderingComposer,
      $$DiagnosesTableAnnotationComposer,
      $$DiagnosesTableCreateCompanionBuilder,
      $$DiagnosesTableUpdateCompanionBuilder,
      (Diagnose, BaseReferences<_$AppDatabase, $DiagnosesTable, Diagnose>),
      Diagnose,
      PrefetchHooks Function()
    >;
typedef $$MarketPricesTableCreateCompanionBuilder =
    MarketPricesCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      required String crop,
      required String mandi,
      required int pricePerQuintal,
      required int delta,
      required DateTime observedAt,
    });
typedef $$MarketPricesTableUpdateCompanionBuilder =
    MarketPricesCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      Value<String> crop,
      Value<String> mandi,
      Value<int> pricePerQuintal,
      Value<int> delta,
      Value<DateTime> observedAt,
    });

class $$MarketPricesTableFilterComposer
    extends Composer<_$AppDatabase, $MarketPricesTable> {
  $$MarketPricesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get crop => $composableBuilder(
    column: $table.crop,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mandi => $composableBuilder(
    column: $table.mandi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pricePerQuintal => $composableBuilder(
    column: $table.pricePerQuintal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get delta => $composableBuilder(
    column: $table.delta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get observedAt => $composableBuilder(
    column: $table.observedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MarketPricesTableOrderingComposer
    extends Composer<_$AppDatabase, $MarketPricesTable> {
  $$MarketPricesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get crop => $composableBuilder(
    column: $table.crop,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mandi => $composableBuilder(
    column: $table.mandi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pricePerQuintal => $composableBuilder(
    column: $table.pricePerQuintal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get delta => $composableBuilder(
    column: $table.delta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get observedAt => $composableBuilder(
    column: $table.observedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MarketPricesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MarketPricesTable> {
  $$MarketPricesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get crop =>
      $composableBuilder(column: $table.crop, builder: (column) => column);

  GeneratedColumn<String> get mandi =>
      $composableBuilder(column: $table.mandi, builder: (column) => column);

  GeneratedColumn<int> get pricePerQuintal => $composableBuilder(
    column: $table.pricePerQuintal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get delta =>
      $composableBuilder(column: $table.delta, builder: (column) => column);

  GeneratedColumn<DateTime> get observedAt => $composableBuilder(
    column: $table.observedAt,
    builder: (column) => column,
  );
}

class $$MarketPricesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MarketPricesTable,
          MarketPrice,
          $$MarketPricesTableFilterComposer,
          $$MarketPricesTableOrderingComposer,
          $$MarketPricesTableAnnotationComposer,
          $$MarketPricesTableCreateCompanionBuilder,
          $$MarketPricesTableUpdateCompanionBuilder,
          (
            MarketPrice,
            BaseReferences<_$AppDatabase, $MarketPricesTable, MarketPrice>,
          ),
          MarketPrice,
          PrefetchHooks Function()
        > {
  $$MarketPricesTableTableManager(_$AppDatabase db, $MarketPricesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MarketPricesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MarketPricesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MarketPricesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> crop = const Value.absent(),
                Value<String> mandi = const Value.absent(),
                Value<int> pricePerQuintal = const Value.absent(),
                Value<int> delta = const Value.absent(),
                Value<DateTime> observedAt = const Value.absent(),
              }) => MarketPricesCompanion(
                id: id,
                remoteId: remoteId,
                crop: crop,
                mandi: mandi,
                pricePerQuintal: pricePerQuintal,
                delta: delta,
                observedAt: observedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                required String crop,
                required String mandi,
                required int pricePerQuintal,
                required int delta,
                required DateTime observedAt,
              }) => MarketPricesCompanion.insert(
                id: id,
                remoteId: remoteId,
                crop: crop,
                mandi: mandi,
                pricePerQuintal: pricePerQuintal,
                delta: delta,
                observedAt: observedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MarketPricesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MarketPricesTable,
      MarketPrice,
      $$MarketPricesTableFilterComposer,
      $$MarketPricesTableOrderingComposer,
      $$MarketPricesTableAnnotationComposer,
      $$MarketPricesTableCreateCompanionBuilder,
      $$MarketPricesTableUpdateCompanionBuilder,
      (
        MarketPrice,
        BaseReferences<_$AppDatabase, $MarketPricesTable, MarketPrice>,
      ),
      MarketPrice,
      PrefetchHooks Function()
    >;
typedef $$WeatherCacheTableCreateCompanionBuilder =
    WeatherCacheCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      required String location,
      required String temperature,
      required String summary,
      required int humidity,
      required int rainChance,
      required DateTime observedAt,
    });
typedef $$WeatherCacheTableUpdateCompanionBuilder =
    WeatherCacheCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      Value<String> location,
      Value<String> temperature,
      Value<String> summary,
      Value<int> humidity,
      Value<int> rainChance,
      Value<DateTime> observedAt,
    });

class $$WeatherCacheTableFilterComposer
    extends Composer<_$AppDatabase, $WeatherCacheTable> {
  $$WeatherCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get humidity => $composableBuilder(
    column: $table.humidity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rainChance => $composableBuilder(
    column: $table.rainChance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get observedAt => $composableBuilder(
    column: $table.observedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeatherCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $WeatherCacheTable> {
  $$WeatherCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get humidity => $composableBuilder(
    column: $table.humidity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rainChance => $composableBuilder(
    column: $table.rainChance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get observedAt => $composableBuilder(
    column: $table.observedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeatherCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeatherCacheTable> {
  $$WeatherCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get temperature => $composableBuilder(
    column: $table.temperature,
    builder: (column) => column,
  );

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<int> get humidity =>
      $composableBuilder(column: $table.humidity, builder: (column) => column);

  GeneratedColumn<int> get rainChance => $composableBuilder(
    column: $table.rainChance,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get observedAt => $composableBuilder(
    column: $table.observedAt,
    builder: (column) => column,
  );
}

class $$WeatherCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeatherCacheTable,
          WeatherCacheData,
          $$WeatherCacheTableFilterComposer,
          $$WeatherCacheTableOrderingComposer,
          $$WeatherCacheTableAnnotationComposer,
          $$WeatherCacheTableCreateCompanionBuilder,
          $$WeatherCacheTableUpdateCompanionBuilder,
          (
            WeatherCacheData,
            BaseReferences<_$AppDatabase, $WeatherCacheTable, WeatherCacheData>,
          ),
          WeatherCacheData,
          PrefetchHooks Function()
        > {
  $$WeatherCacheTableTableManager(_$AppDatabase db, $WeatherCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeatherCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeatherCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeatherCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String> temperature = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<int> humidity = const Value.absent(),
                Value<int> rainChance = const Value.absent(),
                Value<DateTime> observedAt = const Value.absent(),
              }) => WeatherCacheCompanion(
                id: id,
                remoteId: remoteId,
                location: location,
                temperature: temperature,
                summary: summary,
                humidity: humidity,
                rainChance: rainChance,
                observedAt: observedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                required String location,
                required String temperature,
                required String summary,
                required int humidity,
                required int rainChance,
                required DateTime observedAt,
              }) => WeatherCacheCompanion.insert(
                id: id,
                remoteId: remoteId,
                location: location,
                temperature: temperature,
                summary: summary,
                humidity: humidity,
                rainChance: rainChance,
                observedAt: observedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeatherCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeatherCacheTable,
      WeatherCacheData,
      $$WeatherCacheTableFilterComposer,
      $$WeatherCacheTableOrderingComposer,
      $$WeatherCacheTableAnnotationComposer,
      $$WeatherCacheTableCreateCompanionBuilder,
      $$WeatherCacheTableUpdateCompanionBuilder,
      (
        WeatherCacheData,
        BaseReferences<_$AppDatabase, $WeatherCacheTable, WeatherCacheData>,
      ),
      WeatherCacheData,
      PrefetchHooks Function()
    >;
typedef $$RoadmapTasksTableCreateCompanionBuilder =
    RoadmapTasksCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      required String weekLabel,
      required String title,
      required String details,
      Value<bool> isDone,
      required DateTime updatedAt,
    });
typedef $$RoadmapTasksTableUpdateCompanionBuilder =
    RoadmapTasksCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      Value<String> weekLabel,
      Value<String> title,
      Value<String> details,
      Value<bool> isDone,
      Value<DateTime> updatedAt,
    });

class $$RoadmapTasksTableFilterComposer
    extends Composer<_$AppDatabase, $RoadmapTasksTable> {
  $$RoadmapTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weekLabel => $composableBuilder(
    column: $table.weekLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoadmapTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $RoadmapTasksTable> {
  $$RoadmapTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weekLabel => $composableBuilder(
    column: $table.weekLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoadmapTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoadmapTasksTable> {
  $$RoadmapTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get weekLabel =>
      $composableBuilder(column: $table.weekLabel, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RoadmapTasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoadmapTasksTable,
          RoadmapTask,
          $$RoadmapTasksTableFilterComposer,
          $$RoadmapTasksTableOrderingComposer,
          $$RoadmapTasksTableAnnotationComposer,
          $$RoadmapTasksTableCreateCompanionBuilder,
          $$RoadmapTasksTableUpdateCompanionBuilder,
          (
            RoadmapTask,
            BaseReferences<_$AppDatabase, $RoadmapTasksTable, RoadmapTask>,
          ),
          RoadmapTask,
          PrefetchHooks Function()
        > {
  $$RoadmapTasksTableTableManager(_$AppDatabase db, $RoadmapTasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoadmapTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoadmapTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoadmapTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> weekLabel = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> details = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => RoadmapTasksCompanion(
                id: id,
                remoteId: remoteId,
                weekLabel: weekLabel,
                title: title,
                details: details,
                isDone: isDone,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                required String weekLabel,
                required String title,
                required String details,
                Value<bool> isDone = const Value.absent(),
                required DateTime updatedAt,
              }) => RoadmapTasksCompanion.insert(
                id: id,
                remoteId: remoteId,
                weekLabel: weekLabel,
                title: title,
                details: details,
                isDone: isDone,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoadmapTasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoadmapTasksTable,
      RoadmapTask,
      $$RoadmapTasksTableFilterComposer,
      $$RoadmapTasksTableOrderingComposer,
      $$RoadmapTasksTableAnnotationComposer,
      $$RoadmapTasksTableCreateCompanionBuilder,
      $$RoadmapTasksTableUpdateCompanionBuilder,
      (
        RoadmapTask,
        BaseReferences<_$AppDatabase, $RoadmapTasksTable, RoadmapTask>,
      ),
      RoadmapTask,
      PrefetchHooks Function()
    >;
typedef $$ChatHistoryTableCreateCompanionBuilder =
    ChatHistoryCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      required String role,
      required String message,
      required String source,
      required DateTime createdAt,
    });
typedef $$ChatHistoryTableUpdateCompanionBuilder =
    ChatHistoryCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      Value<String> role,
      Value<String> message,
      Value<String> source,
      Value<DateTime> createdAt,
    });

class $$ChatHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $ChatHistoryTable> {
  $$ChatHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChatHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatHistoryTable> {
  $$ChatHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChatHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatHistoryTable> {
  $$ChatHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ChatHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChatHistoryTable,
          ChatHistoryData,
          $$ChatHistoryTableFilterComposer,
          $$ChatHistoryTableOrderingComposer,
          $$ChatHistoryTableAnnotationComposer,
          $$ChatHistoryTableCreateCompanionBuilder,
          $$ChatHistoryTableUpdateCompanionBuilder,
          (
            ChatHistoryData,
            BaseReferences<_$AppDatabase, $ChatHistoryTable, ChatHistoryData>,
          ),
          ChatHistoryData,
          PrefetchHooks Function()
        > {
  $$ChatHistoryTableTableManager(_$AppDatabase db, $ChatHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ChatHistoryCompanion(
                id: id,
                remoteId: remoteId,
                role: role,
                message: message,
                source: source,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                required String role,
                required String message,
                required String source,
                required DateTime createdAt,
              }) => ChatHistoryCompanion.insert(
                id: id,
                remoteId: remoteId,
                role: role,
                message: message,
                source: source,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChatHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChatHistoryTable,
      ChatHistoryData,
      $$ChatHistoryTableFilterComposer,
      $$ChatHistoryTableOrderingComposer,
      $$ChatHistoryTableAnnotationComposer,
      $$ChatHistoryTableCreateCompanionBuilder,
      $$ChatHistoryTableUpdateCompanionBuilder,
      (
        ChatHistoryData,
        BaseReferences<_$AppDatabase, $ChatHistoryTable, ChatHistoryData>,
      ),
      ChatHistoryData,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableCreateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      required String entity,
      required String operation,
      required String payload,
      required DateTime queuedAt,
    });
typedef $$SyncQueueTableUpdateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      Value<String> entity,
      Value<String> operation,
      Value<String> payload,
      Value<DateTime> queuedAt,
    });

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get queuedAt => $composableBuilder(
    column: $table.queuedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get queuedAt => $composableBuilder(
    column: $table.queuedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entity =>
      $composableBuilder(column: $table.entity, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get queuedAt =>
      $composableBuilder(column: $table.queuedAt, builder: (column) => column);
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueData,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueData,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
          ),
          SyncQueueData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entity = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> queuedAt = const Value.absent(),
              }) => SyncQueueCompanion(
                id: id,
                entity: entity,
                operation: operation,
                payload: payload,
                queuedAt: queuedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entity,
                required String operation,
                required String payload,
                required DateTime queuedAt,
              }) => SyncQueueCompanion.insert(
                id: id,
                entity: entity,
                operation: operation,
                payload: payload,
                queuedAt: queuedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueData,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueData,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
      ),
      SyncQueueData,
      PrefetchHooks Function()
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      required String name,
      required String seller,
      required String priceLabel,
      required String category,
      required String detail,
      required DateTime updatedAt,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String?> remoteId,
      Value<String> name,
      Value<String> seller,
      Value<String> priceLabel,
      Value<String> category,
      Value<String> detail,
      Value<DateTime> updatedAt,
    });

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seller => $composableBuilder(
    column: $table.seller,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priceLabel => $composableBuilder(
    column: $table.priceLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seller => $composableBuilder(
    column: $table.seller,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priceLabel => $composableBuilder(
    column: $table.priceLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get seller =>
      $composableBuilder(column: $table.seller, builder: (column) => column);

  GeneratedColumn<String> get priceLabel => $composableBuilder(
    column: $table.priceLabel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get detail =>
      $composableBuilder(column: $table.detail, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> seller = const Value.absent(),
                Value<String> priceLabel = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> detail = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                remoteId: remoteId,
                name: name,
                seller: seller,
                priceLabel: priceLabel,
                category: category,
                detail: detail,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                required String name,
                required String seller,
                required String priceLabel,
                required String category,
                required String detail,
                required DateTime updatedAt,
              }) => ProductsCompanion.insert(
                id: id,
                remoteId: remoteId,
                name: name,
                seller: seller,
                priceLabel: priceLabel,
                category: category,
                detail: detail,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
      Product,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FarmsTableTableManager get farms =>
      $$FarmsTableTableManager(_db, _db.farms);
  $$DiagnosesTableTableManager get diagnoses =>
      $$DiagnosesTableTableManager(_db, _db.diagnoses);
  $$MarketPricesTableTableManager get marketPrices =>
      $$MarketPricesTableTableManager(_db, _db.marketPrices);
  $$WeatherCacheTableTableManager get weatherCache =>
      $$WeatherCacheTableTableManager(_db, _db.weatherCache);
  $$RoadmapTasksTableTableManager get roadmapTasks =>
      $$RoadmapTasksTableTableManager(_db, _db.roadmapTasks);
  $$ChatHistoryTableTableManager get chatHistory =>
      $$ChatHistoryTableTableManager(_db, _db.chatHistory);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
}
