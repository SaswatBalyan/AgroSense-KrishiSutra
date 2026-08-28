import 'dart:io';
import 'dart:convert';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;

/// Creates a mock test set for TFLite validation using synthetic images.
/// This is a fallback when Kaggle API is unavailable.
/// Creates simple but valid JPEG images that the model can process.

Future<void> main(List<String> args) async {
  // Load PlantVillage label mapping
  final labelMap = await _loadLabelMap('assets/models/labels.txt');
  print('📋 Loaded ${labelMap.length} class labels');

  final outputDir = Directory('test_assets/field_photos');
  if (!await outputDir.exists()) await outputDir.create(recursive: true);

  final csvFile = File('test_assets/field_photos/labels.csv');
  final csv = StringBuffer();
  csv.writeln('filename,class_index');

  // Test a representative subset of classes
  final classesToTest = [
    'Tomato___Late_blight',
    'Tomato___Early_blight',
    'Tomato___Bacterial_spot',
    'Tomato___healthy',
    'Potato___Early_blight',
    'Potato___Late_blight',
    'Potato___healthy',
    'Apple___Apple_scab',
    'Apple___Black_rot',
    'Apple___healthy',
    'Corn_(maize)___Common_rust_',
    'Corn_(maize)___Northern_Leaf_Blight',
    'Corn_(maize)___healthy',
    'Grape___Black_rot',
    'Grape___Esca_(Black_Measles)',
    'Grape___healthy',
    'Peach___Bacterial_spot',
    'Pepper,_bell___Bacterial_spot',
    'Strawberry___Leaf_scorch',
    'Soybean___healthy',
  ];

  int totalCreated = 0;

  for (final className in classesToTest) {
    final classIndex = labelMap[className];
    if (classIndex == null) {
      print('  ⚠️  Class "$className" not in labels.txt, skipping');
      continue;
    }

    final classDir = Directory(p.join(outputDir.path, className));
    if (!await classDir.exists()) await classDir.create(recursive: true);

    // Create 5 synthetic images per class with different patterns
    for (int i = 0; i < 5; i++) {
      final fileName = '${className}_synthetic_$i.jpg';
      final outFile = File(p.join(classDir.path, fileName));

      // Generate a synthetic 224x224 image with distinct patterns per class
      final image = _generateSyntheticImage(className, i);
      await outFile.writeAsBytes(img.encodeJpg(image, quality: 90));

      csv.writeln('${p.relative(outFile.path, from: outputDir.path).replaceAll('\\', '/')},$classIndex');
      totalCreated++;

      if (totalCreated % 20 == 0) {
        print('  🖼️  Created $totalCreated images...');
      }
    }

    print('  ✅ $className: 5 images');
  }

  await csvFile.writeAsString(csv.toString());
  print('\n🎉 Done! Created $totalCreated synthetic test images across ${classesToTest.length} classes');
  print('   Labels CSV: ${csvFile.path}');
  print('   Run validation: dart run scripts/validate_tflite.dart');
}

Future<Map<String, int>> _loadLabelMap(String path) async {
  final lines = await File(path).readAsLines();
  return {for (int i = 0; i < lines.length; i++) lines[i].trim(): i};
}

img.Image _generateSyntheticImage(String className, int variant) {
  // Create 224x224 image with class-specific patterns
  final image = img.Image(width: 224, height: 224);

  // Base color per class (hash of class name)
  final hash = className.codeUnits.fold(0, (a, b) => a + b);
  final baseR = (hash * 17) % 256;
  final baseG = (hash * 31) % 256;
  final baseB = (hash * 43) % 256;

  // Variant modifies the pattern
  final variantOffset = variant * 37;

  for (int y = 0; y < 224; y++) {
    for (int x = 0; x < 224; x++) {
      // Create leaf-like patterns with noise
      final dx = x - 112;
      final dy = y - 112;
      final dist = (dx * dx + dy * dy).toDouble();

      // Elliptical leaf shape
      final inLeaf = (dx * dx) / (100 * 100) + (dy * dy) / (80 * 80) <= 1;

      int r, g, b;

      if (inLeaf) {
        // Leaf texture with class-specific color variation
        final noise = ((x * 7 + y * 13 + variantOffset) % 64) - 32;
        final spotNoise = ((x * 11 + y * 17 + variantOffset * 5) % 128) - 64;

        // Disease spots for non-healthy classes
        final hasSpots = !className.contains('healthy') && spotNoise > 80;

        if (hasSpots) {
          // Disease spots - darker/brownish
          r = (baseR * 0.4 + noise).clamp(0, 255).toInt();
          g = (baseG * 0.3 + noise).clamp(0, 255).toInt();
          b = (baseB * 0.2 + noise).clamp(0, 255).toInt();
        } else {
          // Healthy leaf tissue
          r = (baseR + noise).clamp(0, 255).toInt();
          g = (baseG + 40 + noise).clamp(0, 255).toInt(); // Greenish
          b = (baseB + noise).clamp(0, 255).toInt();
        }
      } else {
        // Background - light gray
        r = 200 + ((x + y) % 20);
        g = 200 + ((x + y) % 20);
        b = 200 + ((x + y) % 20);
      }

      image.setPixelRgb(x, y, r, g, b);
    }
  }

  return image;
}

extension on num {
  int clamp(int min, int max) => this < min ? min : (this > max ? max : this.toInt());
}