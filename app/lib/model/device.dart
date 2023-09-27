import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';

enum DeviceType {
  mobile(Icons.smartphone),
  desktop(Icons.computer),
  web(Icons.language),
  headless(Icons.terminal),
  server(Icons.dns);

  const DeviceType(this.icon);

  final IconData icon;
}

/// Internal device model.
/// It gets not serialized.
@freezed
class Device with _$Device {
  const factory Device({
    required String ip,
    required String version,
    required int port,
    required bool https,
    required String fingerprint,
    required String alias,
    required String? deviceModel,
    required DeviceType deviceType,
    required bool download,
  }) = _Device;
}
