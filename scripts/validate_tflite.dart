import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

/// Validates the crop disease TFLite model against a labeled test set.
///
/// Expected directory structure:
///   test_assets/field_photos/
///     Tomato___Late_blight/
///       IMG_001.jpg
///       ...
///     Potato___Early_blight/
///       ...
///
/// And a CSV mapping: test_assets/field_photos/labels.csv
///   filename,class_index
///   IMG_001.jpg,9
///   ...

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  const modelPath = 'assets/models/crop_disease_v1.tflite';
  const labelsPath = 'assets/models/labels.txt';
  const testDir = 'test_assets/field_photos';
  const csvPath = 'test_assets/field_photos/labels.csv';

  if (!await File(modelPath).exists()) {
    stderr.writeln('❌ Model not found at $modelPath. Run `flutter pub get` first.');
    exit(1);
  }

  if (!await File(labelsPath).exists()) {
    stderr.writeln('❌ Labels not found at $labelsPath');
    exit(1);
  }

  if (!await Directory(testDir).exists()) {
    stderr.writeln('❌ Test directory not found at $testDir. Run download script first.');
    exit(1);
  }

  if (!await File(csvPath).exists()) {
    stderr.writeln('❌ Labels CSV not found at $csvPath. Run download script first.');
    exit(1);
  }

  // Load labels
  final labels = await File(labelsPath).readAsLines();
  print('📋 Loaded ${labels.length} class labels');

  // Load CSV ground truth
  final csvContent = await File(csvPath).readAsString();
  final gtMap = <String, int>{};
  for (final line in csvContent.trim().split('\n').skip(1)) {
    final parts = line.split(',');
    if (parts.length >= 2) {
      gtMap[parts[0].trim()] = int.tryParse(parts[1].trim()) ?? -1;
    }
  }
  print('📋 Loaded ${gtMap.length} ground truth labels');

  // Load model
  final interpreter = await Interpreter.fromAsset(modelPath);
  print('🧠 Model loaded: ${interpreter.getInputTensor(0).shape} -> ${interpreter.getOutputTensor(0).shape}');

  final inputShape = interpreter.getInputTensor(0).shape;
  final inputHeight = inputShape[1];
  final inputWidth = inputShape[2];

  // Process each test image
  final results = <ValidationResult>[];
  final dir = Directory(testDir);
  int processed = 0;

  await for (final entity in dir.list(recursive: true)) {
    if (entity is File && _isImage(entity.path)) {
      final relPath = _relativePath(entity.path, testDir);
      final expectedClass = gtMap[relPath];

      if (expectedClass == null) {
        print('  ⚠️  No ground truth for $relPath, skipping');
        continue;
      }

      try {
        final predictedClass = await _predict(interpreter, entity.path, inputHeight, inputWidth);
        final correct = predictedClass == expectedClass;
        results.add(ValidationResult(
          file: relPath,
          expected: expectedClass,
          expectedLabel: labels[expectedClass],
          predicted: predictedClass,
          predictedLabel: labels[predictedClass],
          correct: correct,
        ));

        processed++;
        if (processed % 20 == 0) {
          print('  🔄 Processed $processed images...');
        }
      } catch (e) {
        print('  ❌ Error processing $relPath: $e');
      }
    }
  }

  // Print summary
  await _printSummary(results, labels);
}

Future<int> _predict(Interpreter interpreter, String imagePath, int h, int w) async {
  final bytes = await File(imagePath).readAsBytes();
  final image = img.decodeImage(bytes);
  if (image == null) throw Exception('Failed to decode image');

  // Resize to model input size (224x224)
  final resized = img.copyResize(image, width: w, height: h);

  // Normalize: (pixel / 127.5) - 1.0 (MobileNetV2 preprocess_input)
  final input = Float32List(1 * h * w * 3);
  int idx = 0;
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      final pixel = resized.getPixel(x, y);
      input[idx++] = (pixel.r / 127.5) - 1.0;
      input[idx++] = (pixel.g / 127.5) - 1.0;
      input[idx++] = (pixel.b / 127.5) - 1.0;
    }
  }

  final outputShape = interpreter.getOutputTensor(0).shape;
  final output = List.filled(outputShape[1], 0.0).reshape([1, outputShape[1]]);
  interpreter.run(input, output);

  // Argmax
  var maxIdx = 0;
  var maxVal = output[0][0];
  for (int i = 1; i < output[0].length; i++) {
    if (output[0][i] > maxVal) {
      maxVal = output[0][i];
      maxIdx = i;
    }
  }
  return maxIdx;
}

