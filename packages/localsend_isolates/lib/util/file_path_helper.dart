import 'dart:io';

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

/// The normalized path of the local file that clipboard [text] points to, or
/// null if [text] is not the path of an existing file.
///
/// Some file managers (Nautilus, for one) put a copied file's path on the
/// clipboard as plain text next to the file itself. Treating that text as a
/// message would send the path instead of the file, so the clipboard handler
/// uses this to tell the two apart.
///
/// Only a single-line value counts: surrounding whitespace and one layer of
/// matching quotes are stripped, since file managers may add either, while a
/// multi-line value or one containing NUL is ordinary text and never a path.
///
/// Directories are rejected as well, because adding a file does not enumerate
/// directory contents; a folder has to arrive through the folder picker.
///
/// The returned value is the normalized path, not [text], so callers can use
/// it directly instead of redoing the stripping.
String? existingLocalPath(String? text) {
  if (text == null) {
    return null;
  }

  var candidate = text.trim();
  if (candidate.isEmpty) {
    return null;
  }

  // A URI is not a filesystem path; those are handled separately.
  if (candidate.contains('://')) {
    return null;
  }

  // Strip a single layer of matching quotes, as shell-style copy adds them.
  if (candidate.length >= 2 && ((candidate.startsWith('"') && candidate.endsWith('"')) || (candidate.startsWith("'") && candidate.endsWith("'")))) {
    candidate = candidate.substring(1, candidate.length - 1).trim();
  }

  // Newlines mean this is a block of text, not one path. NUL can never appear
  // in a path, and rejecting it here keeps the string away from the filesystem.
  if (candidate.isEmpty || candidate.contains('\n') || candidate.contains('\r') || candidate.contains('\u0000')) {
    return null;
  }

  if (FileSystemEntity.typeSync(candidate, followLinks: true) != FileSystemEntityType.file) {
    return null;
  }

  return candidate;
}

/// Whether clipboard [text] is the path of a file that exists locally.
bool isExistingLocalPath(String? text) => existingLocalPath(text) != null;
