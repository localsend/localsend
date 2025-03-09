import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/util/native/content_uri_helper.dart';
import 'package:logging/logging.dart';

part 'android_channel.mapper.dart';

const _methodChannel = MethodChannel('org.localsend.localsend_app/localsend');
final _logger = Logger('AndroidSaf');

/// From Android 10 and above, we need to use the Storage Access Framework (SAF) to access files due to the scoped storage.
/// SAF itself is available from Android 4.4 (API level 19).
/// We implemented our own algorithm to build encode and decode content URIs.
/// Older versions might also work but the encoded content URI is not guaranteed to work with our algorithm.
const contentUriMinSdk = 27;

Future<PickDirectoryResult?> pickDirectoryAndroid() async {
  final result = await _methodChannel.invokeMethod<Map>('pickDirectory');
  if (result == null) {
    return null;
  }

  return PickDirectoryResultMapper.fromJson({
    'directoryUri': result['directoryUri'],
    'files': (result['files'] as List).map((e) => FileInfoMapper.fromJson((e as Map).cast<String, dynamic>())).toList(),
  });
}

Future<String?> pickDirectoryPathAndroid() async {
  final result = await _methodChannel.invokeMethod<String>('pickDirectoryPath');
  return result;
}

Future<List<FileInfo>?> pickFilesAndroid() async {
  final result = await _methodChannel.invokeMethod<List>('pickFiles');
  if (result == null) {
    return null;
  }

  return result.map((e) => FileInfoMapper.fromJson((e as Map).cast<String, dynamic>())).toList();
}

Future<bool> getSystemAnimationsStatusAndroid() async {
  return await _methodChannel.invokeMethod('isAnimationsEnabled') ?? true;
}

Future<void> createDirectory({
  required String documentUri,
  required String directoryName,
}) async {
  _logger.info('Creating directory "$directoryName" in $documentUri');
  await _methodChannel.invokeMethod('createDirectory', {
    'documentUri': documentUri,
    'directoryName': directoryName,
  });
}

Future<void> createMissingDirectoriesAndroid({
  required String parentUri,
  required String fileName,
  required Set<String> createdDirectories,
}) async {
  final parts = fileName.split('/');
  for (int i = 0; i < parts.length - 1; i++) {
    final subDirPath = parts.sublist(0, i + 1).join('/');
    if (createdDirectories.contains(subDirPath)) {
      continue;
    }

    await createDirectory(
      documentUri: ContentUriHelper.convertTreeUriToDocumentUri(
        treeUri: parentUri,
        suffix: i == 0 ? null : parts.sublist(0, i).join('/'),
      ),
      directoryName: parts[i],
    );
    createdDirectories.add(subDirPath);
  }
}

Future<void> openContentUri({
  required String uri,
}) async {
  _logger.info('Opening content URI: $uri');
  await _methodChannel.invokeMethod('openContentUri', {
    'uri': uri,
  });
}

Future<void> openGallery() async {
  _logger.info('Opening gallery');
  await _methodChannel.invokeMethod('openGallery');
}

@MappableClass()
class PickDirectoryResult with PickDirectoryResultMappable {
  final String directoryUri;
  final List<FileInfo> files;

  PickDirectoryResult({
    required this.directoryUri,
    required this.files,
  });
}

@MappableClass()
class FileInfo with FileInfoMappable {
  final String name;
  final int size;
  final String uri;
  final int lastModified;

  FileInfo({
    required this.name,
    required this.size,
    required this.uri,
    required this.lastModified,
  });
}
