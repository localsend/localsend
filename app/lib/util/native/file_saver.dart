import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gal/gal.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';

final _logger = Logger('FileSaver');

/// Saves the data [stream] to the [destinationPath].
/// [onProgress] will be called on every 100 ms.
Future<void> saveFile({
  required String destinationPath,
  required String name,
  required bool saveToGallery,
  required bool isImage,
  required Stream<List<int>> stream,
  required void Function(int savedBytes) onProgress,
}) async {
  if (checkPlatform([TargetPlatform.android, TargetPlatform.iOS])) {
    try {
      await Permission.storage.request();
    } catch (e) {
      _logger.warning('Could not request storage permission', e);
    }
  }

  final sink = File(destinationPath).openWrite();
  try {
    int savedBytes = 0;
    final stopwatch = Stopwatch()..start();
    await for (final event in stream) {
      sink.add(event);

      savedBytes += event.length;
      if (stopwatch.elapsedMilliseconds >= 100) {
        stopwatch.reset();
        onProgress(savedBytes);
      }
    }

    await sink.close();

    if (saveToGallery) {
      isImage ? await Gal.putImage(destinationPath) : await Gal.putVideo(destinationPath);
      await File(destinationPath).delete();
    }

    onProgress(savedBytes); // always emit final event
  } catch (_) {
    try {
      await sink.close();
      await File(destinationPath).delete();
    } catch (e) {
      _logger.warning('Could not delete file', e);
    }
    rethrow;
  }
}
