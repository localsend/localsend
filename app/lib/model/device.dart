import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'device.mapper.dart';

@MappableEnum(defaultValue: DeviceType.desktop)
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
@MappableClass()
class Device with DeviceMappable {
  final String ip;
  final String version;
  final int port;
  final bool https;
  final String fingerprint;
  final String alias;
  final String? deviceModel;
  final DeviceType deviceType;
  final bool download;

  const Device({
    required this.ip,
    required this.version,
    required this.port,
    required this.https,
    required this.fingerprint,
    required this.alias,
    required this.deviceModel,
    required this.deviceType,
    required this.download,
  });
}
