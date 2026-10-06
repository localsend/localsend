import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:open_file/open_file.dart';

final _logger = Logger('OpenFolder');

/// Opens the folder and optionally selects the file in the folder.
Future<void> openFolder({
  required String folderPath,
  String? fileName,
}) async {
  if (folderPath.startsWith('content://')) {
    await android_channel.openContentUri(uri: folderPath);
    return;
  }

  if (fileName != null && checkPlatform([TargetPlatform.windows, TargetPlatform.linux, TargetPlatform.macOS])) {
    // open folder and select file

    if (defaultTargetPlatform == TargetPlatform.windows) {
      folderPath = folderPath.replaceAll('/', '\\');
    }

    final result = await _showInFileManager(folderPath: folderPath, fileName: fileName);
    _logger.info('Open folder result: $result, path: $folderPath, file: $fileName');
    if (result) {
      return;
    }
    // fall through: open the folder without selecting the file
  }

  if (!folderPath.endsWith('/')) {
    folderPath = '$folderPath/';
  }

  final result = await OpenFile.open(folderPath);
  _logger.info('Open folder result: ${result.message}, path: $folderPath');
}

/// Opens [folderPath] in the platform's file manager with [fileName] selected.
/// Arguments are passed as a list (no shell), so file names received from remote devices cannot inject commands.
Future<bool> _showInFileManager({required String folderPath, required String fileName}) async {
  final separator = defaultTargetPlatform == TargetPlatform.windows ? '\\' : '/';
  final filePath = folderPath.endsWith(separator) ? '$folderPath$fileName' : '$folderPath$separator$fileName';
  if (!File(filePath).existsSync()) {
    return false;
  }

  try {
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
        final result = await Process.run('open', ['-R', filePath]);
        return result.exitCode == 0;
      case TargetPlatform.windows:
        // explorer.exe exit codes are meaningless (it usually returns 1 even on success)
        await Process.run('explorer.exe', ['/select,', filePath]);
        return true;
      case TargetPlatform.linux:
        final result = await Process.run('dbus-send', [
          '--session',
          '--print-reply',
          '--dest=org.freedesktop.FileManager1',
          '/org/freedesktop/FileManager1',
          'org.freedesktop.FileManager1.ShowItems',
          'array:string:${Uri.file(filePath).toString()}',
          'string:',
        ]);
        return result.exitCode == 0;
      default:
        return false;
    }
  } catch (e) {
    _logger.warning('Failed to show file in file manager', e);
    return false;
  }
}
