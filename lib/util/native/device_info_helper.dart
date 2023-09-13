import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/model/device.dart';
import 'package:slang/builder/model/enums.dart';
import 'package:slang/builder/utils/string_extensions.dart';

class DeviceInfoResult {
  final DeviceType deviceType;
  final String? deviceModel;

  // Used to properly set Edge-to-Edge mode on Android
  // See https://github.com/flutter/flutter/issues/90098
  final int? androidSdkInt;

  DeviceInfoResult({
    required this.deviceType,
    required this.deviceModel,
    required this.androidSdkInt,
  });
}

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
