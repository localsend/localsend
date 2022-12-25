import 'dart:io';

/// Saves the data [stream] to the [destinationPath].
/// [onProgress] will be called on every 100 KB.
Future<void> saveFile({
  required String destinationPath,
  required Stream<List<int>> stream,
  required void Function(int savedBytes) onProgress,
}) async {
  final sink = File(destinationPath).openWrite();
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

  onProgress(savedBytes); // always emit final event
  await sink.close();
}
