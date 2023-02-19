import 'dart:io';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

/// Saves the data [stream] to the [destinationPath].
/// [onProgress] will be called on every 100 KB.
Future<void> saveFile({
  required String destinationPath,
  required String name,
  required bool saveToGallery,
  required Stream<List<int>> stream,
  required void Function(int savedBytes) onProgress,
}) async {
  try {
    await Permission.storage.request();
  } catch (e) {
    print(e);
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
      await ImageGallerySaver.saveFile(destinationPath, name: name);
      await File(destinationPath).delete();
    }

    onProgress(savedBytes); // always emit final event
  } catch (_) {
    try {
      await sink.close();
      await File(destinationPath).delete();
    } catch (e) {
      print(e);
    }
    rethrow;
  }
}
