// ignore_for_file: discarded_futures, unawaited_futures

import 'dart:io';
import 'dart:isolate';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_isolates/util/file_path_helper.dart';
import 'package:localsend_isolates/util/logger.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_foundation/path_provider_foundation.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

final _logger = Logger('ClearCacheAction');

/// Clears the cache.
/// It runs on a separate isolate to avoid blocking the UI.
class ClearCacheAction extends AsyncGlobalAction {
  final Set<String> preservePaths;

  ClearCacheAction({this.preservePaths = const {}});

  @override
  Future<void> reduce() async {
    // The token statement must be outside the lambda because it must be executed on the root isolate.
    final token = ServicesBinding.rootIsolateToken!;
    final pathsToPreserve = preservePaths;
    await Isolate.run(() => _clear(token, pathsToPreserve));
  }
}

Future<void> _clear(RootIsolateToken token, Set<String> preservePaths) async {
  initLogger(Level.ALL);
  BackgroundIsolateBinaryMessenger.ensureInitialized(token);
  final protectedPaths = preservePaths.map(_canonicalPath).toSet();

  final futures = (
    // These plugin APIs clear their whole cache and cannot exclude incoming files.
    protectedPaths.isEmpty ? FilePicker.clearTemporaryFiles() : Future<bool?>.value(),
    protectedPaths.isEmpty ? PhotoManager.clearFileCache() : Future<void>.value(),
    checkPlatform([TargetPlatform.iOS, TargetPlatform.android])
        ? getTemporaryDirectory().then((cacheDir) async {
            await for (final event in cacheDir.list()) {
              if (event is File) {
                try {
                  await deleteUnprotectedCacheFile(event, protectedPaths);
                } catch (error) {
                  _logger.warning('Failed to delete file: $error');
                }
              }
            }
          })
        : Future.value(),
    checkPlatform([TargetPlatform.iOS])
        ? PathProviderFoundation()
              .getContainerPath(
                appGroupIdentifier: 'group.org.localsend.localsendApp',
              )
              .then((directoryPath) async {
                if (directoryPath == null) {
                  _logger.warning('Failed to get app group directory');
                  return;
                }

                final directory = Directory(directoryPath);

                // delete contents of the directory (only files, not directories)
                await for (final entry in directory.list(recursive: false, followLinks: false)) {
                  if (entry is File && !entry.path.fileName.startsWith('.')) {
                    await deleteUnprotectedCacheFile(entry, protectedPaths);
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

/// Deletes a cache file unless it is an incoming file or inside an incoming directory.
Future<void> deleteUnprotectedCacheFile(File file, Set<String> preservePaths) async {
  final filePath = _canonicalPath(file.path);
  if (preservePaths.any((path) {
    final protectedPath = _canonicalPath(path);
    return filePath == protectedPath || p.isWithin(protectedPath, filePath);
  })) {
    return;
  }
  await file.delete();
}

String _canonicalPath(String path) {
  try {
    return File(path).resolveSymbolicLinksSync();
  } catch (_) {
    return p.normalize(p.absolute(path));
  }
}
