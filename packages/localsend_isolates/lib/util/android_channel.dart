import 'package:flutter/services.dart';

const _methodChannel = MethodChannel('org.localsend.localsend_app/localsend');

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
