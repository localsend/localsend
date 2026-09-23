import 'dart:async';
import 'dart:io';

import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/util/native/cross_file_converters.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/rust/api/model.dart';
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:path/path.dart' as p;
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

void main() {
  late Directory directory;

  setUpAll(() => RustLib.initMock(api: _MetadataApi()));

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('live_photo_selection_');
  });

  tearDown(() async {
    await directory.delete(recursive: true);
  });

  Future<File> createFile(String name, List<int> bytes) => File(p.join(directory.path, name)).writeAsBytes(bytes);

  Future<_TestAsset> livePhoto(String id, {String title = 'IMG_1234.HEIC'}) async {
    return _TestAsset(
      id: id,
      title: title,
      original: await createFile('$id.HEIC', [1, 2, 3]),
      pairedVideo: await createFile('$id-paired.MOV', [4, 5, 6, 7]),
      live: true,
    );
  }

  test('Live Photo selection defaults to a still image without requesting the paired video', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    final asset = await livePhoto('live');
    await service.dispatchAsync(AddAssetsAction([asset]));

    expect(service.state.single.fileType, FileType.image);
    expect(service.state.single.path, asset.original!.path);
    expect(asset.pairedVideoRequests, 0);
  });

  test('A Live Photo with no available video can still be selected when sending video is disabled', () async {
    final asset = _TestAsset(
      id: 'still-only',
      title: 'IMG.HEIC',
      original: await createFile('still.HEIC', [1]),
      live: true,
    );
    final files = await CrossFileConverters.convertAssetEntity(asset, sendLivePhotoVideo: false);

    expect(files.single.fileType, FileType.image);
    expect(asset.pairedVideoRequests, 0);
  });

  test('Reselecting with video enabled adds the missing video without duplicating the photo', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    final asset = await livePhoto('live');
    await service.dispatchAsync(AddAssetsAction([asset]));
    await service.dispatchAsync(AddAssetsAction([asset], sendLivePhotoVideo: true));

    expect(service.state.map((file) => file.name), ['IMG_1234.HEIC', 'IMG_1234.MOV']);
    expect(asset.pairedVideoRequests, 1);
  });

  test('Disabling video affects new selections without removing already selected files', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    final a = await livePhoto('a');
    final b = await livePhoto('b');
    await service.dispatchAsync(AddAssetsAction([a], sendLivePhotoVideo: true));
    await service.dispatchAsync(AddAssetsAction([a, b], sendLivePhotoVideo: false));

    expect(service.state.map((file) => file.name), ['IMG_1234.HEIC', 'IMG_1234.MOV', 'IMG_1234 (2).HEIC']);
    expect(a.pairedVideoRequests, 1);
    expect(b.pairedVideoRequests, 0);
  });

  test('A selected Live Photo exports both original components with matching names', () async {
    final asset = await livePhoto('live');
    final files = await CrossFileConverters.convertAssetEntity(asset, sendLivePhotoVideo: true);

    expect(files.map((file) => file.name), ['IMG_1234.HEIC', 'IMG_1234.MOV']);
    expect(files.map((file) => file.fileType), [FileType.image, FileType.video]);
    expect(files.map((file) => file.size), [3, 4]);
    expect(files.map((file) => file.path), [asset.original!.path, asset.pairedVideo!.path]);
    expect(files.every((file) => file.asset == asset), isTrue);
    expect(await File(files[0].path!).readAsBytes(), [1, 2, 3]);
    expect(await File(files[1].path!).readAsBytes(), [4, 5, 6, 7]);
  });

  test('Ordinary photos and videos remain single files without requesting a paired video', () async {
    for (final type in [AssetType.image, AssetType.video]) {
      final name = type == AssetType.image ? 'photo.JPG' : 'video.MP4';
      final asset = _TestAsset(
        id: name,
        title: name,
        original: await createFile(name, [1, 2]),
        type: type,
      );
      final files = await CrossFileConverters.convertAssetEntity(asset, sendLivePhotoVideo: true);
      expect(files, hasLength(1));
      expect(files.single.name, name);
      expect(files.single.fileType, type == AssetType.image ? FileType.image : FileType.video);
    }
  });

  test('An empty asset title falls back to the exported filename', () async {
    final files = await CrossFileConverters.convertAssetEntity(await livePhoto('untitled', title: ''), sendLivePhotoVideo: true);
    expect(files.map((file) => file.name), ['untitled.HEIC', 'untitled.MOV']);
  });

  test('An edited Live Photo uses the exported image format rather than the original title extension', () async {
    final asset = _TestAsset(
      id: 'edited',
      title: 'IMG_1234.HEIC',
      original: await createFile('edited.JPG', [1]),
      pairedVideo: await createFile('edited.MOV', [2]),
      live: true,
    );
    final files = await CrossFileConverters.convertAssetEntity(asset, sendLivePhotoVideo: true);
    expect(files.map((file) => file.name), ['IMG_1234.JPG', 'IMG_1234.MOV']);
  });

  test('Missing original fails instead of adding an unreadable file', () async {
    final asset = _TestAsset(id: 'missing', title: 'missing.JPG');
    await expectLater(CrossFileConverters.convertAssetEntity(asset, sendLivePhotoVideo: true), throwsStateError);
  });

  test('Missing paired video fails instead of degrading a Live Photo to a still', () async {
    final asset = _TestAsset(
      id: 'missing-video',
      title: 'IMG.HEIC',
      original: await createFile('original.HEIC', [1]),
      live: true,
    );
    await expectLater(CrossFileConverters.convertAssetEntity(asset, sendLivePhotoVideo: true), throwsStateError);
  });

  test('A plugin returning the still image for both components is rejected', () async {
    final image = await createFile('original.HEIC', [1]);
    final asset = _TestAsset(id: 'same-path', title: 'IMG.HEIC', original: image, pairedVideo: image, live: true);
    await expectLater(CrossFileConverters.convertAssetEntity(asset, sendLivePhotoVideo: true), throwsStateError);
  });

  test('Repeated selection within and across batches does not duplicate either component', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    final asset = await livePhoto('live');
    await service.dispatchAsync(AddAssetsAction([asset, asset], sendLivePhotoVideo: true));
    await service.dispatchAsync(AddAssetsAction([asset], sendLivePhotoVideo: true));
    expect(service.state.map((file) => file.name), ['IMG_1234.HEIC', 'IMG_1234.MOV']);
  });

  test('Different Live Photos with the same filename get distinct matching pairs', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    await service.dispatchAsync(AddAssetsAction([await livePhoto('a'), await livePhoto('b')], sendLivePhotoVideo: true));
    expect(service.state.map((file) => file.name), ['IMG_1234.HEIC', 'IMG_1234.MOV', 'IMG_1234 (2).HEIC', 'IMG_1234 (2).MOV']);
    expect(service.state.map((file) => file.path).toSet(), hasLength(4));
  });

  test('A Live Photo pair avoids the basename of an already selected ordinary photo', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    final photo = _TestAsset(id: 'ordinary', title: 'img_1234.jpg', original: await createFile('ordinary.jpg', [1]));
    await service.dispatchAsync(AddAssetsAction([photo], sendLivePhotoVideo: true));
    await service.dispatchAsync(AddAssetsAction([await livePhoto('live')], sendLivePhotoVideo: true));
    expect(service.state.map((file) => file.name), ['img_1234.jpg', 'IMG_1234 (2).HEIC', 'IMG_1234 (2).MOV']);
  });

  test('Reselecting a partially removed pair restores its existing renamed basename', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    final a = await livePhoto('a');
    final b = await livePhoto('b');
    await service.dispatchAsync(AddAssetsAction([a, b], sendLivePhotoVideo: true));
    service.dispatch(RemoveSelectedFileAction(3));
    await service.dispatchAsync(AddAssetsAction([b], sendLivePhotoVideo: true));
    expect(service.state.map((file) => file.name), ['IMG_1234.HEIC', 'IMG_1234.MOV', 'IMG_1234 (2).HEIC', 'IMG_1234 (2).MOV']);
  });

  test('Shares added during export are preserved and participate in pair naming', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    final videoRequested = Completer<void>();
    final videoExport = Completer<File?>();
    final asset = _TestAsset(
      id: 'pending',
      title: 'IMG_1234.HEIC',
      original: await createFile('pending.HEIC', [1]),
      live: true,
      videoRequested: videoRequested,
      videoExport: videoExport.future,
    );
    final export = service.dispatchAsync(AddAssetsAction([asset], sendLivePhotoVideo: true));
    await videoRequested.future;

    service.dispatch(AddMessageAction(message: 'Shared during export'));
    await service.dispatchAsync(
      AddFilesAction(
        files: [
          await createFile('IMG_1234.JPG', [2]),
        ],
        converter: CrossFileConverters.convertFile,
      ),
    );
    final sharedFiles = service.state;
    videoExport.complete(await createFile('pending.MOV', [3]));
    await export;

    expect(service.state.take(2), sharedFiles);
    expect(service.state.skip(2).map((file) => file.name), ['IMG_1234 (2).HEIC', 'IMG_1234 (2).MOV']);
  });

  test('Files removed during export are not restored by the completed batch', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    await service.dispatchAsync(AddAssetsAction([await livePhoto('existing')]));
    final videoRequested = Completer<void>();
    final videoExport = Completer<File?>();
    final asset = _TestAsset(
      id: 'pending',
      title: 'IMG_1234.HEIC',
      original: await createFile('pending.HEIC', [1]),
      live: true,
      videoRequested: videoRequested,
      videoExport: videoExport.future,
    );
    final export = service.dispatchAsync(AddAssetsAction([asset], sendLivePhotoVideo: true));
    await videoRequested.future;

    service.dispatch(RemoveSelectedFileAction(0));
    videoExport.complete(await createFile('pending.MOV', [2]));
    await export;

    expect(service.state.map((file) => file.name), ['IMG_1234.HEIC', 'IMG_1234.MOV']);
    expect(service.state.every((file) => file.asset == asset), isTrue);
  });

  test('An export failure preserves the previous selection and adds no partial batch', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    await service.dispatchAsync(AddAssetsAction([await livePhoto('existing')], sendLivePhotoVideo: true));
    final previous = service.state;
    final broken = _TestAsset(
      id: 'broken',
      title: 'broken.HEIC',
      original: await createFile('broken.HEIC', [1]),
      live: true,
    );
    await expectLater(service.dispatchAsync(AddAssetsAction([await livePhoto('new'), broken], sendLivePhotoVideo: true)), throwsStateError);
    expect(service.state, same(previous));
  });
}

