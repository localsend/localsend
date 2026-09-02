// Platform-specific implementation using dart:io (Android/iOS/Windows/macOS/Linux)
import 'dart:io' as io;

/// Returns true if the current platform is Android.
/// This implementation is used on native platforms (non-web).
bool get isAndroidPlatform {
  return io.Platform.isAndroid;
}
