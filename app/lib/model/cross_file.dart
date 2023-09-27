import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'cross_file.freezed.dart';

/// Common file model to avoid any third party libraries in the core logic.
/// This model is used during the file selection phase.
@freezed
class CrossFile with _$CrossFile {
  const factory CrossFile({
    required String name,
    required FileType fileType,
    required int size,
    required Uint8List? thumbnail,
    required AssetEntity? asset, // for thumbnails
    required String? path,
    required List<int>? bytes, // if type message, then UTF-8 encoded
  }) = _CrossFile;
}
