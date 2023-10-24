import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart' as file_selector;
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/file_type.dart' as file_type;
import 'package:localsend_app/pages/apk_picker_page.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/determine_image_type.dart';
import 'package:localsend_app/util/native/cross_file_converters.dart';
import 'package:localsend_app/util/native/pick_directory_path.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:localsend_app/util/ui/asset_picker_translated_text_delegate.dart';
import 'package:localsend_app/widget/dialogs/loading_dialog.dart';
import 'package:localsend_app/widget/dialogs/message_input_dialog.dart';
import 'package:localsend_app/widget/dialogs/no_permission_dialog.dart';
import 'package:logging/logging.dart';
import 'package:pasteboard/pasteboard.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

final _logger = Logger('FilePickerHelper');

enum FilePickerOption {
  file(Icons.description),
  folder(Icons.folder),
  media(Icons.image),
  text(Icons.subject),
  app(Icons.apps),
  clipboard(Icons.paste);

  const FilePickerOption(this.icon);

  final IconData icon;

  String get label {
    switch (this) {
      case FilePickerOption.file:
        return t.sendTab.picker.file;
      case FilePickerOption.folder:
        return t.sendTab.picker.folder;
      case FilePickerOption.media:
        return t.sendTab.picker.media;
      case FilePickerOption.text:
        return t.sendTab.picker.text;
      case FilePickerOption.app:
        return t.sendTab.picker.app;
      case FilePickerOption.clipboard:
        return t.sendTab.picker.clipboard;
    }
  }

  /// Returns the options for the current platform.
  static List<FilePickerOption> getOptionsForPlatform() {
    if (checkPlatform([TargetPlatform.iOS])) {
      // On iOS, picking from media is most common.
      // The file app is very limited.
      return [
        FilePickerOption.media,
        FilePickerOption.text,
        FilePickerOption.file,
        FilePickerOption.folder,
      ];
    } else if (checkPlatform([TargetPlatform.android])) {
      // On android, the file app is most powerful.
      // It actually also allows to pick media files.
      return [
        FilePickerOption.file,
        FilePickerOption.media,
        FilePickerOption.text,
        FilePickerOption.folder,
        FilePickerOption.app,
      ];
    } else {
      // Desktop
      return [
        FilePickerOption.file,
        FilePickerOption.folder,
        FilePickerOption.text,
        FilePickerOption.clipboard,
      ];
    }
  }
}

class PickFileAction extends AsyncGlobalAction {
  final FilePickerOption option;
  final BuildContext context;

  PickFileAction({
    required this.option,
    required this.context,
  });

  @override
  Future<void> reduce() async {
    switch (option) {
      case FilePickerOption.file:
        await _pickFiles(context, ref);
        break;
      case FilePickerOption.folder:
        // ignore: use_build_context_synchronously
        await _pickFolder(context, ref);
        break;
      case FilePickerOption.media:
        // ignore: use_build_context_synchronously
        await _pickMedia(context, ref);
        break;
      case FilePickerOption.text:
        // ignore: use_build_context_synchronously
        await _pickText(context, ref);
        break;
      case FilePickerOption.clipboard:
        // ignore: use_build_context_synchronously
        await _pickClipboard(context, ref);
        break;
      case FilePickerOption.app:
        // ignore: use_build_context_synchronously
        await _pickApp(context);
        break;
    }
  }

  @override
  String toString() {
    return 'PickAction(option: $option)';
  }
}

Future<void> _pickFiles(BuildContext context, Ref ref) async {
  if (checkPlatform([TargetPlatform.android])) {
    // On android, the files are copied to the cache which takes some time.
    // ignore: unawaited_futures
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const LoadingDialog(),
    );
  }
  try {
    if (checkPlatform([TargetPlatform.android])) {
      // We also need to use the file_picker package because file_selector does not expose the raw path.
      final result = await FilePicker.platform.pickFiles(allowMultiple: true);
      if (result != null) {
        await ref.redux(selectedSendingFilesProvider).dispatchAsync(AddFilesAction(
              files: result.files,
              converter: CrossFileConverters.convertPlatformFile,
            ));
      }
    } else {
      final result = await file_selector.openFiles();
      if (result.isNotEmpty) {
        await ref.redux(selectedSendingFilesProvider).dispatchAsync(AddFilesAction(
              files: result,
              converter: CrossFileConverters.convertXFile,
            ));
      }
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    await showDialog(context: context, builder: (_) => const NoPermissionDialog());
    _logger.warning('Failed to pick files', e);
  } finally {
    // ignore: use_build_context_synchronously
    Routerino.context.popUntilRoot(); // remove loading dialog
  }
}

