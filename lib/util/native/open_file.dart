import 'package:flutter/material.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/widget/dialogs/cannot_open_file_dialog.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';

/// Opens the selected file which is stored on the device.
Future<void> openFile(BuildContext context, FileType fileType, String filePath) async {
  if ((fileType == FileType.apk || filePath.toLowerCase().endsWith('.apk')) && checkPlatform([TargetPlatform.android])) {
    await Permission.requestInstallPackages.request();
  }
  final fileOpenResult = await OpenFilex.open(filePath);
  if (fileOpenResult.type != ResultType.done && context.mounted) {
    CannotOpenFileDialog.open(context, filePath);
  }
}