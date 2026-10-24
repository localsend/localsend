import 'dart:async';
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
    expect((await handler.close()).single.id, 'image');
    expect(singles, ['image', 'video']);
  });

  test('concurrent close calls wait for a delayed fallback save', () async {
    final saving = Completer<void>();
    final releaseSave = Completer<void>();
    final handler = LivePhotoReceiver(
      pairs: {'image': 'video'},
      saveSingle: (file) async {
        singles.add(file.id);
        saving.complete();
        await releaseSave.future;
        return (true, null);
      },
    );
    await handler.receive(image);
    final first = handler.close();
    await saving.future;
    final second = handler.close();
    var closed = false;
    unawaited(second.then((_) => closed = true));
    await Future<void>.delayed(Duration.zero);
    expect(closed, isFalse);
    releaseSave.complete();
    expect((await first).single.id, 'image');
    expect((await second).single.id, 'image');
    expect(singles, ['image']);
  });

  test('close waits for a pair already being saved, including its failure fallback', () async {
    final saving = Completer<void>();
    final releasePair = Completer<void>();
    final handler = receiver(
      savePair: (_, _) async {
        saving.complete();
        await releasePair.future;
        throw StateError('PhotoKit rejected pair');
      },
    );
    await handler.receive(image);
    final received = handler.receive(video);
    await saving.future;
    var closed = false;
    final closing = handler.close().then((_) => closed = true);
    await Future<void>.delayed(Duration.zero);
    expect(closed, isFalse);
    releasePair.complete();
    await closing;
    expect((await received).map((r) => r.id), ['image', 'video']);
    expect(singles, ['image', 'video']);
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
