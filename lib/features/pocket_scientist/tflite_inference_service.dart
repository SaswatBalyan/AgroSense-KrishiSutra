import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image_lib;
import 'package:tflite_flutter/tflite_flutter.dart';

class DiagnosisPrediction {
  const DiagnosisPrediction({
    required this.label,
    required this.confidence,
    required this.remedy,
  });

  final String label;
  final double confidence;
  final String remedy;
}

class ModelUnavailableException implements Exception {
  const ModelUnavailableException(this.message);

  final String message;

  @override
  String toString() => message;
}

class TfliteInferenceService {
  const TfliteInferenceService({
    this.modelAsset = 'assets/models/crop_disease_v1.tflite',
    this.labelsAsset = 'assets/models/labels.txt',
  });

  final String modelAsset;
  final String labelsAsset;

  Future<DiagnosisPrediction> classify(Uint8List imageBytes) async {
    final labels = await _loadLabels();
    late final Interpreter interpreter;
    try {
      interpreter = await Interpreter.fromAsset(modelAsset);
    } catch (e) {
      debugPrint('Error loading TFLite model: $e');
      throw ModelUnavailableException(
        'The offline disease model is not installed yet: $e',
      );
    }

    try {
      final decoded = image_lib.decodeImage(imageBytes);
      if (decoded == null) {
        throw const FormatException('The captured image could not be decoded.');
      }
      final resized = image_lib.copyResize(decoded, width: 224, height: 224);

      // Prepare input buffer: [1, 224, 224, 3] float32
      final input = Float32List(1 * 224 * 224 * 3);
      var bufferIndex = 0;
      for (var y = 0; y < 224; y++) {
        for (var x = 0; x < 224; x++) {
          final pixel = resized.getPixel(x, y);
          // Normalization for MobileNetV2: (pixel / 127.5) - 1.0
          input[bufferIndex++] = (pixel.r / 127.5) - 1.0;
          input[bufferIndex++] = (pixel.g / 127.5) - 1.0;
          input[bufferIndex++] = (pixel.b / 127.5) - 1.0;
        }
      }

      final output = [List<double>.filled(labels.length, 0)];

      // Reshape input to match model expectations: [1, 224, 224, 3]
      final inputReshaped = input.reshape([1, 224, 224, 3]);

      interpreter.run(inputReshaped, output);
      final scores = output.first;
      var bestIndex = 0;
      for (var index = 1; index < scores.length; index++) {
        if (scores[index] > scores[bestIndex]) bestIndex = index;
      }

      return DiagnosisPrediction(
        label: labels[bestIndex],
        confidence: scores[bestIndex],
        remedy: 'Follow the recommended treatment for ${labels[bestIndex]}.',
      );
    } catch (e) {
      debugPrint('Error during inference: $e');
      rethrow;
    } finally {
      interpreter.close();
    }
  }

  Future<List<String>> _loadLabels() async {
    try {
      final raw = await rootBundle.loadString(labelsAsset);
      final labels = raw
          .split('\n')
          .map((label) => label.trim())
          .where((label) => label.isNotEmpty)
          .toList();
      if (labels.isEmpty) throw const FormatException('No model labels found.');
      return labels;
    } catch (_) {
      throw ModelUnavailableException(
        'The offline disease model labels are not installed yet.',
      );
    }
  }
}
