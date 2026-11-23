import 'package:localsend_isolates/model/file_type.dart';

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
    return fileNameWithoutExt.withExtension(extension);
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
    // A leading dot (e.g. ".bashrc") belongs to the name of a hidden file and does not start an extension.
    // The extension keeps its original case, the counter must not rename "Photo.JPG" to "Photo (2).jpg".
    if (index > 0) {
      fileName = substring(0, index);
      extension = substring(index + 1);
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
