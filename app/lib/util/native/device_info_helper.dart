import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/device_info_result.dart';
// ignore: implementation_imports
import 'package:slang/src/builder/model/enums.dart';
// ignore: implementation_imports
import 'package:slang/src/builder/utils/string_extensions.dart';

Future<DeviceInfoResult> getDeviceInfo() async {
  final plugin = DeviceInfoPlugin();
  final DeviceType deviceType;
  final String? deviceModel;
  int? androidSdkInt;

  if (kIsWeb) {
    deviceType = DeviceType.web;
    final deviceInfo = await plugin.webBrowserInfo;
    deviceModel = deviceInfo.browserName.humanName;
  } else {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        deviceType = DeviceType.mobile;
        break;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.fuchsia:
        deviceType = DeviceType.desktop;
        break;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        final deviceInfo = await plugin.androidInfo;
        deviceModel = deviceInfo.brand.toCase(CaseStyle.pascal);
        androidSdkInt = deviceInfo.version.sdkInt;
        break;
      case TargetPlatform.iOS:
        final deviceInfo = await plugin.iosInfo;
        deviceModel = deviceInfo.localizedModel;
        break;
      case TargetPlatform.linux:
        deviceModel = 'Linux';
        break;
      case TargetPlatform.macOS:
        deviceModel = 'macOS';
        break;
      case TargetPlatform.windows:
        deviceModel = 'Windows';
        break;
      case TargetPlatform.fuchsia:
        deviceModel = 'Fuchsia';
        break;
    }
  }

  return DeviceInfoResult(
    deviceType: deviceType,
    deviceModel: deviceModel,
    androidSdkInt: androidSdkInt,
  );
}

/// The device's own name, for the "use system name" shortcut in the settings.
///
/// [Platform.localHostname] is the right answer on desktop, but on Android it
/// resolves to `localhost` rather than the device name, so the shortcut set the
/// alias to "localhost". Android is served from `Settings.Global.DEVICE_NAME`
/// instead, falling back to the model.
///
/// Returns `null` when no usable name can be determined, so the caller can keep
/// the current alias rather than replacing it with something meaningless.
Future<String?> getSystemDeviceName() async {
  if (checkPlatform([TargetPlatform.android])) {
    return _getAndroidDeviceName();
  }

  if (checkPlatform([TargetPlatform.macOS])) {
    try {
      final result = await Process.run('scutil', ['--get', 'ComputerName']);
      return cleanDeviceName(result.stdout.toString());
    } catch (_) {
      return null;
    }
  }

  return cleanDeviceName(Platform.localHostname);
}

/// `Settings.Global.DEVICE_NAME`, then the model, via the Android channel.
Future<String?> _getAndroidDeviceName() async {
  try {
    final deviceName = await android_channel.getDeviceNameAndroid();
    final name = cleanDeviceName(deviceName);
    if (name != null) {
      return name;
    }
  } catch (_) {
    // Channel unavailable (older install, or not Android); fall through.
  }

  return cleanDeviceName(await getDeviceModel());
}

/// `Build.MODEL`, which is what `AndroidDeviceInfo.brand` is not: some OEM ROMs
/// report `localhost` there.
Future<String?> getDeviceModel() async {
  try {
    final info = await DeviceInfoPlugin().androidInfo;
    return cleanDeviceName(info.model);
  } catch (_) {
    return null;
  }
}

/// Rejects names that carry no information, so they never replace a good alias.
String? cleanDeviceName(String? name) {
  final trimmed = name?.trim() ?? '';
  if (trimmed.isEmpty) {
    return null;
  }

  final normalized = trimmed.toLowerCase();
  if (const {'localhost', '127.0.0.1', 'unknown'}.contains(normalized)) {
    return null;
  }

  // `scutil --get ComputerName` prints a diagnostic line instead of a name when
  // the value is unset, and that line would otherwise become the alias.
  if (normalized.contains('not set') || normalized.startsWith('scutil')) {
    return null;
  }

  return trimmed;
}

extension on BrowserName {
  String? get humanName {
    switch (this) {
      case BrowserName.firefox:
        return 'Firefox';
      case BrowserName.samsungInternet:
        return 'Samsung Internet';
      case BrowserName.opera:
        return 'Opera';
      case BrowserName.msie:
        return 'Internet Explorer';
      case BrowserName.edge:
        return 'Microsoft Edge';
      case BrowserName.chrome:
        return 'Google Chrome';
      case BrowserName.safari:
        return 'Safari';
      case BrowserName.unknown:
        return null;
    }
  }
}
