// ignore_for_file: discarded_futures

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

final _logger = Logger('CacheHelper');

/// Clears the cache.
/// It is written in a "fire-and-forget" way, so we don't need to wait until everything is cleared.
void clearCache() {
  FilePicker.platform.clearTemporaryFiles().then((_) {}).catchError((error) {
    _logger.info('Failed to clear file picker cache', error);
  });

  PhotoManager.clearFileCache().catchError((error) => _logger.info('Failed to clear photo manager cache', error));

  if (checkPlatform([TargetPlatform.iOS, TargetPlatform.android])) {
    getTemporaryDirectory().then((cacheDir) {
      cacheDir.list().listen((event) {
        if (event is File) {
          event.delete().then((_) {}).catchError((error) {
            _logger.info('Failed to delete file', error);
          });
        }
      });
    }).catchError((error) {
      _logger.info('Failed to get temporary directory', error);
    });
  }
}
