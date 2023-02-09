import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';

part 'multicast_dto.freezed.dart';
part 'multicast_dto.g.dart';

@freezed
class MulticastDto with _$MulticastDto {
  const factory MulticastDto({
    required String alias,
    required String? deviceModel,
    required DeviceType deviceType,
    required String fingerprint,
    required bool announcement,
  }) = _MulticastDto;

  factory MulticastDto.fromJson(Map<String, Object?> json) => _$MulticastDtoFromJson(json);
}

extension InfoToDeviceExt on MulticastDto {
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