/// Simulates the photo library boundary; exported files are real temporary files.
class _TestAsset extends AssetEntity {
  final File? original;
  final File? pairedVideo;
  final Completer<void>? videoRequested;
  final Future<File?>? videoExport;
  final _pairedVideoRequests = <String>[];

  int get pairedVideoRequests => _pairedVideoRequests.length;

  _TestAsset({
    required super.id,
    required String title,
    this.original,
    this.pairedVideo,
    this.videoRequested,
    this.videoExport,
    bool live = false,
    AssetType type = AssetType.image,
  }) : super(title: title, typeInt: type == AssetType.video ? 2 : 1, width: 100, height: 100, subtype: live ? 8 : 0);

  @override
  Future<String> get titleAsync async => title!;

  @override
  Future<File?> get originFile async => original;

  @override
  Future<File?> get originFileWithSubtype async {
    _pairedVideoRequests.add('originFileWithSubtype');
    if (!isLivePhoto) throw StateError('Ordinary assets must not request a Live Photo video.');
    videoRequested?.complete();
    return videoExport != null ? await videoExport : pairedVideo;
  }
}

class _MetadataApi implements RustLibApi {
  @override
  Future<FileMetadata?> crateApiMetadataReadFileMetadata({required String path}) async => null;

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnsupportedError('Not mocked: ${invocation.memberName}');
}
