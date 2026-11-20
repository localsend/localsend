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

/// Tells the runner that the app quits on purpose, otherwise a quit shortly after the start looks like a rendering
/// crash to the next launch, which then falls back to software rendering (Linux only).
/// Needed because `exit` ends the process without running native exit handlers, so the runner can't tell on its own.
Future<void> releaseRenderCheck() async {
  if (defaultTargetPlatform != TargetPlatform.linux) {
    return;
  }

  try {
    await _platformChannel.invokeMethod<void>('releaseRenderCheck');
  } catch (e) {
    _logger.warning('Failed to release render check', e);
  }
}
