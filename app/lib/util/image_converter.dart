import 'dart:typed_data';

import 'package:image/image.dart';

/// Converts BMP image data to PNG image data.
Future<Uint8List> convertBmpToPng(Uint8List bmp) async {
  final pngImage =
      await (Command()
            ..decodeBmp(bmp)
            ..encodePng())
          .getBytesThread();

  if (pngImage == null) {
    throw Exception('Failed to convert BMP to PNG');
  }

  return pngImage;
}
