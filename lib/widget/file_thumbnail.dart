import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class CrossFileThumbnail extends StatelessWidget {
  final CrossFile file;

  const CrossFileThumbnail(this.file);

  @override
  Widget build(BuildContext context) {
    if (file.asset != null) {
      return AssetThumbnail(
        asset: file.asset!,
        fileType: file.fileType,
      );
    } else {
      return FilePathThumbnail(
        path: file.path,
        fileType: file.fileType,
      );
    }
  }
}

class AssetThumbnail extends StatelessWidget {
  final AssetEntity asset;
  final FileType fileType;

  const AssetThumbnail({
    required this.asset,
    required this.fileType,
  });

  @override
  Widget build(BuildContext context) {
    return _FileThumbnail(
      thumbnail: AssetEntityImage(
        asset,
        isOriginal: false,
        thumbnailSize: const ThumbnailSize.square(64),
        thumbnailFormat: ThumbnailFormat.jpeg,
      ),
      icon: fileType.icon,
    );
  }
}

class FilePathThumbnail extends StatelessWidget {
  final String? path;
  final FileType fileType;

  const FilePathThumbnail({
    required this.path,
    required this.fileType,
  });

  @override
  Widget build(BuildContext context) {
    final Widget? thumbnail;
    if (path != null && fileType == FileType.image) {
      thumbnail = Image.file(
        File(path!),
        cacheWidth: 64, // reduce memory with low cached size; do not set cacheHeight because the image must keep its ratio
      );
    } else {
      thumbnail = null;
    }

    return _FileThumbnail(
      thumbnail: thumbnail,
      icon: fileType.icon,
    );
  }
}

class _FileThumbnail extends StatelessWidget {
  final Widget? thumbnail;
  final IconData? icon;

  const _FileThumbnail({
    required this.thumbnail,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ColoredBox(
          color: Theme.of(context).inputDecorationTheme.fillColor!,
          child: thumbnail == null
              ? Icon(icon!, size: 32)
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
