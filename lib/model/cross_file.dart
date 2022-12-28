import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/file_type.dart';

part 'cross_file.freezed.dart';

/// Common file model to merge file_picker and image_picker results.
@freezed
class CrossFile with _$CrossFile {
  const factory CrossFile({
    required String name,
    required FileType fileType,
    required int size,
    required String? path,
    required List<int>? bytes,
  }) = _CrossFile;
}
