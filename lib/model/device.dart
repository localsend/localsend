import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';
part 'device.g.dart';

enum DeviceType {
  mobile(Icons.smartphone),
  desktop(Icons.computer),
  web(Icons.language);

  const DeviceType(this.icon);

  final IconData icon;
}

@freezed
class Device with _$Device {
  const factory Device({
    required String ip,
    required String alias,
    required String? deviceModel,
    required DeviceType deviceType,
  }) = _Device;

  factory Device.fromJson(Map<String, Object?> json) => _$DeviceFromJson(json);
}
