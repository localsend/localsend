import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/file_type.dart';

part 'cross_file.mapper.dart';

/// Common file model to avoid any third party libraries in the core logic.
/// This model is used during the file selection phase.
@MappableClass()
class CrossFile with CrossFileMappable {
  final String name;
  final FileType fileType;
  final int size;
  final Uint8List? thumbnail;
  final String? path;
  final List<int>? bytes; // if type message, then UTF-8 encoded

  const CrossFile({
    required this.name,
    required this.fileType,
    required this.size,
    required this.thumbnail,
    required this.path,
    required this.bytes,
  });
}
