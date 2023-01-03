import 'dart:convert' show utf8;
import 'dart:io';

import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:share_handler/share_handler.dart';
import 'package:uuid/uuid.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

const _uuid = Uuid();

final selectedFilesProvider = StateNotifierProvider<SelectedFilesNotifier, List<CrossFile>>((ref) {
  return SelectedFilesNotifier();
});

class SelectedFilesNotifier extends StateNotifier<List<CrossFile>> {
  SelectedFilesNotifier() : super([]);

  /// Add a simple message
  /// Internally, the message will be stored into [CrossFile.bytes] as UTF-8
  void addMessage(String message) {
    final List<int> bytes = utf8.encode(message);
    state = List.unmodifiable([
      ...state,
      CrossFile(
        name: '${_uuid.v4()}.txt',
        fileType: FileType.text,
        size: bytes.length,
        asset: null,
        path: null,
        bytes: bytes,
      ),
    ]);
  }

  Future<void> addFiles<T>({
    required Iterable<T> files,
    required Future<CrossFile> Function(T) converter,
  }) async {
    final tempList = [...state];
    for (final file in files) {
      // we do it sequential because there are bugs
      // https://github.com/fluttercandies/flutter_photo_manager/issues/589
      tempList.add(await converter(file));
    }
    state = List.unmodifiable(tempList);
  }

  void removeAt(int index) {
    state = List.unmodifiable([...state]..removeAt(index));
  }

  void reset() {
    state = List.empty(growable: false);
  }
}

/// Utility functions to convert third party models to common [CrossFile] model.
class CrossFileConverters {
  static Future<CrossFile> convertPlatformFile(file_picker.PlatformFile file) async {
    return CrossFile(
      name: file.name,
      fileType: file.name.guessFileType(),
      size: file.size,
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
      asset: null,
      path: file.path,
      bytes: null,
    );
  }
}
