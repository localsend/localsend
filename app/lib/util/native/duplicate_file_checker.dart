import 'dart:io';

import 'package:path/path.dart' as p;

/// How close two [DateTime]s have to be to be considered "the same"
/// last-modified timestamp. Some filesystems (e.g. FAT32) only store
/// timestamps with 2-second resolution, so an exact match is too strict.
const _lastModifiedTolerance = Duration(seconds: 2);

/// Heuristically checks whether a file that is about to be received
/// already exists at the destination and is very likely identical.
///
/// Compares file size and last-modified timestamp (if provided) rather
/// than content — cheap enough to run for every file in a large folder.
///
/// Returns `false` for SAF-based ("content://") destination directories
/// on Android; not supported yet.
Future<bool> fileLikelyAlreadyExists({
  required String destinationDirectory,
  required String relativeFileName,
  required int expectedSize,
  required DateTime? expectedLastModified,
}) async {
  if (destinationDirectory.startsWith('content://')) {
    return false;
  }

  final path = p.join(destinationDirectory, relativeFileName);
  final file = File(path);

  if (!await file.exists()) {
    return false;
  }

  final FileStat stat;
  try {
    stat = await file.stat();
  } catch (_) {
    return false;
  }

  if (stat.size != expectedSize) {
    return false;
  }

  if (expectedLastModified != null) {
    final diff = stat.modified.difference(expectedLastModified).abs();
    if (diff > _lastModifiedTolerance) {
      return false;
    }
  }

  return true;
}
