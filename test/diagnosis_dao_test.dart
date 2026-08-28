import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/data/local/app_database.dart';
import 'package:krishi_sutra/data/local/diagnosis_dao.dart';
import 'package:krishi_sutra/features/pocket_scientist/tflite_inference_service.dart';

void main() {
  late AppDatabase database;
  late DiagnosisDao diagnosisDao;

  setUp(() {
    database = AppDatabase.forTesting();
    diagnosisDao = DiagnosisDao(database);
  });

  tearDown(() => database.close());

  test('prediction is persisted and queued for remote sync', () async {
    final saved = await diagnosisDao.savePrediction(
      farmId: 'farm-1',
      prediction: const DiagnosisPrediction(
        label: 'Soybean rust',
        confidence: 0.94,
        remedy: 'Apply the recommended fungicide.',
      ),
    );

    expect(saved.diagnosis, 'Soybean rust');
    expect(saved.source, 'tflite');

    final pending = await database.syncQueueDao.getPending();
    expect(pending, hasLength(1));
    expect(pending.single.entity, 'diagnosis');
    expect(pending.single.payload, contains('Soybean rust'));
  });
}
