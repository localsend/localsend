import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/src/task/server/live_photo_receiver.dart';

void main() {
  late Directory directory;
  late LivePhotoFile image;
  late LivePhotoFile video;
  late List<String> singles;

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('live_photo_receiver_');
    image = LivePhotoFile(id: 'image', path: '${directory.path}/photo (2).heic', name: 'photo.heic', isImage: true);
    video = LivePhotoFile(id: 'video', path: '${directory.path}/photo.mov', name: 'photo.mov', isImage: false);
    await File(image.path).writeAsBytes([1, 2]);
    await File(video.path).writeAsBytes([3, 4]);
    singles = [];
  });

  tearDown(() async => directory.delete(recursive: true));

  LivePhotoReceiver receiver({Future<void> Function(String, String)? savePair}) => LivePhotoReceiver(
    pairs: {'image': 'video'},
    savePair: savePair ?? (_, _) async {},
    saveSingle: (file) async {
      singles.add(file.id);
      return (false, file.path);
    },
  );

  for (final videoFirst in [false, true]) {
    test('pairs by IDs despite cache name changes, video first: $videoFirst', () async {
      final saved = <String>[];
      final handler = receiver(savePair: (imagePath, videoPath) async => saved.addAll([imagePath, videoPath]));
      // The first result completes immediately so a sequential sender can
      // upload the other component. The UI receives no premature success.
      expect(await handler.receive(videoFirst ? video : image), isEmpty);
      final results = await handler.receive(videoFirst ? image : video);
      expect(saved, [image.path, video.path]);
      expect(results.map((r) => r.id), ['image', 'video']);
      expect(results.every((r) => r.savedToGallery && r.path == null && r.error == null), isTrue);
      expect(File(image.path).existsSync(), isFalse);
      expect(File(video.path).existsSync(), isFalse);
      expect(singles, isEmpty);
    });
  }

  test('native failure preserves both files through ordinary gallery fallback', () async {
    final handler = receiver(savePair: (_, _) async => throw StateError('PhotoKit rejected pair'));
    await handler.receive(image);
    final results = await handler.receive(video);
    expect(singles, ['image', 'video']);
    expect(results.map((r) => r.path), [image.path, video.path]);
    expect(File(image.path).existsSync(), isTrue);
    expect(File(video.path).existsSync(), isTrue);
  });

  test('failed partner releases the fully received image', () async {
    final handler = receiver();
    await handler.receive(image);
    final results = await handler.failed('video');
    expect(results.single.id, 'image');
    expect(singles, ['image']);
  });

  test('partner failure before image completion still saves the image', () async {
    final handler = receiver();
    expect(await handler.failed('video'), isEmpty);
    expect((await handler.receive(image)).single.id, 'image');
    expect(singles, ['image']);
    // Retrying the failed video must not wait for the already-saved image.
    expect((await handler.receive(video)).single.id, 'video');
    expect(singles, ['image', 'video']);
  });

  test('cancellation preserves pending and late completed components', () async {
    final handler = receiver();
    await handler.receive(image);
    expect((await handler.close()).single.id, 'image');
    expect((await handler.receive(video)).single.id, 'video');
    expect(singles, ['image', 'video']);
    expect(await handler.close(), isEmpty);
  });

  test('sessions cannot pair components with one another', () async {
    final first = receiver();
    final second = receiver();
    expect(await first.receive(image), isEmpty);
    expect(await second.receive(video), isEmpty);
    expect((await first.close()).single.id, 'image');
    expect((await second.close()).single.id, 'video');
  });

  test('failed fallback reports error and retains the cached file', () async {
    final handler = LivePhotoReceiver(
      pairs: {},
      saveSingle: (_) async => throw FileSystemException('Disk unavailable'),
    );
    final result = (await handler.receive(image)).single;
    expect(result.error, contains('Disk unavailable'));
    expect(result.path, image.path);
    expect(File(image.path).existsSync(), isTrue);
  });
}
