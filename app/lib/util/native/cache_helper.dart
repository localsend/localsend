// ignore_for_file: discarded_futures

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:path_provider/path_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// Clears the cache.
/// It is written in a "fire-and-forget" way, so we don't need to wait until everything is cleared.
class ClearCacheAction extends GlobalAction {
  @override
  void reduce() {}

  @override
  void after() {
    FilePicker.platform.clearTemporaryFiles().then((_) {}).catchError((error) {
      ref.message('Failed to clear file picker cache: $error');
    });

    PhotoManager.clearFileCache().catchError((error) => ref.message('Failed to clear photo manager cache: $error'));

    if (checkPlatform([TargetPlatform.iOS, TargetPlatform.android])) {
      getTemporaryDirectory().then((cacheDir) {
        cacheDir.list().listen((event) {
          if (event is File) {
            event.delete().then((_) {}).catchError((error) {
              ref.message('Failed to delete file: $error');
            });
          }
        });
      }).catchError((error) {
        ref.message('Failed to get temporary directory: $error');
      });
    }
  }
}
