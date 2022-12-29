import 'dart:io';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

/// Saves the data [stream] to the [destinationPath].
/// [onProgress] will be called on every 100 KB.
Future<void> saveFile({
  required String destinationPath,
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
    int lastNotifyBytes = 0;
    int savedBytes = 0;
    await stream.forEach((event) {
      sink.add(event);

      savedBytes += event.length;
      if (savedBytes - lastNotifyBytes >= 100 * 1024) {
        lastNotifyBytes = savedBytes;
        onProgress(savedBytes);
      }
    });

    await sink.close();

    if (saveToGallery) {
      await ImageGallerySaver.saveFile(destinationPath);
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
