import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// Clears the cache.
/// It is written in a "fire-and-forget" way, so we don't need to wait until everything is cleared.
void clearCache() {
  FilePicker.platform.clearTemporaryFiles().then((_) {}).catchError((error) {
    print(error);
  });
  PhotoManager.clearFileCache().catchError((error) => print(error));

  getTemporaryDirectory().then((cacheDir) {
    cacheDir.list().listen((event) {
      if (event is File) {
        event.delete().then((_) {}).catchError((error) {
          print(error);
        });
      }
    });
  }).catchError((error) {
    print(error);
  });
}
