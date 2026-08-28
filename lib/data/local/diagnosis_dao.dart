import 'dart:convert';

import 'package:drift/drift.dart';

import '../../features/pocket_scientist/tflite_inference_service.dart';
import 'app_database.dart';

class DiagnosisDao extends DatabaseAccessor<AppDatabase> {
  DiagnosisDao(super.attachedDatabase);

  Future<Diagnose> savePrediction({
    required String farmId,
    required DiagnosisPrediction prediction,
    String source = 'tflite',
  }) async {
    final createdAt = DateTime.now().toUtc();
    final id = await attachedDatabase
        .into(attachedDatabase.diagnoses)
        .insert(
          DiagnosesCompanion.insert(
            farmId: farmId,
            subject: 'leaf',
            diagnosis: prediction.label,
            remedy: prediction.remedy,
            source: source,
            createdAt: createdAt,
          ),
        );
    await attachedDatabase.syncQueueDao.enqueue(
      SyncQueueCompanion.insert(
        entity: 'diagnosis',
        operation: 'create',
        payload: jsonEncode({
          'documentId': 'diagnosis-$id',
          'data': {
            'farmId': farmId,
            'subject': 'leaf',
            'diagnosis': prediction.label,
            'remedy': prediction.remedy,
            'source': source,
            'createdAt': createdAt.toIso8601String(),
          },
        }),
        queuedAt: createdAt,
      ),
    );
    return (attachedDatabase.select(
      attachedDatabase.diagnoses,
    )..where((row) => row.id.equals(id))).getSingle();
  }
}
