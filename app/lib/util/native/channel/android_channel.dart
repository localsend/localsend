import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/services.dart';
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

/// Returns a variant of [uri] that resolves to the unredacted original file, so the
/// location EXIF tags survive. Falls back to [uri] when the platform cannot grant it,
/// because losing the tags beats failing the whole selection.
Future<String> getOriginalMediaUriAndroid({required String uri}) async {
  try {
    return await _methodChannel.invokeMethod<String>('getOriginalMediaUri', {'uri': uri}) ?? uri;
  } catch (e) {
    _logger.warning('Could not resolve the original media URI for $uri', e);
    return uri;
  }
}

/// Returns the global "Download" directory, e.g. /storage/emulated/0/Download.
Future<String?> getDownloadsDirectoryAndroid() async {
  try {
    return await _methodChannel.invokeMethod<String>('getDownloadsDirectory');
  } catch (e) {
    _logger.warning('Could not get downloads directory', e);
    return null;
  }
}

Future<bool> getSystemAnimationsStatusAndroid() async {
  return await _methodChannel.invokeMethod('isAnimationsEnabled') ?? true;
}

/// Requests the "Nearby devices" permission gating local network access on Android 17+.
/// Returns true when granted or when running on an older Android version.
Future<bool> requestLocalNetworkPermissionAndroid() async {
  try {
    return await _methodChannel.invokeMethod<bool>('requestLocalNetworkPermission') ?? false;
  } catch (e) {
    _logger.warning('Could not request local network permission', e);
    return false;
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

/// Tells MainActivity that the Dart side is ready for share intents, and returns the ones
/// that were held back during app start.
///
/// Only the shares carrying files come back here. Text-only ones are replayed natively
/// through share_handler and arrive on its media stream instead.
Future<List<SharedPayload>> notifyShareIntentReadyAndroid() async {
  try {
    final result = await _methodChannel.invokeMethod<List>('shareIntentReady');
    return (result ?? []).map((e) => _parseSharedPayload(e as Map)).toList();
  } catch (e) {
    _logger.warning('Could not read the pending share intents', e);
    return [];
  }
}

/// Registers [onShared] for shares arriving while the app is already running.
void setSharedFilesHandlerAndroid(Future<void> Function(SharedPayload) onShared) {
  _methodChannel.setMethodCallHandler((call) async {
    if (call.method != 'onSharedFiles') {
      _logger.warning('Unknown method call from MainActivity: ${call.method}');
      return null;
    }
    await onShared(_parseSharedPayload(call.arguments as Map));
    return null;
  });
}

SharedPayload _parseSharedPayload(Map payload) {
  return SharedPayload(
    files: (payload['files'] as List).map((e) => FileInfoMapper.fromJson((e as Map).cast<String, dynamic>())).toList(),
    text: payload['text'] as String?,
  );
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

/// A share intent carrying files, as content:// URIs so that nothing has to be copied.
@MappableClass()
class SharedPayload with SharedPayloadMappable {
  final List<FileInfo> files;

  /// Text sent alongside the files, e.g. the caption or link accompanying them.
  final String? text;

  SharedPayload({
    required this.files,
    required this.text,
  });
}

@MappableClass()
class FileInfo with FileInfoMappable {
  final String name;
  final int size;
  final String uri;

  /// RFC 3339 in UTC. Null when the document provider does not know it.
  final String? lastModified;

  FileInfo({
    required this.name,
    required this.size,
    required this.uri,
    required this.lastModified,
  });
}
