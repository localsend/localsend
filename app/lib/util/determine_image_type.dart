import 'dart:typed_data';

/// Returns the image type (PNG, JPEG, GIF, etc) of the given image data.
/// Usually based on the first few bytes of the image.
String determineImageType(Uint8List bytes) {
  if (bytes.lengthInBytes >= 2) {
    if (bytes[0] == 0xFF && bytes[1] == 0xD8) {
      return 'jpeg';
    }
    if (bytes[0] == 0x89 && bytes[1] == 0x50) {
      return 'png';
    }
    if (bytes[0] == 0x47 && bytes[1] == 0x49) {
      return 'gif';
    }
    if (bytes[0] == 0x42 && bytes[1] == 0x4D) {
      return 'bmp';
    }
  }
  return 'png';
}
