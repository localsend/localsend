import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';

part 'file_dto.freezed.dart';
part 'file_dto.g.dart';

/// Categorization of one file.
/// We use this information for a better UX.
enum FileType {
  image,
  video,
  pdf,
  text,
  other,
}

@freezed
class FileDto with _$FileDto {
  const factory FileDto({
    required int id, // unique inside from send batch
    required String fileName,
    required int size,
    required DeviceType deviceType,
  }) = _FileDto;

  factory FileDto.fromJson(Map<String, Object?> json) => _$FileDtoFromJson(json);
}
