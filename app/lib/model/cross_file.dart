import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'cross_file.mapper.dart';

/// Common file model to avoid any third party libraries in the core logic.
/// This model is used during the file selection phase.
@MappableClass()
class CrossFile with CrossFileMappable {
  final String name;
  final FileType fileType;
  final int size;
  final Uint8List? thumbnail;
  final AssetEntity? asset; // for thumbnails
  final String? path;
  final List<int>? bytes; // if type message, then UTF-8 encoded

  const CrossFile({
    required this.name,
    required this.fileType,
    required this.size,
    required this.thumbnail,
    required this.asset,
    required this.path,
    required this.bytes,
  });

  /// Custom toString() to avoid printing the bytes.
  @override
  String toString() {
    return 'CrossFile(name: $name, fileType: $fileType, size: $size, thumbnail: ${thumbnail != null ? thumbnail!.length : 'null'}, asset: $asset, path: $path, bytes: ${bytes != null ? bytes!.length : 'null'})';
  }
}
