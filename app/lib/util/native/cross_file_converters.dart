import 'dart:io';

import 'package:device_apps/device_apps.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:share_handler/share_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// Utility functions to convert third party models to common [CrossFile] model.
class CrossFileConverters {
  static Future<CrossFile> convertPlatformFile(file_picker.PlatformFile file) async {
    return CrossFile(
      name: file.name,
      fileType: file.name.guessFileType(),
      size: file.size,
      thumbnail: null,
      asset: null,
      path: kIsWeb ? null : file.path,
      bytes: kIsWeb ? file.bytes! : null,
    );
  }

  static Future<CrossFile> convertAssetEntity(AssetEntity asset) async {
    final file = (await asset.originFile)!;
    return CrossFile(
      name: await asset.titleAsync,
      fileType: asset.type == AssetType.video ? FileType.video : FileType.image,
      size: await file.length(),
      thumbnail: null,
      asset: asset,
      path: file.path,
      bytes: null,
    );
  }

  static Future<CrossFile> convertXFile(XFile file) async {
    return CrossFile(
      name: file.name,
      fileType: file.name.guessFileType(),
      size: await file.length(),
      thumbnail: null,
      asset: null,
      path: kIsWeb ? null : file.path,
      bytes: kIsWeb ? await file.readAsBytes() : null, // we can fetch it now because in Web it is already there
    );
  }

  static Future<CrossFile> convertSharedAttachment(SharedAttachment attachment) async {
    final file = File(attachment.path);
    final fileName = attachment.path.fileName;
    return CrossFile(
      name: fileName,
      fileType: fileName.guessFileType(),
      size: await file.length(),
      thumbnail: null,
      asset: null,
      path: file.path,
      bytes: null,
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
    );
  }
}

extension CompareFile on CrossFile {
  bool isSameFile({required CrossFile otherFile}) {
    return (path ?? '') == (otherFile.path ?? '');
  }
}
