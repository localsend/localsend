import 'package:dart_mappable/dart_mappable.dart';

part 'file_type.mapper.dart';

/// Categorization of one file.
/// We use this information for a better UX.
@MappableEnum(defaultValue: FileType.other)
enum FileType {
  image,
  video,
  pdf,
  text,
  apk,
  other,
}
