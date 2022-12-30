import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'cross_file.freezed.dart';

/// Common file model to merge file_picker and image_picker results.
@freezed
class CrossFile with _$CrossFile {
  const factory CrossFile({
    required String name,
    required FileType fileType,
    required int size,
    required AssetEntity? asset, // for thumbnails
    required String? path,
    required Future<Uint8List> Function()? bytes,
  }) = _CrossFile;
}

extension AssetEntityExt on AssetEntity {
  Widget get thumbnailWidget {
    return AssetEntityImage(
      this,
      isOriginal: false,
      thumbnailSize: const ThumbnailSize.square(32),
      thumbnailFormat: ThumbnailFormat.jpeg,
    );
  }
}
