import 'dart:io';

import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:localsend_app/init.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Currently, only works for windows
Future<void> initAutoStartAndOpenSettings() async {
  try {
    // In case somebody don't use msix
    final packageInfo = await PackageInfo.fromPlatform();
    launchAtStartup.setup(
      appName: packageInfo.appName,
      appPath: Platform.resolvedExecutable,
      args: [launchAtStartupArg],
    );

    // We just add this entry so we have the same behaviour like in msix
    if (await launchAtStartup.isEnabled()) {
      await launchAtStartup.enable();
    } else {
      await launchAtStartup.disable();
    }
  } catch (e) {
    print(e);
  }

  try {
    // Ideally, we should configure it programmatically
    // The launch_at_startup package does not support this currently
    // See: https://learn.microsoft.com/en-us/uwp/api/Windows.ApplicationModel.StartupTask?view=winrt-22621
    await launchUrl(Uri.parse('ms-settings:startupapps'));
  } catch (e) {
    print(e);
  }
}
