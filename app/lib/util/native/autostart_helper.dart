import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:localsend_app/util/native/macos_channel.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:win32_registry/win32_registry.dart';

const startHiddenFlag = '--hidden';

final _logger = Logger('AutoStartHelper');

Future<bool> enableAutoStart({required bool startHidden}) async {
  try {
    final packageInfo = await PackageInfo.fromPlatform();
    switch (defaultTargetPlatform) {
      case TargetPlatform.linux:
        final appImage = Platform.environment['APPIMAGE'];
        _writeLinuxAutoStartFile(
          File(_getLinuxFilePath(packageInfo.packageName)),
          appName: packageInfo.appName,
          executable: appImage != null && appImage.isNotEmpty ? appImage : Platform.resolvedExecutable,
          startHidden: startHidden,
        );
        return true;
      case TargetPlatform.macOS:
        await setLaunchAtLogin(true);
        await setLaunchAtLoginMinimized(startHidden);
        return true;
      case TargetPlatform.windows:
        _getWindowsRegistryKey().createValue(
          RegistryValue.string(
            _windowsRegistryKeyValue,
            '"${Platform.resolvedExecutable}"${startHidden ? ' $startHiddenFlag' : ''}',
          ),
        );
        return true;
      default:
        return false;
    }
  } catch (e) {
    _logger.warning('Could enable auto start', e);
    return false;
  }
}

void _writeLinuxAutoStartFile(
  File file, {
  required String appName,
  required String executable,
  required bool startHidden,
}) {
  final contents =
      '''
[Desktop Entry]
Type=Application
Name=$appName
Comment=$appName startup script
Exec=${_desktopExecExecutable(executable)}${startHidden ? ' $startHiddenFlag' : ''}
StartupNotify=false
Terminal=false
''';
  file.parent.createSync(recursive: true);
  file.writeAsStringSync(contents);
}

// The desktop entry's string escaping runs before Exec quoting, so a literal
// backslash in a quoted argument needs four backslashes in the file.
String _desktopExecExecutable(String executable) {
  const escapes = {
    '\\': r'\\\\',
    '"': r'\\"',
    '`': r'\\`',
    r'$': r'\\$',
    '\n': r'\n',
    '\r': r'\r',
    '\t': r'\t',
    '%': '%%',
  };
  final escaped = executable.replaceAllMapped(RegExp(r'[\\"`$\n\r\t%]'), (match) => escapes[match[0]]!);
  return '"$escaped"';
}

Future<bool> disableAutoStart() async {
  try {
    final packageInfo = await PackageInfo.fromPlatform();
    switch (defaultTargetPlatform) {
      case TargetPlatform.linux:
        File(_getLinuxFilePath(packageInfo.packageName)).deleteSync();
        break;
      case TargetPlatform.macOS:
        await setLaunchAtLogin(false);
        break;
      case TargetPlatform.windows:
        _getWindowsRegistryKey().deleteValue(_windowsRegistryKeyValue);
        break;
      default:
        break;
    }
    return true;
  } catch (e) {
    _logger.warning('Could disable auto start', e);
    return false;
  }
}

Future<bool> isAutoStartEnabled() async {
  final packageInfo = await PackageInfo.fromPlatform();
  switch (defaultTargetPlatform) {
    case TargetPlatform.linux:
      return File(_getLinuxFilePath(packageInfo.packageName)).existsSync();
    case TargetPlatform.macOS:
      return await getLaunchAtLogin();
    case TargetPlatform.windows:
      return _getWindowsRegistryKey().getStringValue(_windowsRegistryKeyValue)?.contains(Platform.resolvedExecutable) ?? false;
    default:
      return false;
  }
}

Future<bool> isAutoStartHidden() async {
  final packageInfo = await PackageInfo.fromPlatform();
  switch (defaultTargetPlatform) {
    case TargetPlatform.linux:
      final file = File(_getLinuxFilePath(packageInfo.packageName));
      if (!file.existsSync()) {
        return false;
      }
      return file.readAsStringSync().contains(startHiddenFlag);
    case TargetPlatform.macOS:
      return await getLaunchAtLoginMinimized();
    case TargetPlatform.windows:
      return _getWindowsRegistryKey().getStringValue(_windowsRegistryKeyValue)?.contains(startHiddenFlag) ?? false;
    default:
      return false;
  }
}

const _windowsRegistryKeyValue = 'LocalSend';

RegistryKey _getWindowsRegistryKey() {
  return Registry.openPath(
    RegistryHive.currentUser,
    path: r'Software\Microsoft\Windows\CurrentVersion\Run',
    desiredAccessRights: AccessRights.allAccess,
  );
}

String _getLinuxFilePath(String appName) {
  return '${Platform.environment['HOME']}/.config/autostart/$appName.desktop';
}
