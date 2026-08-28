import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class CameraService {
  CameraService({ImagePicker? picker}) : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;

  Future<Uint8List?> captureLeaf({
    ImageSource source = ImageSource.camera,
  }) async {
    final image = await _picker.pickImage(
      source: source,
      maxWidth: 224,
      maxHeight: 224,
      imageQuality: 85,
    );
    return image?.readAsBytes();
  }
}
