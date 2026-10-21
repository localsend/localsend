import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart' as file_selector;
import 'package:flutter/foundation.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:localsend_app/util/native/linux_file_dialog.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('PickDirectoryPath');

/// Opens a file picker to select a directory.
/// Returns null if the user cancels the selection.
Future<String?> pickDirectoryPath() async {
  if (defaultTargetPlatform == TargetPlatform.android &&
      (RefenaScope.defaultRef.read(deviceRawInfoProvider).androidSdkInt ?? 0) >= android_channel.contentUriMinSdk) {
    return await android_channel.pickDirectoryPathAndroid();
  }

  if (checkPlatform([TargetPlatform.android, TargetPlatform.iOS])) {
    /// We need to use the file_picker package because file_selector does not expose the raw path.
    /// We need the raw path to properly manipulate the path to save new files, or
    /// to list files recursively.
    /// Also, on iOS, file_selector does not work with directories.
    return await FilePicker.getDirectoryPath();
  }

  return pickDesktopDirectory(
    pickNative: () => pickDirectoryLinux(
      title: t.sendTab.picker.folder,
      acceptLabel: t.general.open,
      cancelLabel: t.general.cancel,
    ),
    pickFallback: () => file_selector.getDirectoryPath(confirmButtonText: t.general.open),
  );
}

@visibleForTesting
Future<String?> pickDesktopDirectory({
  required Future<String?> Function() pickNative,
  required Future<String?> Function() pickFallback,
}) async {
  if (defaultTargetPlatform == TargetPlatform.linux) {
    try {
      return await pickNative();
    } catch (e) {
      _logger.warning('Linux directory dialog failed, falling back to file_selector', e);
    }
  }

  return await pickFallback();
}
