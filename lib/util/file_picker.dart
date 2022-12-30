import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/file_type.dart' as model;
import 'package:localsend_app/provider/selected_files_provider.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

enum FilePickerOption {
  file(Icons.description),
  media(Icons.image);

  const FilePickerOption(this.icon);

  final IconData icon;

  String get label {
    switch (this) {
      case FilePickerOption.file:
        return t.sendTab.picker.file;
      case FilePickerOption.media:
        return t.sendTab.picker.media;
    }
  }

  Future<void> select({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final selectedFiles = ref.read(selectedFilesProvider);
    switch (this) {
      case FilePickerOption.file:
        final result = await FilePicker.platform.pickFiles(allowMultiple: true);
        if (result != null) {
          ref.read(selectedFilesProvider.notifier).state = [
            ...selectedFiles,
            ...result.files.map((f) {
              return CrossFile(
                name: f.name,
                fileType: f.name.guessFileType(),
                size: f.size,
                asset: null,
                path: kIsWeb ? null : f.path,
                bytes: kIsWeb ? () async => f.bytes! : null,
              );
            }),
          ];
        }
        break;
      case FilePickerOption.media:
        final List<AssetEntity>? result = await AssetPicker.pickAssets(
          context,
          pickerConfig: const AssetPickerConfig(
            maxAssets: 999,
          ),
        );
        if (result != null) {
          ref.read(selectedFilesProvider.notifier).state = [
            ...selectedFiles,
            ...await Future.wait(result.map((asset) async {
              final file = (await asset.originFile)!;
              return CrossFile(
                name: await asset.titleAsync,
                fileType: asset.type == AssetType.video ? model.FileType.video : model.FileType.image,
                size: await file.length(),
                asset: asset,
                path: file.path,
                bytes: null,
              );
            })),
          ];
          print(result);
        }
        return;
    }
  }
}
