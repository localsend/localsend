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

    // ignore: invalid_annotation_target
    @JsonKey(unknownEnumValue: FileType.other)
    required FileType fileType,

    required String? preview,
  }) = _FileDto;

  factory FileDto.fromJson(Map<String, Object?> json) => _$FileDtoFromJson(json);
}
