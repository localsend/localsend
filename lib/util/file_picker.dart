import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/apk_picker_page.dart';
import 'package:localsend_app/provider/picking_status_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/util/asset_picker_translated_text_delegate.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/widget/dialogs/loading_dialog.dart';
import 'package:localsend_app/widget/dialogs/message_input_dialog.dart';
import 'package:routerino/routerino.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

enum FilePickerOption {
  file(Icons.description),
  media(Icons.image),
  text(Icons.subject),
  app(Icons.apps);

  const FilePickerOption(this.icon);

  final IconData icon;

  String get label {
    switch (this) {
      case FilePickerOption.file:
        return t.sendTab.picker.file;
      case FilePickerOption.media:
        return t.sendTab.picker.media;
      case FilePickerOption.text:
        return t.sendTab.picker.text;
      case FilePickerOption.app:
        return t.sendTab.picker.app;
    }
  }

  Future<void> select({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    switch (this) {
      case FilePickerOption.file:
        ref.read(pickingStatusProvider.notifier).state = true;
        if (checkPlatform([TargetPlatform.android])) {
          // On android, the files are copied to the cache which takes some time.
          unawaited(showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const LoadingDialog(),
          ));
        }
        final result = await FilePicker.platform.pickFiles(allowMultiple: true);
        if (result != null) {
          await ref.read(selectedSendingFilesProvider.notifier).addFiles(
                files: result.files,
                converter: CrossFileConverters.convertPlatformFile,
              );
        }
        ref.read(pickingStatusProvider.notifier).state = false;
        break;
      case FilePickerOption.media:
        final List<AssetEntity>? result = await AssetPicker.pickAssets(
          context,
          pickerConfig: const AssetPickerConfig(
            maxAssets: 999,
            textDelegate: TranslatedAssetPickerTextDelegate()
          ),
        );
        if (result != null) {
          await ref.read(selectedSendingFilesProvider.notifier).addFiles(
                files: result,
                converter: CrossFileConverters.convertAssetEntity,
              );
        }
        break;
      case FilePickerOption.text:
        final result = await showDialog<String>(context: context, builder: (_) => const MessageInputDialog());
        if (result != null) {
          ref.read(selectedSendingFilesProvider.notifier).addMessage(result);
        }
        break;
      case FilePickerOption.app:
        // Currently, only Android APK
        await context.push(() => const ApkPickerPage());
        break;
    }
  }
}
