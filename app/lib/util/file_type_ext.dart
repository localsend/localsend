import 'package:common/common.dart';
import 'package:flutter/material.dart';

extension FileTypeExt on FileType {
  IconData get icon {
    return switch (this) {
      FileType.image => Icons.image,
      FileType.video => Icons.movie,
      FileType.pdf => Icons.description,
      FileType.text => Icons.subject,
      FileType.apk => Icons.android,
      FileType.other => Icons.file_present_sharp,
    };
  }
}
