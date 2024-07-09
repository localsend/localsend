import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:win32_registry/win32_registry.dart';

const startHiddenFlag = '--hidden';

final _logger = Logger('AutoStartHelper');

Future<bool> enableAutoStart({required bool startHidden}) async {
  try {
    if (checkPlatform(const [TargetPlatform.linux, TargetPlatform.macOS])) {
      final packageInfo = await PackageInfo.fromPlatform();
      launchAtStartup.setup(
        appName: packageInfo.appName,
        appPath: Platform.resolvedExecutable,
        args: [
          if (startHidden) startHiddenFlag,
        ],
      );
      await launchAtStartup.enable();
    } else {
      // launch_at_startup does not add quotes around the executable path
      final packageInfo = await PackageInfo.fromPlatform();
      _getWindowsRegistryKey().createValue(RegistryValue(
        packageInfo.appName,
        RegistryValueType.string,
        '"${Platform.resolvedExecutable}"${startHidden ? ' $startHiddenFlag' : ''}',
      ));
    }
    return true;
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
        File(_getLinuxFilePath(packageInfo.appName)).deleteSync();
        break;
      case TargetPlatform.macOS:
        File(_getMacOSFilePath(packageInfo.appName)).deleteSync();
        break;
      case TargetPlatform.windows:
        _getWindowsRegistryKey().deleteValue(packageInfo.appName);
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
      return File(_getLinuxFilePath(packageInfo.appName)).existsSync();
    case TargetPlatform.macOS:
      return File(_getMacOSFilePath(packageInfo.appName)).existsSync();
    case TargetPlatform.windows:
      return _getWindowsRegistryKey().getValueAsString(packageInfo.appName)?.contains(Platform.resolvedExecutable) ?? false;
    default:
      return false;
  }
}

Future<bool> isAutoStartHidden() async {
  final packageInfo = await PackageInfo.fromPlatform();
  switch (defaultTargetPlatform) {
    case TargetPlatform.linux:
      final file = File(_getLinuxFilePath(packageInfo.appName));
      if (!file.existsSync()) {
        return false;
      }
      return file.readAsStringSync().contains(startHiddenFlag);
    case TargetPlatform.macOS:
      final file = File(_getMacOSFilePath(packageInfo.appName));
      if (!file.existsSync()) {
        return false;
      }
      return file.readAsStringSync().contains(startHiddenFlag);
    case TargetPlatform.windows:
      return _getWindowsRegistryKey().getValueAsString(packageInfo.appName)?.contains(startHiddenFlag) ?? false;
    default:
      return false;
  }
}

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

String _getMacOSFilePath(String appName) {
  return '${Platform.environment['HOME']}/Library/LaunchAgents/$appName.plist';
}
