import 'dart:io';

import 'package:gal/gal.dart';
import 'package:legalize/legalize.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:localsend_app/util/native/content_uri_helper.dart';
import 'package:localsend_app/util/native/directories.dart';
import 'package:logging/logging.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;

final _logger = Logger('FileSaver');

/// Where an incoming file should be written to.
/// The actual writing is done by the Rust server which receives either a
/// plain file [path] or a writable [fileDescriptor] (Android SAF).
class FileSaveTarget {
  /// The path to write the file to. `null` when [fileDescriptor] is used.
  final String? path;

  /// A writable file descriptor (Android SAF). `null` when [path] is used.
  final int? fileDescriptor;

  /// The path or content URI of the destination, used for the history
  /// and to locate the file after it has been written.
  final String displayPath;

  FileSaveTarget({
    required this.path,
    required this.fileDescriptor,
    required this.displayPath,
  });
}

/// Prepares the destination for an incoming file with [fileName].
///
/// When [saveToGallery] is true, the file is first written to the cache
/// directory; call [saveCachedFileToGallery] after the file has been written.
///
/// On Android, destinations that cannot be written directly (SAF content URIs
/// and SD cards) are created via the Storage Access Framework and a writable
/// file descriptor is returned instead of a path.
Future<FileSaveTarget> prepareFileSaveTarget({
  required String destinationDirectory,
  required String fileName,
  required bool saveToGallery,
  required bool isImage,
  required Set<String> createdDirectories,
  int? androidSdkInt,
}) async {
  final parentDirectory = saveToGallery ? await getCacheDirectory() : destinationDirectory;

  final (destinationPath, documentUri, finalName) = await digestFilePathAndPrepareDirectory(
    parentDirectory: parentDirectory,
    fileName: fileName,
    createdDirectories: createdDirectories,
  );

  // When saveToGallery is enabled, the cache directory is used so SAF is not needed
  if (!saveToGallery && androidSdkInt != null) {
    String? parentUri;
    if (documentUri != null || destinationPath.startsWith('content://')) {
      parentUri = documentUri ?? destinationPath;
    } else {
      final sdCardPath = getSdCardPath(destinationPath);
      if (sdCardPath != null) {
        final uriString = ContentUriHelper.encodeTreeUri(sdCardPath.path.parentPath());
        parentUri = 'content://com.android.externalstorage.documents/tree/${sdCardPath.sdCardId}:$uriString';
      }
    }

    if (parentUri != null) {
      _logger.info('Using SAF to save file to $parentUri as $finalName');
      final createdFile = await android_channel.createFileAndroid(
        parentUri: parentUri,
        fileName: finalName,
        mimeType: lookupMimeType(finalName) ?? (isImage ? 'image/*' : '*/*'),
      );
      return FileSaveTarget(
        path: null,
        fileDescriptor: createdFile.fileDescriptor,
        displayPath: createdFile.uri,
      );
    }
  }

  return FileSaveTarget(
    path: destinationPath,
    fileDescriptor: null,
    displayPath: destinationPath,
  );
}

/// Applies the file timestamps after the file has been written to a plain path.
Future<void> applyFileTimestamps({
  required FileSaveTarget target,
  DateTime? lastModified,
  DateTime? lastAccessed,
}) async {
  final path = target.path;
  if (path == null) {
    return;
  }
  final file = File(path);
  if (lastModified != null) {
    try {
      await file.setLastModified(lastModified);
    } catch (_) {}
  }
  if (lastAccessed != null) {
    try {
      await file.setLastAccessed(lastAccessed);
    } catch (_) {}
  }
}

