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
}

/// Function to check if the device supports Live Photo feature
/// This function can be used during app initialization similar to getDeviceInfo()
Future<bool> supportLivePhoto() async {
  final isSupported = await LivePhotoHelper.isLivePhotoSupported();
  _logger.info('LivePhoto support: $isSupported');
  return isSupported;
}
