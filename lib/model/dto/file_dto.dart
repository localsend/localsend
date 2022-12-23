import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/file_type.dart';

part 'file_dto.freezed.dart';
part 'file_dto.g.dart';

@freezed
class FileDto with _$FileDto {
  const factory FileDto({
    required String id, // unique inside send session
    required String fileName,
    required int size,
    required FileType fileType,
  }) = _FileDto;

  factory FileDto.fromJson(Map<String, Object?> json) => _$FileDtoFromJson(json);
}