/// Moves a file that has been written to the cache directory into the
/// OS gallery (Photos/Videos).
///
/// If the gallery rejects the file (unsupported format, missing permission,
/// not enough space, ...), the cached file is moved to [destinationDirectory]
/// as fallback. At this point the file is already fully received and the
/// sender was already told success, so failing the transfer would lose it.
///
/// Returns (savedToGallery, filePath):
/// - savedToGallery: true if saved to gallery, false if saved to directory
/// - filePath: absolute path to file (null when saved to gallery)
Future<(bool, String?)> saveCachedFileToGallery({
  required String cachedPath,
  required String destinationDirectory,
  required String fileName,
  required bool isImage,
  required Set<String> createdDirectories,
}) async {
  try {
    isImage ? await Gal.putImage(cachedPath) : await Gal.putVideo(cachedPath);
  } on GalException catch (e) {
    _logger.warning('Could not save to gallery (${e.type.name}), moving to destination directory', e);

    final (fallbackPath, _, _) = await digestFilePathAndPrepareDirectory(
      parentDirectory: destinationDirectory,
      fileName: fileName,
      createdDirectories: createdDirectories,
    );

    _logger.info('Moving file from $cachedPath to $fallbackPath');
    await File(cachedPath).rename(fallbackPath);
    return (false, fallbackPath);
  }

  try {
    await File(cachedPath).delete();
  } catch (e) {
    _logger.warning('Could not delete cached file after saving to gallery', e);
  }
  return (true, null);
}

/// If there is a file with the same name, then it appends a number to its file name
Future<(String, String?, String)> digestFilePathAndPrepareDirectory({
  required String parentDirectory,
  required String fileName,
  required Set<String> createdDirectories,
}) async {
  if (parentDirectory.startsWith('content://')) {
    final String documentUri;
    if (fileName.contains('/')) {
      try {
        await android_channel.createMissingDirectoriesAndroid(parentUri: parentDirectory, fileName: fileName, createdDirectories: createdDirectories);
      } catch (e) {
        _logger.warning('Could not create missing directories', e);
      }
      documentUri = ContentUriHelper.convertTreeUriToDocumentUri(treeUri: parentDirectory, suffix: fileName.parentPath());
    } else {
      // root directory
      documentUri = ContentUriHelper.convertTreeUriToDocumentUri(treeUri: parentDirectory, suffix: null);
    }

    // destinationUri is for the history
    // documentUri is for SAF to save the file, it should point to the parent directory
    final destinationUri = ContentUriHelper.convertTreeUriToDocumentUri(treeUri: parentDirectory, suffix: fileName);
    return (destinationUri, documentUri, p.basename(fileName));
  }

  final actualFileName = legalizeFilename(p.basename(fileName), os: Platform.operatingSystem);
  final fileNameParts = p.split(fileName);
  final dir = p.joinAll([parentDirectory, ...fileNameParts.take(fileNameParts.length - 1)]);

  if (fileNameParts.length > 1) {
    // Check path traversal
    if (!p.isWithin(parentDirectory, dir)) {
      throw 'Path traversal detected';
    }

    try {
      Directory(dir).createSync(recursive: true);
    } catch (e) {
      _logger.warning('Could not create directory', e);
    }
  }

  String destinationPath;
  int counter = 1;
  do {
    destinationPath = counter == 1 ? p.join(dir, actualFileName) : p.join(dir, actualFileName.withCount(counter));
    counter++;
  } while (await File(destinationPath).exists());
  return (destinationPath, null, p.basename(destinationPath));
}

final _sdCardPathRegex = RegExp(r'^/storage/([A-Fa-f0-9]{4}-[A-Fa-f0-9]{4})/(.*)$');

class SdCardPath {
  final String sdCardId;
  final String path;

  SdCardPath(this.sdCardId, this.path);
}

/// Checks if the [path] is on the SD card and returns the SD card path.
/// Returns `null` if the [path] is not on the SD card.
/// Only works on Android.
SdCardPath? getSdCardPath(String path) {
  final match = _sdCardPathRegex.firstMatch(path);
  if (match == null) {
    return null;
  }
  return SdCardPath(match.group(1)!, match.group(2)!);
}
