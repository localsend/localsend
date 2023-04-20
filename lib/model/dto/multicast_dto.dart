import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/device.dart';

part 'multicast_dto.freezed.dart';
part 'multicast_dto.g.dart';

enum ProtocolType { http, https }

@freezed
class MulticastDto with _$MulticastDto {
  const factory MulticastDto({
    required String alias,
    required String? version, // v2, format: major.minor
    required String? deviceModel,
    required DeviceType? deviceType, // nullable since v2
    required String fingerprint,
    required int? port, // v2
    required ProtocolType? protocol, // v2
    required bool? announcement, // v1
    required bool? announce, // v2
  }) = _MulticastDto;

  factory MulticastDto.fromJson(Map<String, Object?> json) => _$MulticastDtoFromJson(json);
}

extension InfoToDeviceExt on MulticastDto {
  Device toDevice(String ip, int ownPort, bool ownHttps) {
    return Device(
      ip: ip,
      version: version ?? fallbackProtocolVersion,
      port: port ?? ownPort,
      https: protocol != null ? protocol == ProtocolType.https : ownHttps,
      fingerprint: fingerprint,
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType ?? DeviceType.desktop,
    );
  }
}
