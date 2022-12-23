import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/dto/info_dto.dart';

part 'send_request_dto.freezed.dart';
part 'send_request_dto.g.dart';

@freezed
class SendRequestDto with _$SendRequestDto {
  const factory SendRequestDto({
    required InfoDto info,
    required Map<String, FileDto> files,
  }) = _SendRequestDto;

  factory SendRequestDto.fromJson(Map<String, Object?> json) => _$SendRequestDtoFromJson(json);
}
