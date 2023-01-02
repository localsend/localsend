import 'package:flutter/foundation.dart';

bool checkPlatform(List<TargetPlatform> platforms, {bool web = false}) {
  if (web && kIsWeb) {
    return true;
  }
  return platforms.contains(defaultTargetPlatform);
}

/// This platform can receive share intents
bool checkPlatformCanReceiveShareIntent() {
  return checkPlatform([TargetPlatform.android, TargetPlatform.iOS]);
}

/// This platform has a gallery
bool checkPlatformWithGallery() {
  return checkPlatform([TargetPlatform.android, TargetPlatform.iOS, TargetPlatform.macOS]);
}

/// This platform has access to file system
/// On android, do not allow to change
bool checkPlatformWithFileSystem() {
  return checkPlatform([TargetPlatform.linux, TargetPlatform.windows, TargetPlatform.android, TargetPlatform.macOS]);
}
