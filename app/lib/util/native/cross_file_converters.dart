import 'dart:io';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:localsend_app/util/native/macos_app_archive.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/rust/api/metadata.dart';
import 'package:localsend_isolates/util/file_path_helper.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:share_handler/share_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

final _logger = Logger('PreparedSendingFiles');

class PreparedSendingFiles {
  final List<CrossFile> files;
  final List<Directory> archiveDirectories;

  PreparedSendingFiles(this.files, this.archiveDirectories);

  Future<void> dispose() async {
    for (final directory in archiveDirectories) {
      try {
        if (await directory.exists()) {
          await directory.delete(recursive: true);
        }
      } catch (e) {
        _logger.warning('Could not delete application archive at ${directory.path}', e);
      }
    }
  }
}

/// Utility functions to convert third party models to common [CrossFile] model.
class CrossFileConverters {
  static Future<CrossFile> convertAssetEntity(AssetEntity asset) async {
    final file = (await asset.originFile)!;
    final metadata = await readFileMetadata(path: file.path);
    return CrossFile(
      name: await asset.titleAsync,
      fileType: asset.type == AssetType.video ? FileType.video : FileType.image,
      size: await file.length(),
      thumbnail: null,
      asset: asset,
      path: file.path,
      bytes: null,
      lastModified: metadata?.modified,
      lastAccessed: metadata?.accessed,
    );
  }

  static Future<CrossFile> convertXFile(XFile file) async {
    if (!kIsWeb && isMacosApp(Directory(file.path)) && await Directory(file.path).exists()) {
      return selectMacosAppForSending(Directory(file.path));
    }
    final metadata = kIsWeb ? null : await readFileMetadata(path: file.path);
    return CrossFile(
      name: file.name,
      fileType: file.name.guessFileType(),
      size: await file.length(),
      thumbnail: null,
      asset: null,
      path: kIsWeb ? null : file.path,
      bytes: kIsWeb ? await file.readAsBytes() : null, // we can fetch it now because in Web it is already there
      lastModified: metadata?.modified,
      lastAccessed: metadata?.accessed,
    );
  }

  static Future<CrossFile> convertFile(File file) async {
    if (isMacosApp(Directory(file.path)) && await Directory(file.path).exists()) {
      return selectMacosAppForSending(Directory(file.path));
    }
    final metadata = await readFileMetadata(path: file.path);
    return CrossFile(
      name: file.path.fileName,
      fileType: file.path.fileName.guessFileType(),
      size: await file.length(),
      thumbnail: null,
      asset: null,
      path: file.path,
      bytes: null,
      lastModified: metadata?.modified,
      lastAccessed: metadata?.accessed,
    );
  }

  static Future<CrossFile> convertFileInfo(android_channel.FileInfo file) async {
    return CrossFile(
      name: file.name,
      fileType: file.name.guessFileType(),
      size: file.size,
      thumbnail: null,
      asset: null,
      path: file.uri,
      bytes: null,
      // SAF only provides milliseconds, so there is no point statting in Rust.
      lastModified: file.lastModified,
      lastAccessed: null,
    );
  }

  static Future<CrossFile> convertSharedAttachment(SharedAttachment attachment) async {
    if (isMacosApp(Directory(attachment.path)) && await Directory(attachment.path).exists()) {
      return selectMacosAppForSending(Directory(attachment.path));
    }
    final file = File(attachment.path);
    final fileName = attachment.path.fileName;
    final metadata = await readFileMetadata(path: file.path);
    return CrossFile(
      name: fileName,
      fileType: fileName.guessFileType(),
      size: await file.length(),
      thumbnail: null,
      asset: null,
      path: file.path,
      bytes: null,
      lastModified: metadata?.modified,
      lastAccessed: metadata?.accessed,
    );
  }

  static Future<CrossFile> convertApplication(Application app) async {
    final file = File(app.apkFilePath);
    return CrossFile(
      name: '${app.appName.trim()} - v${app.versionName}.apk',
      fileType: FileType.apk,
      thumbnail: app is ApplicationWithIcon ? app.icon : null,
      size: await file.length(),
      asset: null,
      path: app.apkFilePath,
      bytes: null,
      lastModified: null,
      lastAccessed: null,
    );
  }

  static CrossFile selectMacosAppForSending(Directory app) {
    return CrossFile(
      name: '${p.basename(p.normalize(app.path))}.zip',
      fileType: FileType.other,
      size: -1,
      thumbnail: null,
      asset: null,
      path: app.path,
      bytes: null,
      lastModified: null,
      lastAccessed: null,
    );
  }

  static Future<CrossFile> prepareMacosAppForSending(CrossFile file) async {
    if (!isPendingMacosAppArchive(file)) {
      return file;
    }

    final archive = await archiveMacosApp(Directory(file.path!), await macosAppArchiveCache());
    try {
      return file.copyWith(path: archive.path, size: await archive.length());
    } catch (_) {
      await archive.parent.delete(recursive: true);
      rethrow;
    }
  }

  static Future<PreparedSendingFiles> prepareFilesForSending(List<CrossFile> files) async {
    final prepared = <CrossFile>[];
    final archiveDirectories = <Directory>[];
    try {
      for (final file in files) {
        final preparedFile = await prepareMacosAppForSending(file);
        prepared.add(preparedFile);
        if (isPendingMacosAppArchive(file)) {
          archiveDirectories.add(File(preparedFile.path!).parent);
        }
      }
    } catch (_) {
      await PreparedSendingFiles(prepared, archiveDirectories).dispose();
      rethrow;
    }
    return PreparedSendingFiles(prepared, archiveDirectories);
  }
}

extension CompareFile on CrossFile {
  bool isSameFile({required CrossFile otherFile}) {
    return (path ?? '') == (otherFile.path ?? '');
  }
}
