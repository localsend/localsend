import 'dart:io';
import 'dart:typed_data';

import 'package:gal/gal.dart';
import 'package:legalize/legalize.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:localsend_app/util/native/content_uri_helper.dart';
import 'package:logging/logging.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;
import 'package:saf_stream/saf_stream.dart';
import 'package:saf_stream/saf_stream_platform_interface.dart';

final _logger = Logger('FileSaver');

final _saf = SafStream();

/// Saves the data [stream] to the [destinationPath].
/// [onProgress] will be called on every 100 ms.
Future<void> saveFile({
  required String destinationPath,
  required String? documentUri,
  required String name,
  required bool saveToGallery,
  required bool isImage,
  required Stream<Uint8List> stream,
  required int? androidSdkInt,
  required DateTime? lastModified,
  required DateTime? lastAccessed,
  required void Function(int savedBytes) onProgress,
}) async {
  if (!saveToGallery && androidSdkInt != null) {
    // Use SAF to save the file
    // When saveToGallery is enabled, the destination is always the app's cache directory so we don't need to use SAF
    SafWriteStreamInfo? safInfo;

    if (documentUri != null || destinationPath.startsWith('content://')) {
      _logger.info('Using SAF to save file to ${documentUri ?? destinationPath} as $name');
      safInfo = await _saf.startWriteStream(
        documentUri ?? destinationPath,
        name,
        lookupMimeType(name) ?? (isImage ? 'image/*' : '*/*'),
      );
    } else {
      final sdCardPath = getSdCardPath(destinationPath);
      if (sdCardPath != null) {
        // Use Android SAF to save the file to the SD card
        final uriString = ContentUriHelper.encodeTreeUri(sdCardPath.path.parentPath());
        _logger.info('Using SAF to save file to $uriString');
        safInfo = await _saf.startWriteStream(
          'content://com.android.externalstorage.documents/tree/${sdCardPath.sdCardId}:$uriString',
          name,
          lookupMimeType(name) ?? (isImage ? 'image/*' : '*/*'),
        );
      }
    }

    if (safInfo != null) {
      final sessionID = safInfo.session;
      await _saveFile(
        destinationPath: destinationPath,
        saveToGallery: saveToGallery,
        isImage: isImage,
        stream: stream,
        onProgress: onProgress,
        write: null,
        writeAsync: (data) async {
          await _saf.writeChunk(sessionID, data);
        },
        flush: null,
        close: () async {
          await _saf.endWriteStream(sessionID);
        },
      );
      return;
    }
  }

  final file = File(destinationPath);
  final sink = file.openWrite();
  await _saveFile(
    destinationPath: destinationPath,
    saveToGallery: saveToGallery,
    isImage: isImage,
    stream: stream,
    onProgress: onProgress,
    write: sink.add,
    writeAsync: null,
    flush: sink.flush,
    close: () async {
      await sink.close();
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
    },
  );
}

Future<void> _saveFile({
  required String destinationPath,
  required bool saveToGallery,
  required bool isImage,
  required Stream<Uint8List> stream,
  required void Function(int savedBytes) onProgress,
  required void Function(Uint8List data)? write,
  required Future<void> Function(Uint8List data)? writeAsync,
  required Future<void> Function()? flush,
  required Future<void> Function() close,
}) async {
  try {
    int savedBytes = 0;
    int lastFlushedBytes = 0;
    final stopwatch = Stopwatch()..start();
    await for (final event in stream) {
      if (writeAsync != null) {
        await writeAsync(event);
      } else {
        write!(event);
      }

      savedBytes += event.length;
      if (stopwatch.elapsedMilliseconds >= 100) {
        stopwatch.reset();
        onProgress(savedBytes);
      }

      const tenMB = 10 * 1024 * 1024;
      if (flush != null && savedBytes >= lastFlushedBytes + tenMB) {
        await flush();
        lastFlushedBytes = savedBytes;
      }
    }

    await flush?.call();
    await close();

    if (saveToGallery) {
      isImage ? await Gal.putImage(destinationPath) : await Gal.putVideo(destinationPath);
      await File(destinationPath).delete();
    }

    onProgress(savedBytes); // always emit final event
  } catch (_) {
    try {
      await close();
      await File(destinationPath).delete();
    } catch (e) {
      _logger.warning('Could not delete file', e);
    }
    rethrow;
  }
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
