import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

final _logger = Logger('SoftwareRenderingHelper');

/// Implemented in linux/my_application.cc.
const _platformChannel = MethodChannel('org.localsend.localsend_app/platform');

/// Whether the next launch uses Flutter's software renderer (Linux only).
Future<bool> isSoftwareRenderingEnabled() async {
  if (defaultTargetPlatform != TargetPlatform.linux) {
    return false;
  }

  try {
    return await _platformChannel.invokeMethod<bool>('isSoftwareRenderingEnabled') ?? false;
  } catch (e) {
    _logger.warning('Failed to read software rendering setting', e);
    return false;
  }
}

/// Enables or disables software rendering for the next launch (Linux only).
/// Returns true on success.
Future<bool> setSoftwareRenderingEnabled(bool enabled) async {
  if (defaultTargetPlatform != TargetPlatform.linux) {
    return false;
  }

  try {
    return await _platformChannel.invokeMethod<bool>('setSoftwareRenderingEnabled', enabled) ?? false;
  } catch (e) {
    _logger.warning('Failed to write software rendering setting', e);
    return false;
  }
}

/// Must be called before exiting without rendering a frame,
/// otherwise the next launch assumes a rendering crash and falls back to software rendering.
Future<void> cancelRenderCheck() async {
  if (defaultTargetPlatform != TargetPlatform.linux) {
    return;
  }

  try {
    await _platformChannel.invokeMethod<void>('cancelRenderCheck');
  } catch (e) {
    _logger.warning('Failed to cancel render check', e);
  }
}
