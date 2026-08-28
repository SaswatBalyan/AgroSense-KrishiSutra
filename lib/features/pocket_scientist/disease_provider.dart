import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/diagnosis_dao.dart';
import '../../shared/providers/database_provider.dart';
import 'tflite_inference_service.dart';

final diagnosisDaoProvider = Provider<DiagnosisDao>(
  (ref) => DiagnosisDao(ref.watch(databaseProvider)),
);

final inferenceServiceProvider = Provider<TfliteInferenceService>(
  (ref) => const TfliteInferenceService(),
);

final diagnosisServiceProvider = Provider<DiseaseDiagnosisService>(
  (ref) => DiseaseDiagnosisService(
    inference: ref.watch(inferenceServiceProvider),
    diagnoses: ref.watch(diagnosisDaoProvider),
  ),
);

class DiseaseDiagnosisService {
  const DiseaseDiagnosisService({
    required this.inference,
    required this.diagnoses,
  });

  final TfliteInferenceService inference;
  final DiagnosisDao diagnoses;

  Future<DiagnosisPrediction> classifyAndSave(
    Uint8List imageBytes, {
    String farmId = 'unregistered',
  }) async {
    final prediction = await inference.classify(imageBytes);
    await diagnoses.savePrediction(farmId: farmId, prediction: prediction);
    return prediction;
  }
}
