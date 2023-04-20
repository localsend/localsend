import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/device.dart';

part 'info_dto.freezed.dart';
part 'info_dto.g.dart';

@freezed
class InfoDto with _$InfoDto {
  const factory InfoDto({
    required String alias,
    required String? version, // v2, format: major.minor
    required String? deviceModel,

    @JsonKey(unknownEnumValue: DeviceType.desktop) // ignore: invalid_annotation_target
    required DeviceType? deviceType,
    required String? fingerprint, // v2
  }) = _InfoDto;

  factory InfoDto.fromJson(Map<String, Object?> json) => _$InfoDtoFromJson(json);
}

extension InfoToDeviceExt on InfoDto {
  /// Convert [InfoDto] to [Device].
  /// Since this HTTP request was successful, the [port] and [https] are known.
  Device toDevice(String ip, int port, bool https) {
    return Device(
      ip: ip,
      version: version ?? fallbackProtocolVersion,
      port: port,
      https: https,
      fingerprint: fingerprint ?? '',
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType ?? DeviceType.desktop
    );
  }
}
