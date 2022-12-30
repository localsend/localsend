import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/selected_files_provider.dart';
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
    switch (this) {
      case FilePickerOption.file:
        final result = await FilePicker.platform.pickFiles(allowMultiple: true);
        if (result != null) {
          ref.read(selectedFilesProvider.notifier).addFiles(
            files: result.files,
            converter: CrossFileConverters.convertPlatformFile,
          );
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
          ref.read(selectedFilesProvider.notifier).addFiles(
            files: result,
            converter: CrossFileConverters.convertAssetEntity,
          );
        }
        return;
    }
  }
}
