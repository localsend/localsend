import 'package:common/constants.dart';
import 'package:common/model/device.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'multicast_dto.mapper.dart';

@MappableEnum(defaultValue: ProtocolType.https)
enum ProtocolType { http, https }

@MappableClass()
class MulticastDto with MulticastDtoMappable {
  final String alias;
  final String? version; // v2, format: major.minor
  final String? deviceModel;
  final DeviceType? deviceType; // nullable since v2
  final String fingerprint;
  final int? port; // v2
  final ProtocolType? protocol; // v2
  final bool? download; // v2
  final bool? announcement; // v1
  final bool? announce; // v2

  const MulticastDto({
    required this.alias,
    required this.version,
    required this.deviceModel,
    required this.deviceType,
    required this.fingerprint,
    required this.port,
    required this.protocol,
    required this.download,
    required this.announcement,
    required this.announce,
  });

  static const fromJson = MulticastDtoMapper.fromJson;
}

extension MulticastDtoToDeviceExt on MulticastDto {
  Device toDevice(String ip, int ownPort, bool ownHttps) {
    return Device(
      signalingId: null,
      ip: ip,
      version: version ?? fallbackProtocolVersion,
      port: port ?? ownPort,
      https: protocol != null ? protocol == ProtocolType.https : ownHttps,
      fingerprint: fingerprint,
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType ?? DeviceType.desktop,
      download: download ?? false,
      discoveryMethods: {MulticastDiscovery()},
    );
  }
}
