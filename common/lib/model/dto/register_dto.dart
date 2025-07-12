import 'package:common/constants.dart';
import 'package:common/model/device.dart';
import 'package:common/model/dto/multicast_dto.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'register_dto.mapper.dart';

@MappableClass()
class RegisterDto with RegisterDtoMappable {
  final String alias;
  final String? version; // v2, format: major.minor
  final String? deviceModel;
  final DeviceType? deviceType;
  final String fingerprint;
  final int? port; // v2
  final ProtocolType? protocol; // v2
  final bool? download; // v2

  const RegisterDto({
    required this.alias,
    required this.version,
    required this.deviceModel,
    required this.deviceType,
    required this.fingerprint,
    required this.port,
    required this.protocol,
    required this.download,
  });

  static const fromJson = RegisterDtoMapper.fromJson;
}

extension RegisterDtoExt on RegisterDto {
  Device toDevice(String ip, int ownPort, bool ownHttps, DiscoveryMethod method) {
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
      discoveryMethods: {method},
    );
  }
}
