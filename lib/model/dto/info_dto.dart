import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';

part 'info_dto.freezed.dart';
part 'info_dto.g.dart';

@freezed
class InfoDto with _$InfoDto {
  const factory InfoDto({
    required String alias,
    required String? deviceModel,
    required DeviceType deviceType,
  }) = _InfoDto;

  factory InfoDto.fromJson(Map<String, Object?> json) => _$InfoDtoFromJson(json);
}
