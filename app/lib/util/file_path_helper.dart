import 'package:common/model/file_type.dart';

/// Matches myFile (123) -> "myFile", " (123)"
final _fileNumberRegex = RegExp(r'^(.*)(?:(\s\(\d+\)))$');

extension FilePathStringExt on String {
  String get extension {
    final index = lastIndexOf('.');
    if (index != -1) {
      return substring(index + 1).toLowerCase();
    } else {
      return '';
    }
  }

  String get fileName {
    return replaceAll('\\', '/').split('/').last;
  }

  String withFileNameKeepExtension(String fileNameWithoutExt) {
    return '$fileNameWithoutExt.$extension';
  }

  String withExtension(String ext) {
    if (ext == '') {
      return this;
    } else {
      return '$this.$ext';
    }
  }

  String withCount(int count) {
    final index = lastIndexOf('.');
    final String fileName;
    final String extension;
    if (index != -1) {
      fileName = substring(0, index);
      extension = substring(index + 1).toLowerCase();
    } else {
      fileName = this;
      extension = '';
    }

    final match = _fileNumberRegex.firstMatch(fileName);
    if (match != null) {
      return '${match.group(1)} ($count)'.withExtension(extension);
    } else {
      return '$fileName ($count)'.withExtension(extension);
    }
  }

  String parentPath() {
    final parts = replaceAll('\\', '/').split('/');
    return parts.take(parts.length - 1).join('/');
  }

  FileType guessFileType() {
    switch (extension) {
      case 'bmp':
      case 'jpg':
      case 'jpeg':
      case 'heic':
      case 'png':
      case 'gif':
      case 'svg':
      case 'dng':
        return FileType.image;
      case 'mp4':
      case 'mov':
        return FileType.video;
      case 'pdf':
        return FileType.pdf;
      case 'txt':
        return FileType.text;
      case 'apk':
        return FileType.apk;
      default:
        return FileType.other;
    }
  }
}
