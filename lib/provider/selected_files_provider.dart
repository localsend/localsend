import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

final selectedFilesProvider = StateNotifierProvider<SelectedFilesNotifier, List<CrossFile>>((ref) {
  return SelectedFilesNotifier();
});

class SelectedFilesNotifier extends StateNotifier<List<CrossFile>> {
  SelectedFilesNotifier() : super([]);

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

/// Utility functions to convert third party models to [CrossFile].
class CrossFileConverters {
  static Future<CrossFile> convertPlatformFile(file_picker.PlatformFile file) async {
    return CrossFile(
      name: file.name,
      fileType: file.name.guessFileType(),
      size: file.size,
      asset: null,
      path: kIsWeb ? null : file.path,
      bytes: kIsWeb ? () async => file.bytes! : null,
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
      bytes: kIsWeb ? () => file.readAsBytes() : null,
    );
  }
}
