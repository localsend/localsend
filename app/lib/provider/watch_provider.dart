import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:refena_flutter/refena_flutter.dart';

final watchProvider = Provider<bool>((_) => throw Exception('watchProvider not initialized'), debugLabel: 'watchProvider');

/// Returns true if this device is a smartwatch.
/// Currently, only supports Wear OS.
Future<bool> checkIfWatch() async {
  if (checkPlatform([TargetPlatform.android])) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    return androidInfo.systemFeatures.contains('android.hardware.type.watch');
  } else {
    return false;
  }
}
