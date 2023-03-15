import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';

part 'register_dto.freezed.dart';
part 'register_dto.g.dart';

@freezed
class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    required String alias,
    required String? deviceModel,

    @JsonKey(unknownEnumValue: DeviceType.desktop) // ignore: invalid_annotation_target
    required DeviceType deviceType,
    required String fingerprint,
  }) = _RegisterDto;

  factory RegisterDto.fromJson(Map<String, Object?> json) => _$RegisterDtoFromJson(json);
}

extension RegisterDtoExt on RegisterDto {
  Device toDevice(String ip, int port, bool https) {
    return Device(
      ip: ip,
      port: port,
      https: https,
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType,
    );
  }
}
