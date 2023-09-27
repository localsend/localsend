import 'dart:io' show Directory, Platform;

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:shared_storage/shared_storage.dart' as shared_storage;

Future<String> getDefaultDestinationDirectory() async {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      // ignore: deprecated_member_use
      final dir = await shared_storage.getExternalStoragePublicDirectory(shared_storage.EnvironmentDirectory.downloads);
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
