import 'dart:io';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/rust/api/metadata.dart';
import 'package:localsend_isolates/util/file_path_helper.dart';
import 'package:path/path.dart' as p;
import 'package:share_handler/share_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// Utility functions to convert third party models to common [CrossFile] model.
class CrossFileConverters {
  /// Optionally exports the paired video alongside a Live Photo's still image.
  static Future<List<CrossFile>> convertAssetEntity(AssetEntity asset, {bool sendLivePhotoVideo = false}) async {
    final file = await asset.originFile;
    if (file == null) {
      throw StateError('Could not load the selected photo or video. Please download it in Photos and try again.');
    }
    final metadata = await readFileMetadata(path: file.path);
    final title = await asset.titleAsync;
    var name = title.isEmpty ? p.basename(file.path) : title;
    if (asset.isLivePhoto && p.extension(file.path).isNotEmpty) {
      // An edited Live Photo can export a JPEG even if the original title ends
      // in HEIC. Keep the user's basename but use the actual resource format.
      name = '${p.basenameWithoutExtension(name)}${p.extension(file.path)}';
    }
    final image = CrossFile(
      name: name,
      fileType: asset.type == AssetType.video ? FileType.video : FileType.image,
      size: await file.length(),
      thumbnail: null,
      asset: asset,
      path: file.path,
      bytes: null,
      lastModified: metadata?.modified,
      lastAccessed: metadata?.accessed,
    );

    // Keep the default still-only behavior without exporting the paired video.
    if (!sendLivePhotoVideo || !asset.isLivePhoto) {
      return [image];
    }

    // photo_manager exports the paired video when the Live Photo subtype is
    // requested. originFile alone only exports the still image.
    final video = await asset.originFileWithSubtype;
    if (video == null || video.path == file.path) {
      throw StateError('Could not load the Live Photo video. Please download the Live Photo in Photos and try again.');
    }
    final videoFile = await convertFile(video);
    return [
      image,
      videoFile.copyWith(
        name: '${p.basenameWithoutExtension(image.name)}${p.extension(video.path)}',
        fileType: FileType.video,
        asset: asset,
      ),
    ];
  }

  static Future<CrossFile> convertXFile(XFile file) async {
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
}

extension CompareFile on CrossFile {
  bool isSameFile({required CrossFile otherFile}) {
    return (path ?? '') == (otherFile.path ?? '');
  }
}
