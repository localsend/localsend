import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

part 'android_channel.mapper.dart';

const _methodChannel = MethodChannel('org.localsend.localsend_app/localsend');
const _appClipEventChannel = EventChannel('org.localsend.localsend_app/localsend/app-clip-events');
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

/// Tells MainActivity that the Dart side is now subscribed to the share_handler media stream,
/// so share intents that were held back during app start can be replayed.
Future<void> flushPendingShareIntentsAndroid() async {
  try {
    await _methodChannel.invokeMethod('shareIntentReady');
  } catch (e) {
    _logger.warning('Could not flush pending share intents', e);
  }
}

Future<void> openGallery() async {
  _logger.info('Opening gallery');
  await _methodChannel.invokeMethod('openGallery');
}

/// Redacted native lifecycle state for the Android-hosted iOS App Clip session.
Stream<AppClipHostState> watchAppClipHostStateAndroid() {
  return _appClipEventChannel.receiveBroadcastStream().map((event) => AppClipHostState.fromMap((event as Map).cast<Object?, Object?>()));
}

Future<AppClipHostPrerequisites> getAppClipHostPrerequisitesAndroid() async {
  final value = await _methodChannel.invokeMethod<Map>('getAppClipHostPrerequisites');
  return AppClipHostPrerequisites.fromMap((value ?? const {}).cast<Object?, Object?>());
}

Future<AppClipHostState> getAppClipHostStateAndroid() async {
  final value = await _methodChannel.invokeMethod<Map>('getAppClipHostState');
  return AppClipHostState.fromMap((value ?? const {}).cast<Object?, Object?>());
}

Future<AppClipHostState> startAppClipHostAndroid(String deviceName) async {
  final value = await _methodChannel.invokeMethod<Map>('startAppClipHost', {'deviceName': deviceName});
  return AppClipHostState.fromMap((value ?? const {}).cast<Object?, Object?>());
}

Future<String?> getAppClipInvocationUrlAndroid() => _methodChannel.invokeMethod<String>('getAppClipInvocationUrl');

Future<AppClipBootstrap?> getAppClipBootstrapAndroid() async {
  final value = await _methodChannel.invokeMethod<Map>('getAppClipBootstrap');
  return value == null ? null : AppClipBootstrap.fromMap(value.cast<Object?, Object?>());
}

Future<bool> acknowledgeAppClipBootstrapAndroid(String sessionId) async {
  return await _methodChannel.invokeMethod<bool>('acknowledgeAppClipBootstrap', {'sessionId': sessionId}) ?? false;
}

Future<void> stopAppClipHostAndroid() => _methodChannel.invokeMethod<void>('stopAppClipHost');

class AppClipHostPrerequisites {
  final bool available;
  final bool hceAvailable;
  final List<String> missing;

  const AppClipHostPrerequisites({required this.available, required this.hceAvailable, required this.missing});

  factory AppClipHostPrerequisites.fromMap(Map<Object?, Object?> value) {
    return AppClipHostPrerequisites(
      available: value['available'] == true,
      hceAvailable: value['hceAvailable'] == true,
      missing: (value['missing'] as List?)?.whereType<String>().toList(growable: false) ?? const [],
    );
  }
}

class AppClipHostState {
  final String state;
  final String? message;
  final bool hceAvailable;
  final String? sessionId;

  const AppClipHostState({required this.state, this.message, required this.hceAvailable, this.sessionId});

  factory AppClipHostState.fromMap(Map<Object?, Object?> value) {
    return AppClipHostState(
      state: value['state'] as String? ?? 'failed',
      message: value['message'] as String?,
      hceAvailable: value['hceAvailable'] == true,
      sessionId: value['sessionId'] as String?,
    );
  }
}

class AppClipBootstrap {
  final String sessionId;
  final String peerIp;
  final int peerPort;
  final String downloadToken;

  const AppClipBootstrap({required this.sessionId, required this.peerIp, required this.peerPort, required this.downloadToken});

  factory AppClipBootstrap.fromMap(Map<Object?, Object?> value) {
    return AppClipBootstrap(
      sessionId: value['sessionId'] as String,
      peerIp: value['peerIp'] as String,
      peerPort: value['peerPort'] as int,
      downloadToken: value['downloadToken'] as String,
    );
  }
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

  /// RFC 3339 in UTC. Null when the document provider does not know it.
  final String? lastModified;

  FileInfo({
    required this.name,
    required this.size,
    required this.uri,
    required this.lastModified,
  });
}
