import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class FileThumbnail extends StatelessWidget {
  final CrossFile file;

  const FileThumbnail(this.file);

  @override
  Widget build(BuildContext context) {
    Widget? thumbnail;
    if (file.asset != null) {
      thumbnail = AssetEntityImage(
        file.asset!,
        isOriginal: false,
        thumbnailSize: const ThumbnailSize.square(64),
        thumbnailFormat: ThumbnailFormat.jpeg,
      );
    } else if (file.path != null && file.fileType == FileType.image) {
      thumbnail = Image.file(
        File(file.path!),
        fit: BoxFit.fill,
        cacheWidth: 64, // reduce memory with low cached size
        cacheHeight: 64,
      );
    }

    return SizedBox(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ColoredBox(
          color: Theme.of(context).inputDecorationTheme.fillColor!,
          child: thumbnail == null
              ? Icon(file.fileType.icon, size: 32)
              : FittedBox(
                  fit: BoxFit.cover,
                  clipBehavior: Clip.hardEdge,
                  child: thumbnail,
                ),
        ),
      ),
    );
  }
}
