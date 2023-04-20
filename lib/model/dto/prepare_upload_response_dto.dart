import 'package:freezed_annotation/freezed_annotation.dart';

part 'prepare_upload_response_dto.freezed.dart';
part 'prepare_upload_response_dto.g.dart';

@freezed
class PrepareUploadResponseDto with _$PrepareUploadResponseDto {
  const factory PrepareUploadResponseDto({
    required String sessionId,
    required Map<String, String> files,
  }) = _PrepareUploadResponseDto;

  factory PrepareUploadResponseDto.fromJson(Map<String, Object?> json) => _$PrepareUploadResponseDtoFromJson(json);
}
