import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:appwrite/appwrite.dart';

/// Ingests groundwater prospect polygons from GeoJSON into Appwrite.
///
/// Usage (with API key for server-side auth - REQUIRED for collection creation):
///   flutter run scripts/ingest_groundwater.dart -- \
///     --endpoint=<APPWRITE_ENDPOINT> \
///     --project=<APPWRITE_PROJECT_ID> \
///     --key=<APPWRITE_API_KEY> \
///     --database=<APPWRITE_DATABASE_ID> \
///     --collection=<GROUNDWATER_COLLECTION_ID> \
///     --file=test_assets/nalanda_groundwater.geojson \
///     --district=nalanda

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final parsed = _parseArgs(args);
  if (parsed == null) return;

  final client = Client()
    ..setEndpoint(parsed['endpoint']!)
    ..setProject(parsed['project']!);

  // API key required for admin operations (collection creation)
  if (parsed.containsKey('key') && parsed['key']!.isNotEmpty) {
    client.setKey(parsed['key']!);
    print('🔐 Using API key authentication (admin)');
  } else {
    stderr.writeln('❌ API key (--key) is required for admin collection creation');
    exit(1);
  }

  final databases = Databases(client);

  // Ensure collection exists with correct schema
  final collectionId = parsed['collection']!;
  final databaseId = parsed['database']!;
  await _ensureCollectionExists(databases, databaseId, collectionId);

  final file = File(parsed['file']!);
  if (!await file.exists()) {
    stderr.writeln('❌ GeoJSON file not found: ${parsed['file']}');
    exit(1);
  }

  final jsonString = await file.readAsString();
  final dynamic decoded = jsonDecode(jsonString);

  if (decoded is! Map || decoded['type'] != 'FeatureCollection') {
    stderr.writeln('❌ Expected GeoJSON FeatureCollection');
    exit(1);
  }

  final features = decoded['features'] as List;
  if (features.isEmpty) {
    stderr.writeln('❌ No features in GeoJSON');
    exit(1);
  }

  print('📦 Ingesting ${features.length} polygons for district: ${parsed['district']}');

  int success = 0;
  int failed = 0;

  for (int i = 0; i < features.length; i++) {
    final feature = features[i] as Map<String, dynamic>;
    final props = feature['properties'] as Map<String, dynamic>? ?? {};
    final geom = feature['geometry'];

    if (geom == null || geom['type'] != 'Polygon' && geom['type'] != 'MultiPolygon') {
      stderr.writeln('  ⚠️  Skipping feature $i: not a Polygon/MultiPolygon');
      failed++;
      continue;
    }

    final prospectClass = _mapProspectClass(
        props['prospect_class'] as String? ??
        props['PROSPECT_CLASS'] as String? ??
        props['class'] as String? ??
        'unknown');

    final bbox = _computeBbox(geom);
    final areaHectares = _estimateAreaHectares(bbox);

    final data = {
      'polygon_id': 'nalanda_${i.toString().padLeft(3, '0')}',
      'prospect_class': prospectClass,
      'geometry': jsonEncode(geom),
      'area_hectares': areaHectares,
      'district': parsed['district'],
      'source': 'bhuvan_bhujal_mock',
      'created_at': DateTime.now().toIso8601String(),
    };

    try {
      await databases.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: ID.unique(),
        data: data,
      );
      success++;
      if (success % 10 == 0) {
        print('  ✅ $success / ${features.length}');
      }
    } catch (e) {
      stderr.writeln('  ❌ Feature $i failed: $e');
      failed++;
    }
  }

  print('\n🎉 Done: $success succeeded, $failed failed');
}

Future<void> _ensureCollectionExists(Databases databases, String databaseId, String collectionId) async {
  try {
    // Try to get the collection - if it exists, we're good
    await databases.getCollection(databaseId: databaseId, collectionId: collectionId);
    print('✅ Collection "$collectionId" already exists');
  } on AppwriteException catch (e) {
    if (e.code == 404) {
      print('📦 Collection "$collectionId" not found, creating...');
      await _createCollection(databases, databaseId, collectionId);
      print('✅ Collection "$collectionId" created successfully');
    } else {
      rethrow;
    }
  }
}

