import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:localsend_app/util/native/macos_channel.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:win32_registry/win32_registry.dart';

const startHiddenFlag = '--hidden';

final _logger = Logger('AutoStartHelper');

bool _isRunningInFlatpak() {
  return Platform.environment['container'] == 'flatpak' ||
      Platform.environment.containsKey('FLATPAK_ID') ||
      Platform.environment.containsKey('FLATPAK_SANDBOX_DIR');
}

Future<String?> _getLinuxAutostartDir() async {
  if (_isRunningInFlatpak()) {
    final result = await Process.run('flatpak-spawn', [
      '--host',
      'sh',
      '-c',
      'echo "$HOME/.config/autostart"',
    ]);
    if (result.exitCode == 0) {
      return (result.stdout as String).trim();
    }
  }
  return '${Platform.environment['HOME']}/.config/autostart';
}

Future<bool> _writeLinuxDesktopFile(String appName, String execLine) async {
  final dir = await _getLinuxAutostartDir();
  if (dir == null) return false;

  final contents = '''
[Desktop Entry]
Type=Application
Name=$appName
Comment=$appName startup script
Exec=$execLine
StartupNotify=false
Terminal=false
''';

  final path = '$dir/$appName.desktop';
  if (_isRunningInFlatpak()) {
    final result = await Process.run('flatpak-spawn', [
      '--host',
      'sh',
      '-c',
      'mkdir -p "$HOME/.config/autostart" && cat > "$HOME/.config/autostart/$appName.desktop"',
      stdin: contents,
    ]);
    return result.exitCode == 0;
  } else {
    final file = File(path);
    if (!file.parent.existsSync()) {
      file.parent.createSync(recursive: true);
    }
    file.writeAsStringSync(contents);
    return true;
  }
}

Future<bool> _deleteLinuxDesktopFile(String appName) async {
  final dir = await _getLinuxAutostartDir();
  if (dir == null) return false;

  final path = '$dir/$appName.desktop';
  if (_isRunningInFlatpak()) {
    final result = await Process.run('flatpak-spawn', [
      '--host',
      'sh',
      '-c',
      'rm -f "$HOME/.config/autostart/$appName.desktop"',
    ]);
    return result.exitCode == 0;
  } else {
    return File(path).deleteSync() == null;
  }
}

Future<bool> _linuxDesktopFileExists(String appName) async {
  final dir = await _getLinuxAutostartDir();
  if (dir == null) return false;

  final path = '$dir/$appName.desktop';
  if (_isRunningInFlatpak()) {
    final result = await Process.run('flatpak-spawn', [
      '--host',
      'sh',
      '-c',
      'test -f "$HOME/.config/autostart/$appName.desktop"',
    ]);
    return result.exitCode == 0;
  } else {
    return File(path).existsSync();
  }
}

Future<String> _readLinuxDesktopFile(String appName) async {
  final dir = await _getLinuxAutostartDir();
  final path = '$dir/$appName.desktop';
  if (_isRunningInFlatpak()) {
    final result = await Process.run('flatpak-spawn', [
      '--host',
      'sh',
      '-c',
      'cat "$HOME/.config/autostart/$appName.desktop" 2>/dev/null || true',
    ]);
    return result.stdout as String;
  }
  try {
    return File(path).readAsStringSync();
  } catch (_) {
    return '';
  }
}

String _getLinuxExecLine(String appName, {required bool startHidden}) {
  if (_isRunningInFlatpak()) {
    final flatpakId = Platform.environment['FLATPAK_ID'] ?? appName;
    return 'flatpak run $flatpakId${startHidden ? ' $startHiddenFlag' : ''}';
  }
  return '${Platform.resolvedExecutable}${startHidden ? ' $startHiddenFlag' : ''}';
}

Future<bool> enableAutoStart({required bool startHidden}) async {
  try {
    final packageInfo = await PackageInfo.fromPlatform();
    switch (defaultTargetPlatform) {
      case TargetPlatform.linux:
        return await _writeLinuxDesktopFile(
          packageInfo.appName,
          _getLinuxExecLine(packageInfo.appName, startHidden: startHidden),
        );
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

Future<bool> disableAutoStart() async {
  try {
    final packageInfo = await PackageInfo.fromPlatform();
    switch (defaultTargetPlatform) {
      case TargetPlatform.linux:
        await _deleteLinuxDesktopFile(packageInfo.appName);
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
      return await _linuxDesktopFileExists(packageInfo.appName);
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
      final contents = await _readLinuxDesktopFile(packageInfo.appName);
      return contents.contains(startHiddenFlag);
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
