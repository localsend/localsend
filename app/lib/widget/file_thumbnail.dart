import 'dart:io';
import 'dart:typed_data';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/util/file_type_ext.dart';
import 'package:uri_content/uri_content.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

const double defaultThumbnailSize = 50;

class SmartFileThumbnail extends StatelessWidget {
  final Uint8List? bytes;
  final AssetEntity? asset;
  final String? path;
  final FileType fileType;

  const SmartFileThumbnail({
    required this.bytes,
    required this.asset,
    required this.path,
    required this.fileType,
  });

  factory SmartFileThumbnail.fromCrossFile(CrossFile file) {
    return SmartFileThumbnail(
      bytes: file.thumbnail,
      asset: file.asset,
      path: file.path,
      fileType: file.fileType,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (bytes != null) {
      return MemoryThumbnail(
        bytes: bytes,
        fileType: fileType,
      );
    } else if (asset != null) {
      return AssetThumbnail(
        asset: asset!,
        fileType: fileType,
      );
    } else {
      return FilePathThumbnail(
        path: path,
        fileType: fileType,
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
    return _Thumbnail(
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

class FilePathThumbnail extends StatefulWidget {
  final String? path;
  final FileType fileType;

  const FilePathThumbnail({
    required this.path,
    required this.fileType,
  });

  @override
  State<FilePathThumbnail> createState() => _FilePathThumbnailState();
}

class _FilePathThumbnailState extends State<FilePathThumbnail> {
  Future<Uint8List>? _future;

  @override
  void initState() {
    super.initState();

    if (widget.fileType == FileType.image && widget.path != null && widget.path!.startsWith('content://')) {
      // ignore: discarded_futures
      _future = UriContent().from(Uri.parse(widget.path!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget? thumbnail;
    if (widget.path != null && widget.fileType == FileType.image) {
      if (widget.path!.startsWith('content://')) {
        thumbnail = FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(widget.fileType.icon, size: 32),
                );
              }

              return Image.memory(
                snapshot.data!,
                cacheWidth: 64, // reduce memory with low cached size; do not set cacheHeight because the image must keep its ratio
                errorBuilder: (_, __, ___) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(widget.fileType.icon, size: 32),
                ),
              );
            });
      } else {
        thumbnail = Image.file(
          File(widget.path!),
          cacheWidth: 64, // reduce memory with low cached size; do not set cacheHeight because the image must keep its ratio
          errorBuilder: (_, __, ___) => Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(widget.fileType.icon, size: 32),
          ),
        );
      }
    } else {
      thumbnail = null;
    }

    return _Thumbnail(
      thumbnail: thumbnail,
      icon: widget.fileType.icon,
    );
  }
}

class MemoryThumbnail extends StatelessWidget {
  final Uint8List? bytes;
  final FileType fileType;
  final double size;

  const MemoryThumbnail({
    required this.bytes,
    required this.fileType,
    this.size = defaultThumbnailSize,
  });

  @override
  Widget build(BuildContext context) {
    final Widget? thumbnail;
    if (bytes != null) {
      thumbnail = Padding(
        padding: fileType == FileType.apk ? const EdgeInsets.all(50) : EdgeInsets.zero,
        child: Image.memory(
          bytes!,
          errorBuilder: (_, __, ___) => Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(fileType.icon, size: 32),
          ),
        ),
      );
    } else {
      thumbnail = null;
    }

    return _Thumbnail(
      thumbnail: thumbnail,
      icon: fileType.icon,
      size: size,
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final Widget? thumbnail;
  final IconData? icon;
  final double size;

  const _Thumbnail({
    required this.thumbnail,
    required this.icon,
    this.size = defaultThumbnailSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
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
