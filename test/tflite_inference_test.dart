import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:krishi_sutra/features/pocket_scientist/tflite_inference_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('missing model assets return an explicit unavailable error', () async {
    const service = TfliteInferenceService(
      modelAsset: 'missing-model.tflite',
      labelsAsset: 'missing-labels.txt',
    );

    expect(
      () => service.classify(Uint8List(0)),
      throwsA(isA<ModelUnavailableException>()),
    );
  });
}