bool _isImage(String path) {
  final ext = path.toLowerCase().split('.').last;
  return ['jpg', 'jpeg', 'png', 'bmp', 'webp'].contains(ext);
}

String _relativePath(String full, String base) {
  final basePath = Directory(base).absolute.path;
  final fullPath = File(full).absolute.path;
  if (fullPath.startsWith(basePath)) {
    return fullPath.substring(basePath.length + 1).replaceAll('\\', '/');
  }
  return fullPath;
}

Future<void> _printSummary(List<ValidationResult> results, List<String> labels) async {
  if (results.isEmpty) {
    print('❌ No results to summarize');
    return;
  }

  final total = results.length;
  final correct = results.where((r) => r.correct).length;
  final accuracy = (correct / total * 100).toStringAsFixed(1);

  print('\n┌─────────────────────────────────────────────────────────────┐');
  print('│                    VALIDATION SUMMARY                        │');
  print('├─────────────────────────────────────────────────────────────┤');
  print('│ Total images:     ${total.toString().padLeft(4)}                                        │');
  print('│ Correct:          ${correct.toString().padLeft(4)}                                        │');
  print('│ Accuracy:         ${accuracy.padLeft(6)}%                                        │');
  print('└─────────────────────────────────────────────────────────────┘');

  // Per-class metrics
  final classStats = <int, ClassStats>{};
  for (final r in results) {
    classStats.putIfAbsent(r.expected, () => ClassStats(label: labels[r.expected]))
        .add(r.correct);
  }

  print('\n📊 Per-class performance:');
  print('${'Class'.padRight(30)} ${'Label'.padRight(35)} ${'Count'.padLeft(6)} ${'Correct'.padLeft(8)} ${'Recall'.padLeft(8)}');
  print('${'-' * 90}');

  final sortedEntries = classStats.entries.toList()..sort((a, b) => a.key.compareTo(b.key));
  for (final entry in sortedEntries) {
    final s = entry.value;
    final recall = (s.correct / s.total * 100).toStringAsFixed(1);
    print('${entry.key.toString().padRight(30)} ${s.label.padRight(35)} ${s.total.toString().padLeft(6)} ${s.correct.toString().padLeft(8)} ${recall.padLeft(7)}%');
  }

  // Confusion matrix (top 10 confused pairs)
  final confusion = <String, int>{};
  for (final r in results.where((r) => !r.correct)) {
    final key = '${r.expected}→${r.predicted}';
    confusion[key] = (confusion[key] ?? 0) + 1;
  }

  if (confusion.isNotEmpty) {
    print('\n🔄 Top confused pairs:');
    final sorted = confusion.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    for (final e in sorted.take(10)) {
      final from = labels[int.parse(e.key.split('→')[0])];
      final to = labels[int.parse(e.key.split('→')[1])];
      print('  $from → $to : ${e.value}');
    }
  }

  // Save detailed results to internal storage
  final csv = StringBuffer();
  csv.writeln('file,expected,expected_label,predicted,predicted_label,correct');
  for (final r in results) {
    csv.writeln('${r.file},${r.expected},"${r.expectedLabel}",${r.predicted},"${r.predictedLabel}",${r.correct}');
  }
  final dir = await getApplicationDocumentsDirectory();
  final outputFile = File('${dir.path}/validation_results.csv');
  await outputFile.writeAsString(csv.toString());
  print('\n💾 Detailed results saved to ${outputFile.path}');
}

class ValidationResult {
  final String file;
  final int expected;
  final String expectedLabel;
  final int predicted;
  final String predictedLabel;
  final bool correct;

  ValidationResult({
    required this.file,
    required this.expected,
    required this.expectedLabel,
    required this.predicted,
    required this.predictedLabel,
    required this.correct,
  });
}

class ClassStats {
  final String label;
  int total = 0;
  int correct = 0;

  ClassStats({required this.label});

  void add(bool correct) {
    total++;
    if (correct) this.correct++;
  }
}