import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

final _logger = Logger('ContextMenuHelper');

Future<bool> enableContextMenu() async {
  if (defaultTargetPlatform != TargetPlatform.windows) {
    return false;
  }

  try {
    final String script =
        '''
\$TargetPath = "${Platform.resolvedExecutable}"
\$ShortcutFile = "${_getWindowsFilePath(_windowsFileName)}"
\$WScriptShell = New-Object -ComObject WScript.Shell
\$Shortcut = \$WScriptShell.CreateShortcut(\$ShortcutFile)
\$Shortcut.TargetPath = \$TargetPath
\$Shortcut.Save()
''';
    final result = await Process.run('powershell', ['-Command', script]);
    if (result.stderr != null && result.stderr!.isNotEmpty) {
      throw Exception('Failed to create shortcut: ${result.stderr}');
    }
    return await File(_getWindowsFilePath(_windowsFileName)).exists();
  } catch (e) {
    _logger.severe('Failed to enable context menu: $e');
    return false;
  }
}

Future<bool> disableContextMenu() async {
  try {
    switch (defaultTargetPlatform) {
      case TargetPlatform.windows:
        final file = File(_getWindowsFilePath(_windowsFileName));
        if (await file.exists()) {
          await file.delete();
        }
        return true;
      default:
        return false;
    }
  } catch (e) {
    return false;
  }
}

Future<bool> isContextMenuEnabled() async {
  switch (defaultTargetPlatform) {
    case TargetPlatform.windows:
      return await File(_getWindowsFilePath(_windowsFileName)).exists();
    default:
      return false;
  }
}

const _windowsFileName = 'LocalSend';

String _getWindowsFilePath(String appName) {
  final appData = Platform.environment['APPDATA'];
  return '$appData/Microsoft/Windows/SendTo/$appName.lnk';
}
