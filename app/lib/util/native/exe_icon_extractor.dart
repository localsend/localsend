import 'package:flutter/services.dart';

class ExecutableIconExtractor {
  static const MethodChannel _channel = MethodChannel('exe_icon_extractor');

  static Future<Uint8List?> extract(String path) async {
    final bytes = await _channel.invokeMethod<Uint8List>(
      'extractIcon',
      path,
    );

    return bytes;
  }
}
