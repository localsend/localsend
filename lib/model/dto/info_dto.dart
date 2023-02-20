import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';

part 'info_dto.freezed.dart';
part 'info_dto.g.dart';

@freezed
class InfoDto with _$InfoDto {
  const factory InfoDto({
    required String alias,
    required String? deviceModel,

    // ignore: invalid_annotation_target
    @JsonKey(unknownEnumValue: DeviceType.desktop)
    required DeviceType deviceType,
  }) = _InfoDto;

  factory InfoDto.fromJson(Map<String, Object?> json) => _$InfoDtoFromJson(json);
}

extension InfoToDeviceExt on InfoDto {
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
