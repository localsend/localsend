import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

bool checkPlatform(List<TargetPlatform> platforms, {bool web = false}) {
  if (web && kIsWeb) {
    return true;
  }
  return platforms.contains(defaultTargetPlatform);
}

bool checkPlatformIsNot(List<TargetPlatform> platforms, {bool web = false}) {
  return !checkPlatform(platforms, web: web);
}

/// This platform runs on a "traditional" computer
bool checkPlatformIsDesktop() {
  return checkPlatform([TargetPlatform.linux, TargetPlatform.windows, TargetPlatform.macOS]);
}

/// This platform supports tray
bool checkPlatformHasTray() {
  return checkPlatform([TargetPlatform.windows, TargetPlatform.macOS, TargetPlatform.linux]);
}

/// This platform can receive share intents
bool checkPlatformCanReceiveShareIntent() {
  return checkPlatform([TargetPlatform.android, TargetPlatform.iOS]);
}

/// This platform can select folders
bool checkPlatformWithFolderSelect() {
  return checkPlatform([TargetPlatform.android, TargetPlatform.iOS, TargetPlatform.linux, TargetPlatform.windows, TargetPlatform.macOS]);
}

/// This platform has a gallery
bool checkPlatformWithGallery() {
  return checkPlatform([TargetPlatform.android, TargetPlatform.iOS]);
}

/// This platform has access to file system
/// On android, do not allow to change
bool checkPlatformWithFileSystem() {
  return checkPlatform([TargetPlatform.linux, TargetPlatform.windows, TargetPlatform.android, TargetPlatform.macOS]);
}

/// Convenience function to check if the app is not running on a Linux device with the Wayland display manager
bool checkPlatformIsNotWaylandDesktop() {
  if (checkPlatform([TargetPlatform.linux])) {
    if (Platform.environment['XDG_SESSION_TYPE'] == 'wayland') {
      return false;
    } else {
      return true;
    }
  }
  return true;
}

/// This platform supports payment (in-app purchase)
bool checkPlatformSupportPayment() {
  return checkPlatform([TargetPlatform.android, TargetPlatform.iOS, TargetPlatform.macOS]);
}
