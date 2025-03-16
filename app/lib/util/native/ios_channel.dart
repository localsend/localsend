import 'dart:async';

import 'package:flutter/services.dart';

const _methodChannel = MethodChannel('ios-delegate-channel');

Future<bool> isReduceMotionEnabledIOS() async {
  return await _methodChannel.invokeMethod('isReduceMotionEnabled') ?? false;
}
