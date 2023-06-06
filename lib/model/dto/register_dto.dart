import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/multicast_dto.dart';

part 'register_dto.freezed.dart';
part 'register_dto.g.dart';

@freezed
class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    required String alias,
    required String? version, // v2, format: major.minor
    required String? deviceModel,
    @JsonKey(unknownEnumValue: DeviceType.desktop) // ignore: invalid_annotation_target
    required DeviceType? deviceType,
    required String fingerprint,
    required int? port, // v2
    required ProtocolType? protocol, // v2
    required bool? download, // v2
  }) = _RegisterDto;

  factory RegisterDto.fromJson(Map<String, Object?> json) => _$RegisterDtoFromJson(json);
}

extension RegisterDtoExt on RegisterDto {
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
      download: download ?? false,
    );
  }
}