Future<void> _pickFolder(BuildContext context, Ref ref) async {
  if (checkPlatform([TargetPlatform.android])) {
    try {
      await Permission.manageExternalStorage.request();
    } catch (e) {
      _logger.warning('Failed to request manageExternalStorage permission', e);
    }
  }

  if (!context.mounted) {
    return;
  }

  // ignore: unawaited_futures
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const LoadingDialog(),
  );
  await sleepAsync(200); // Wait for the dialog to be shown
  try {
    final directoryPath = await pickDirectoryPath();
    if (directoryPath != null) {
      await ref.redux(selectedSendingFilesProvider).dispatchAsync(AddDirectoryAction(directoryPath));
    }
  } catch (e) {
    _logger.warning('Failed to pick directory', e);
    // ignore: use_build_context_synchronously
    await showDialog(context: context, builder: (_) => const NoPermissionDialog());
  } finally {
    // ignore: use_build_context_synchronously
    Routerino.context.popUntilRoot(); // remove loading dialog
  }
}

Future<void> _pickMedia(BuildContext context, Ref ref) async {
  final oldBrightness = Theme.of(context).brightness;
  // ignore: use_build_context_synchronously
  final List<AssetEntity>? result = await AssetPicker.pickAssets(
    context,
    pickerConfig: const AssetPickerConfig(maxAssets: 999, textDelegate: TranslatedAssetPickerTextDelegate()),
  );

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    // restore brightness for Android
    await sleepAsync(500);
    if (context.mounted) {
      await updateSystemOverlayStyleWithBrightness(oldBrightness);
    }
  });

  if (result != null) {
    await ref.redux(selectedSendingFilesProvider).dispatchAsync(AddFilesAction(
          files: result,
          converter: CrossFileConverters.convertAssetEntity,
        ));
  }
}

Future<void> _pickText(BuildContext context, Ref ref) async {
  final result = await showDialog<String>(context: context, builder: (_) => const MessageInputDialog());
  if (result != null) {
    ref.redux(selectedSendingFilesProvider).dispatch(AddMessageAction(message: result));
  }
}

Future<void> _pickClipboard(BuildContext context, Ref ref) async {
  late List<String> files = [];
  for (final file in await Pasteboard.files()) {
    files.add(file);
  }
  if (files.isNotEmpty) {
    await ref.redux(selectedSendingFilesProvider).dispatchAsync(AddFilesAction(
          files: files.map((e) => XFile(e)).toList(),
          converter: CrossFileConverters.convertXFile,
        ));
    return;
  }

  final data = await Clipboard.getData(Clipboard.kTextPlain);
  if (data?.text != null) {
    ref.redux(selectedSendingFilesProvider).dispatch(AddMessageAction(message: data!.text!));
    return;
  }

  final image = await Pasteboard.image;
  if (image != null) {
    final now = DateTime.now();
    final fileName =
        'clipboard_${now.year}-${now.month.twoDigitString}-${now.day.twoDigitString}_${now.hour.twoDigitString}-${now.minute.twoDigitString}.${determineImageType(image)}';
    ref.redux(selectedSendingFilesProvider).dispatch(AddBinaryAction(
          bytes: image,
          fileType: file_type.FileType.image,
          fileName: fileName,
        ));
    return;
  }

  if (!context.mounted) {
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(t.general.noItemInClipboard),
  ));
}

Future<void> _pickApp(BuildContext context) async {
  // Currently, only Android APK
  await context.push(() => const ApkPickerPage());
}

extension on int {
  String get twoDigitString => toString().padLeft(2, '0');
}
