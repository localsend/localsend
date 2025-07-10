import 'package:flutter/services.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';

final _logger = Logger('LivePhotoHelper');

/// Helper class for Live Photo related operations
class LivePhotoHelper {
  static const _methodChannel = MethodChannel('org.localsend.localsend_app/live_photo');

  /// Checks if the device supports Live Photo feature
  static Future<bool> isLivePhotoSupported() async {
    if (!checkPlatformWithGallery()) {
      return false;
    }
    try {
      final result = await _methodChannel.invokeMethod<bool>('isLivePhotoSupported');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Creates and saves a Live Photo from image and video files
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

/// Function to check if the device supports Live Photo feature
/// This function can be used during app initialization similar to getDeviceInfo()
Future<bool> supportLivePhoto() async {
  final isSupported = await LivePhotoHelper.isLivePhotoSupported();
  _logger.info('LivePhoto support: $isSupported');
  return isSupported;
}
