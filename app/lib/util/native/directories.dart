import 'dart:io' show Directory, Platform;

import 'package:flutter/foundation.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:mime/mime.dart';
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

Future<String> getDestionationDirectoryByFileType(String fileName, SettingsState settings) async {
  final defaultDestination = await getDefaultDestinationDirectory();
  final String? rawMime = lookupMimeType(fileName);
  print('fileName: $fileName, rawMime: $rawMime');
  if (rawMime == null) {
    return settings.destination ?? defaultDestination;
  }

  // some mime types are "application" but users see it as documents
  // "application/vnd.openxmlformats-officedocument.wordprocessingml.document" is docx
  if (rawMime.contains('document') || rawMime.contains('pdf')) {
    return settings.documentsDestination ?? defaultDestination;
  }

  // other types has "correct" type in first part
  switch (rawMime.split('/').first) {
    case 'text':
      return settings.documentsDestination ?? defaultDestination;
    case 'image' || 'video':
      return settings.mediaDestination ?? defaultDestination;
    case 'audio':
      return settings.destination ?? defaultDestination;
    default:
      return settings.destination ?? defaultDestination;
  }
}
