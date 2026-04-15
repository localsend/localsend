import 'dart:io' show Directory, Platform;

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;

Future<String> getDefaultDestinationDirectory() async {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      final dir = await path.getDownloadsDirectory();
      return dir?.path ?? '/storage/emulated/0/Download';
    case TargetPlatform.iOS:
      return (await path.getApplicationDocumentsDirectory()).path;
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
    case TargetPlatform.fuchsia:
      var downloadDir = await path.getDownloadsDirectory();
      if (downloadDir == null) {
        if (defaultTargetPlatform == TargetPlatform.windows) {
          downloadDir = Directory('${Platform.environment['HOMEPATH']}/Downloads');
          if (!downloadDir.existsSync()) {
            downloadDir = Directory(Platform.environment['HOMEPATH']!);
          }
        } else {
          downloadDir = Directory('${Platform.environment['HOME']}/Downloads');
          if (!downloadDir.existsSync()) {
            downloadDir = Directory(Platform.environment['HOME']!);
          }
        }
      }
      return downloadDir.path.replaceAll('\\', '/');
  }
}

Future<String> getCacheDirectory() async {
  return (await path.getTemporaryDirectory()).path;
}

/// Ensures the given [directoryPath] exists on disk.
/// Creates it (with parents) if missing.
/// Returns true if the directory exists after this call, false if creation failed.
/// Skips validation for Android content:// URIs.
Future<bool> ensureDirectoryExists(String directoryPath) async {
  if (directoryPath.startsWith('content://')) {
    return true;
  }
  final dir = Directory(directoryPath);
  if (await dir.exists()) {
    return true;
  }
  try {
    await dir.create(recursive: true);
    return true;
  } catch (_) {
    return false;
  }
}
