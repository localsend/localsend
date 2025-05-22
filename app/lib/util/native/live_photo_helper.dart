import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

final _logger = Logger('LivePhotoHelper');

class LivePhotoHelper {
  static const _methodChannel =
      MethodChannel('org.localsend.localsend_app/live_photo');

  static Future<bool> isLivePhotoSupported() async {
    try {
      final result = await _methodChannel.invokeMethod<bool>('isLivePhotoSupported');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  static Future<void> putLivePhoto({
    required String imagePath,
    required String videoPath,
    String? album,
  }) async {
    try {
      _logger.info('Saving live photo: image=$imagePath, video=$videoPath');
      await _methodChannel.invokeMethod<void>('putLivePhoto', {
        'imagePath': imagePath,
        'videoPath': videoPath,
        'album': album,
      });
    } on PlatformException catch (e, stackTrace) {
      _logger.severe('Failed to save live photo', e, stackTrace);
      rethrow;
    }
  }
}
