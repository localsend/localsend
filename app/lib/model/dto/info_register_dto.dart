import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/multicast_dto.dart';

part 'info_register_dto.freezed.dart';
part 'info_register_dto.g.dart';

/// Used only for /prepare-upload to be compatible with v1.
/// The [fingerprint] does not exist in v1, so it is nullable here.
/// TODO: replace with [RegisterDto] when v1 compatibility is removed
@freezed
class InfoRegisterDto with _$InfoRegisterDto {
  const factory InfoRegisterDto({
    required String alias,
    required String? version, // v2, format: major.minor
    required String? deviceModel,
    @JsonKey(unknownEnumValue: DeviceType.desktop) // ignore: invalid_annotation_target
    required DeviceType? deviceType,
    required String? fingerprint,
    required int? port, // v2
    required ProtocolType? protocol, // v2
    required bool? download, // v2
  }) = _InfoRegisterDto;

  factory InfoRegisterDto.fromJson(Map<String, Object?> json) => _$InfoRegisterDtoFromJson(json);
}

extension RegisterDtoExt on InfoRegisterDto {
  Device toDevice(String ip, int ownPort, bool ownHttps) {
    return Device(
      ip: ip,
      version: version ?? fallbackProtocolVersion,
      port: port ?? ownPort,
      https: protocol != null ? protocol == ProtocolType.https : ownHttps,
      fingerprint: fingerprint ?? '',
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType ?? DeviceType.desktop,
      download: download ?? false,
    );
  }
}
