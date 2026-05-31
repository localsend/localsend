import 'package:flutter/services.dart';

class ApkIconExtractor {
  static const _channel = MethodChannel('apk_icon_extractor');

  static Future<Uint8List?> extract(String apkPath) async {
    return await _channel.invokeMethod<Uint8List>(
      'extractIcon',
      apkPath,
    );
  }
}
