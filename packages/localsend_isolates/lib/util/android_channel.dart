import 'package:flutter/services.dart';
import 'package:localsend_isolates/util/content_uri_helper.dart';
import 'package:logging/logging.dart';

const _methodChannel = MethodChannel('org.localsend.localsend_app/localsend');
final _logger = Logger('AndroidSaf');

/// Opens [uri] for reading and returns an owned Linux file descriptor.
///
/// The descriptor stays open after this call and must be closed by the native
/// consumer it is passed to.
Future<int> getFileDescriptorAndroid({required String uri}) async {
  final fileDescriptor = await _methodChannel.invokeMethod<int>('getFileDescriptor', {
    'uri': uri,
  });
  if (fileDescriptor == null) {
    throw StateError('Android returned no file descriptor for $uri');
  }
  return fileDescriptor;
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

class CreatedFileAndroid {
  /// The URI of the created document. Android may rename the file on collisions.
  final String uri;

  /// An owned writable Linux file descriptor. It stays open after this call and
  /// must be closed by the native consumer it is passed to.
  final int fileDescriptor;

  CreatedFileAndroid({required this.uri, required this.fileDescriptor});
}

/// Creates a new file inside a SAF directory (a tree or document URI)
/// and opens it for writing.
Future<CreatedFileAndroid> createFileAndroid({
  required String parentUri,
  required String fileName,
  required String mimeType,
}) async {
  final result = await _methodChannel.invokeMethod<Map>('createFile', {
    'parentUri': parentUri,
    'fileName': fileName,
    'mimeType': mimeType,
  });
  if (result == null) {
    throw StateError('Android could not create $fileName in $parentUri');
  }
  return CreatedFileAndroid(
    uri: result['uri'] as String,
    fileDescriptor: result['fd'] as int,
  );
}

/// Opens an existing document created by [createFileAndroid] for writing and
/// discards its current content.
///
/// The descriptor stays open after this call and must be closed by the native
/// consumer it is passed to.
Future<int> openFileForWritingAndroid({required String uri}) async {
  final fileDescriptor = await _methodChannel.invokeMethod<int>('openFileForWriting', {
    'uri': uri,
  });
  if (fileDescriptor == null) {
    throw StateError('Android returned no file descriptor for $uri');
  }
  return fileDescriptor;
}
