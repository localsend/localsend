import 'dart:io';

import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:localsend_app/init.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

final _logger = Logger('AutoStartHelper');

/// Currently, only works for windows
Future<bool> initEnableAutoStartAndOpenSettings(SettingsState settings, [bool? isWindows]) async {
  try {
    // In case somebody don't use msix
    final packageInfo = await PackageInfo.fromPlatform();
    launchAtStartup.setup(
      appName: packageInfo.appName,
      appPath: Platform.resolvedExecutable,
      args: [if (!settings.autoStartLaunchMinimized) launchAtStartupArg],
    );

    // We just add this entry so we have the same behaviour like in msix
    if (!(await launchAtStartup.isEnabled())) {
      final result = await launchAtStartup.enable();
      return result;
    }
  } catch (e) {
    _logger.warning('Could not init auto start', e);
    return false;
  }

  // Can be linux on startup flag change
  if (isWindows ?? false) {
    try {
      // Ideally, we should configure it programmatically
      // The launch_at_startup package does not support this currently
      // See: https://learn.microsoft.com/en-us/uwp/api/Windows.ApplicationModel.StartupTask?view=winrt-22621
      await launchUrl(Uri.parse('ms-settings:startupapps'));
    } catch (e) {
      _logger.warning('Could not open startup settings', e);
    }
  }
  return false;
}

Future<bool> initDisableAutoStart(SettingsState settings) async {
  try {
    // In case somebody don't use msix
    final packageInfo = await PackageInfo.fromPlatform();
    launchAtStartup.setup(
      appName: packageInfo.appName,
      appPath: Platform.resolvedExecutable,
      args: [if (settings.autoStartLaunchMinimized) launchAtStartupArg],
    );

    // We just add this entry so we have the same behaviour like in msix
    if (await launchAtStartup.isEnabled()) {
      final result = await launchAtStartup.disable();
      return result;
    }
  } catch (e) {
    _logger.warning('Could not init auto start', e);
    return false;
  }
  return false;
}

Future<bool> isLinuxLaunchAtStartEnabled() async {
  final packageInfo = await PackageInfo.fromPlatform();
  File desktopFile = File('${Platform.environment['HOME']}/.config/autostart/${packageInfo.appName}.desktop');
  return desktopFile.existsSync();
}
