import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart' as file_selector;
import 'package:flutter/material.dart';
import 'package:localsend_app/util/native/platform_check.dart';

/// Opens a file picker to select a directory.
/// Returns null if the user cancels the selection.
Future<String?> pickDirectoryPath() async {
  if (checkPlatform([TargetPlatform.android])) {
    /// We need to use the file_picker package because file_selector does not expose the raw path.
    /// We need the raw path to properly manipulate the path to save new files, or
    /// to list files recursively.
    /// https://github.com/miguelpruivo/flutter_file_picker/issues/1282
    return await FilePicker.platform.getDirectoryPath();
  } else {
    return await file_selector.getDirectoryPath();
  }
}
