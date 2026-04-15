import 'dart:io' show File;

import 'package:common/model/file_type.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/widget/dialogs/cannot_open_file_dialog.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';

/// Opens the selected file which is stored on the device.
/// If the file doesn't exist at [filePath], attempts to find it by name in
/// [destinationDirectory] (handles stale sandbox portal paths on Linux).
Future<void> openFile(
  BuildContext context,
  FileType fileType,
  String filePath, {
  String? destinationDirectory,
  void Function()? onDeleteTap,
}) async {
  if ((fileType == FileType.apk || filePath.toLowerCase().endsWith('.apk')) && checkPlatform([TargetPlatform.android])) {
    await Permission.requestInstallPackages.request();
  }

  if (filePath.startsWith('content://')) {
    await android_channel.openContentUri(uri: filePath);
    return;
  }

  // Fallback: if the stored path no longer exists, try finding the file in the destination directory
  if (!await File(filePath).exists() && destinationDirectory != null) {
    final fallbackPath = p.join(destinationDirectory, p.basename(filePath));
    if (await File(fallbackPath).exists()) {
      filePath = fallbackPath;
    }
  }

  final fileOpenResult = await OpenFilex.open(filePath);
  if (fileOpenResult.type != ResultType.done && context.mounted) {
    await CannotOpenFileDialog.open(context, filePath, onDeleteTap);
  }
}
