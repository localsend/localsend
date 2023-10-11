import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/file_type.dart';

class CrossFileThumbnail extends StatelessWidget {
  final CrossFile file;

  const CrossFileThumbnail(this.file);

  @override
  Widget build(BuildContext context) {
    if (file.thumbnail != null) {
      return MemoryThumbnail(
        bytes: file.thumbnail!,
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
        errorBuilder: (_, __, ___) => Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(fileType.icon, size: 32),
        ),
      );
    } else {
      thumbnail = null;
    }

    return _Thumbnail(
      thumbnail: thumbnail,
      icon: fileType.icon,
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
    this.size = 50,
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
    this.size = 50,
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
