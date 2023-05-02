import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/dto/info_register_dto.dart';

part 'prepare_upload_request_dto.freezed.dart';
part 'prepare_upload_request_dto.g.dart';

@freezed
class PrepareUploadRequestDto with _$PrepareUploadRequestDto {
  const factory PrepareUploadRequestDto({
    required InfoRegisterDto info,
    required Map<String, FileDto> files,
  }) = _PrepareUploadRequestDto;

  factory PrepareUploadRequestDto.fromJson(Map<String, Object?> json) => _$PrepareUploadRequestDtoFromJson(json);
}
