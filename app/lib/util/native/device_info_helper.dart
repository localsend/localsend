import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/device_info_result.dart';
import 'package:logging/logging.dart';
// ignore: implementation_imports
import 'package:slang/src/builder/model/enums.dart';
// ignore: implementation_imports
import 'package:slang/src/builder/utils/string_extensions.dart';

final _logger = Logger('DeviceInfoHelper');

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

Future<String?> getDeviceName() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    try {
      final info = await DeviceInfoPlugin().androidInfo;
      final name = info.name.trim();
      if (name.isNotEmpty) {
        return name;
      }
      final model = info.model.trim();
      return model.isEmpty ? null : model;
    } catch (e, stackTrace) {
      _logger.warning('Could not get Android device name', e, stackTrace);
      return null;
    }
  }

  if (defaultTargetPlatform == TargetPlatform.iOS) {
    try {
      final info = await DeviceInfoPlugin().iosInfo;
      return resolveIosDeviceName(
        name: info.name,
        model: info.model,
        localizedModel: info.localizedModel,
        modelName: info.modelName,
      );
    } catch (e, stackTrace) {
      _logger.warning('Failed to get iOS device name', e, stackTrace);
      return null;
    }
  }

  if (defaultTargetPlatform == TargetPlatform.macOS) {
    final result = await Process.run('scutil', ['--get', 'ComputerName']);
    return result.stdout.toString().trim();
  }

  return Platform.localHostname;
}

/// Resolves the best available iOS device name from `device_info_plus` fields.
///
/// Starting in iOS 16, `UIDevice.current.name` returns a generic model string
/// (such as `"iPhone"`) unless the restricted `user-assigned-device-name`
/// entitlement is present. When [name] is generic, fall back to the mapped
/// hardware [modelName] (ignoring `device_info_plus`'s `'Unknown device'`
/// sentinel), then [localizedModel], then [model].
@visibleForTesting
String? resolveIosDeviceName({
  required String name,
  required String model,
  required String localizedModel,
  required String modelName,
}) {
  final trimmedName = name.trim();
  final trimmedModel = model.trim();
  final trimmedLocalizedModel = localizedModel.trim();
  final trimmedModelName = modelName.trim();

  if (trimmedName.isNotEmpty && trimmedName != trimmedModel && trimmedName != trimmedLocalizedModel) {
    return trimmedName;
  }

  if (trimmedModelName.isNotEmpty && trimmedModelName != 'Unknown device') {
    return trimmedModelName;
  }

  if (trimmedLocalizedModel.isNotEmpty) {
    return trimmedLocalizedModel;
  }

  if (trimmedModel.isNotEmpty) {
    return trimmedModel;
  }

  return null;
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
