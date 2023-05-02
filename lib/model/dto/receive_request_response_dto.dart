import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/dto/info_dto.dart';

part 'receive_request_response_dto.freezed.dart';
part 'receive_request_response_dto.g.dart';

@freezed
class ReceiveRequestResponseDto with _$ReceiveRequestResponseDto {
  const factory ReceiveRequestResponseDto({
    required InfoDto info,
    required String sessionId,
    required Map<String, FileDto> files,
  }) = _ReceiveRequestResponseDto;

  factory ReceiveRequestResponseDto.fromJson(Map<String, Object?> json) => _$ReceiveRequestResponseDtoFromJson(json);
}