Future<void> _createCollection(Databases databases, String databaseId, String collectionId) async {
  await databases.createCollection(
    databaseId: databaseId,
    collectionId: collectionId,
    name: 'Groundwater Prospects',
    permissions: [
      Permission.read(Role.any()),
      Permission.create(Role.any()),
      Permission.update(Role.any()),
      Permission.delete(Role.any()),
    ],
    documentSecurity: false,
  );

  // Create attributes
  await Future.wait([
    databases.createStringAttribute(
      databaseId: databaseId,
      collectionId: collectionId,
      key: 'polygon_id',
      size: 255,
      required: true,
    ),
    databases.createStringAttribute(
      databaseId: databaseId,
      collectionId: collectionId,
      key: 'prospect_class',
      size: 50,
      required: true,
    ),
    databases.createStringAttribute(
      databaseId: databaseId,
      collectionId: collectionId,
      key: 'geometry',
      size: 10000,
      required: true,
    ),
    databases.createFloatAttribute(
      databaseId: databaseId,
      collectionId: collectionId,
      key: 'area_hectares',
      required: false,
    ),
    databases.createStringAttribute(
      databaseId: databaseId,
      collectionId: collectionId,
      key: 'district',
      size: 100,
      required: true,
    ),
    databases.createStringAttribute(
      databaseId: databaseId,
      collectionId: collectionId,
      key: 'source',
      size: 100,
      required: true,
    ),
    databases.createDateTimeAttribute(
      databaseId: databaseId,
      collectionId: collectionId,
      key: 'created_at',
      required: false,
    ),
  ]);

  // Create unique index on polygon_id
  await databases.createIndex(
    databaseId: databaseId,
    collectionId: collectionId,
    key: 'polygon_id_unique',
    type: IndexType.unique,
    attributes: ['polygon_id'],
  );
}

String _mapProspectClass(String input) {
  final lower = input.toLowerCase();
  if (lower == 'high' || lower == 'very good') return 'Very Good';
  if (lower == 'medium' || lower == 'good') return 'Good';
  if (lower == 'low' || lower == 'moderate') return 'Moderate';
  if (lower == 'very_low' || lower == 'poor') return 'Poor';
  return 'Unknown';
}

Map<String, String>? _parseArgs(List<String> args) {
  final map = <String, String>{};
  for (final arg in args) {
    if (arg.startsWith('--')) {
      final parts = arg.substring(2).split('=');
      if (parts.length == 2) map[parts[0]] = parts[1];
    }
  }

  const required = ['endpoint', 'project', 'key', 'database', 'collection', 'file', 'district'];
  for (final r in required) {
    if (!map.containsKey(r)) {
      stderr.writeln('Usage: flutter run scripts/ingest_groundwater.dart -- \\');
      stderr.writeln('  --endpoint=<APPWRITE_ENDPOINT> \\');
      stderr.writeln('  --project=<APPWRITE_PROJECT_ID> \\');
      stderr.writeln('  --key=<APPWRITE_API_KEY> \\');
      stderr.writeln('  --database=<APPWRITE_DATABASE_ID> \\');
      stderr.writeln('  --collection=<GROUNDWATER_COLLECTION_ID> \\');
      stderr.writeln('  --file=<path/to/geojson> \\');
      stderr.writeln('  --district=<district_name>');
      return null;
    }
  }
  return map;
}

Map<String, double> _computeBbox(dynamic geom) {
  final coords = <List<double>>[];
  void extract(dynamic g) {
    if (g is List) {
      if (g.length == 2 && g.every((e) => e is num)) {
        coords.add([(g[0] as num).toDouble(), (g[1] as num).toDouble()]);
      } else {
        for (final e in g) extract(e);
      }
    }
  }
  extract(geom['coordinates']);

  final lats = coords.map((c) => c[1]);
  final lngs = coords.map((c) => c[0]);

  return {
    'minLat': lats.reduce((a, b) => a < b ? a : b),
    'maxLat': lats.reduce((a, b) => a > b ? a : b),
    'minLng': lngs.reduce((a, b) => a < b ? a : b),
    'maxLng': lngs.reduce((a, b) => a > b ? a : b),
  };
}

double _estimateAreaHectares(Map<String, double> bbox) {
  // Rough approximation: bbox area in degrees * 111km/deg * 111km/deg * 100 (hectares per km2)
  // This is very approximate but gives a reasonable order of magnitude
  final latDiff = bbox['maxLat']! - bbox['minLat']!;
  final lngDiff = bbox['maxLng']! - bbox['minLng']!;
  final avgLat = (bbox['maxLat']! + bbox['minLat']!) / 2;
  final latKm = latDiff * 111.0;
  final lngKm = lngDiff * 111.0 * (avgLat * 3.14159 / 180).cos();
  final areaKm2 = latKm * lngKm;
  return areaKm2 * 100; // hectares
}