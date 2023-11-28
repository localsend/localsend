// ignore_for_file: discarded_futures, unawaited_futures

import 'dart:io';
import 'dart:isolate';

import 'package:app_group_directory/app_group_directory.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:localsend_app/util/logger.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

final _logger = Logger('ClearCacheAction');

/// Clears the cache.
/// It runs on a separate isolate to avoid blocking the UI.
class ClearCacheAction extends AsyncGlobalAction {
  @override
  Future<void> reduce() async {
    // The token statement must be outside the lambda because it must be executed on the root isolate.
    final token = RootIsolateToken.instance!;
    await Isolate.run(() => _clear(token));
  }
}

Future<void> _clear(RootIsolateToken token) async {
  initLogger(Level.ALL);
  BackgroundIsolateBinaryMessenger.ensureInitialized(token);

  final futures = (
    FilePicker.platform.clearTemporaryFiles(),
    PhotoManager.clearFileCache(),
    checkPlatform([TargetPlatform.iOS, TargetPlatform.android])
        ? getTemporaryDirectory().then((cacheDir) {
            cacheDir.list().listen((event) {
              if (event is File) {
                event.delete().then((_) {}).catchError((error) {
                  _logger.warning('Failed to delete file: $error');
                });
              }
            });
          })
        : Future.value(),
    checkPlatform([TargetPlatform.iOS])
        ? AppGroupDirectory.getAppGroupDirectory('group.org.localsend.localsendApp').then((directory) async {
            if (directory == null) {
              _logger.warning('Failed to get app group directory');
              return;
            }

            // delete contents of the directory (only files, not directories)
            await for (final entry in directory.list(recursive: false, followLinks: false)) {
              if (entry is File && !entry.path.fileName.startsWith('.')) {
                _logger.info('Deleting ${entry.path}');
                entry.deleteSync();
              }
            }
          })
        : Future.value(),
  ).wait;

  try {
    await futures;
  } catch (e) {
    _logger.warning('Failed to clear cache: $e');
  }
}
