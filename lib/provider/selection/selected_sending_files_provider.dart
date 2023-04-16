import 'dart:convert' show utf8;
import 'dart:io';

import 'package:device_apps/device_apps.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:localsend_app/util/native/cache_helper.dart';
import 'package:path/path.dart' as p;
import 'package:share_handler/share_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

const _uuid = Uuid();

/// Manages files selected for sending.
/// Will stay alive even after a session has been completed to send the same files to another device.
final selectedSendingFilesProvider = NotifierProvider<SelectedSendingFilesNotifier, List<CrossFile>>(() {
  return SelectedSendingFilesNotifier();
});

class SelectedSendingFilesNotifier extends Notifier<List<CrossFile>> {
  SelectedSendingFilesNotifier();

  @override
  List<CrossFile> build() {
    return [];
  }

  /// Add a simple message
  /// Internally, the message will be stored into [CrossFile.bytes] as UTF-8
  void addMessage(String message, {int? index}) {
    final List<int> bytes = utf8.encode(message);
    final file = CrossFile(
      name: '${_uuid.v4()}.txt',
      fileType: FileType.text,
      size: bytes.length,
      thumbnail: null,
      asset: null,
      path: null,
      bytes: bytes,
    );
    state = List.unmodifiable([
      ...state,
    ]..insert(index ?? state.length, file));
  }

  Future<void> addFiles<T>({
    required Iterable<T> files,
    required Future<CrossFile> Function(T) converter,
  }) async {
    final newFiles = <CrossFile>[];
    for (final file in files) {
      // we do it sequential because there are bugs
      // https://github.com/fluttercandies/flutter_photo_manager/issues/589
      newFiles.add(await converter(file));
    }
    state = List.unmodifiable([
      ...state,
      ...newFiles,
    ]);
  }

  Future<void> addDirectory(String directoryPath) async {
    print('Reading files in $directoryPath');
    final newFiles = <CrossFile>[];
    await for (final entity in Directory(directoryPath).list(recursive: true)) {
      if (entity is File) {
        final relative = p.relative(entity.path, from: directoryPath).replaceAll('\\', '/');
        print('Add file $relative');
        final file = CrossFile(
          name: relative,
          fileType: relative.guessFileType(),
          size: entity.lengthSync(),
          thumbnail: null,
          asset: null,
          path: entity.path,
          bytes: null,
        );
        newFiles.add(file);
      }
    }
    state = List.unmodifiable([
      ...state,
      ...newFiles,
    ]);
  }

  void removeAt(int index) {
    state = List.unmodifiable([...state]..removeAt(index));
    if (state.isEmpty) {
      clearCache();
    }
  }

  void reset() {
    state = List.empty(growable: false);
    clearCache();
  }
}

/// Utility functions to convert third party models to common [CrossFile] model.
class CrossFileConverters {
  static Future<CrossFile> convertPlatformFile(file_picker.PlatformFile file) async {
    return CrossFile(
      name: file.name,
      fileType: file.name.guessFileType(),
      size: file.size,
      thumbnail: null,
      asset: null,
      path: kIsWeb ? null : file.path,
      bytes: kIsWeb ? file.bytes! : null,
    );
  }

  static Future<CrossFile> convertAssetEntity(AssetEntity asset) async {
    final file = (await asset.originFile)!;
    return CrossFile(
      name: await asset.titleAsync,
      fileType: asset.type == AssetType.video ? FileType.video : FileType.image,
      size: await file.length(),
      thumbnail: null,
      asset: asset,
      path: file.path,
      bytes: null,
    );
  }

  static Future<CrossFile> convertXFile(XFile file) async {
    return CrossFile(
      name: file.name,
      fileType: file.name.guessFileType(),
      size: await file.length(),
      thumbnail: null,
      asset: null,
      path: kIsWeb ? null : file.path,
      bytes: kIsWeb ? await file.readAsBytes() : null, // we can fetch it now because in Web it is already there
    );
  }

  static Future<CrossFile> convertSharedAttachment(SharedAttachment attachment) async {
    final file = File(attachment.path);
    final fileName = attachment.path.fileName;
    return CrossFile(
      name: fileName,
      fileType: fileName.guessFileType(),
      size: await file.length(),
      thumbnail: null,
      asset: null,
      path: file.path,
      bytes: null,
    );
  }

  static Future<CrossFile> convertApplication(Application app) async {
    final file = File(app.apkFilePath);
    return CrossFile(
      name: '${app.appName}.apk',
      fileType: FileType.apk,
      thumbnail: app is ApplicationWithIcon ? app.icon : null,
      size: await file.length(),
      asset: null,
      path: app.apkFilePath,
      bytes: null,
    );
  }
}
