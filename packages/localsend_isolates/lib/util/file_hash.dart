import 'dart:typed_data';

import 'package:localsend_isolates/rust/api/cancel.dart';
import 'package:localsend_isolates/rust/api/crypto.dart' as rust_crypto;
import 'package:localsend_isolates/util/android_channel.dart';

/// Calculates the SHA-256 checksum (lowercase hex) of a single file.
///
/// The file is read and hashed in Rust, so this only occupies the Dart isolate
/// while waiting for the result.
/// [onProgress] is called with the cumulative number of bytes hashed so far;
/// the events are already throttled on the Rust side.
/// Cancelling [cancelToken] aborts the calculation and throws.
Future<String> calculateFileHash({
  required String? path,
  required List<int>? bytes,
  required RsCancellationToken cancelToken,
  void Function(int bytes)? onProgress,
}) async {
  final Stream<rust_crypto.RsHashFileEvent> events;
  if (path != null) {
    if (path.startsWith('content://')) {
      // Android SAF files can only be read through a file descriptor.
      // The descriptor is closed by Rust after the file has been read.
      final fileDescriptor = await getFileDescriptorAndroid(uri: path);
      events = rust_crypto.hashFile(fileDescriptor: fileDescriptor, cancelToken: cancelToken);
    } else {
      events = rust_crypto.hashFile(path: path, cancelToken: cancelToken);
    }
  } else if (bytes != null) {
    events = rust_crypto.hashFile(
      bytes: bytes is Uint8List ? bytes : Uint8List.fromList(bytes),
      cancelToken: cancelToken,
    );
  } else {
    throw ArgumentError('Either path or bytes must be provided');
  }

  await for (final event in events) {
    switch (event) {
      case rust_crypto.RsHashFileEvent_Progress():
        onProgress?.call(event.bytes.toInt());
      case rust_crypto.RsHashFileEvent_Done():
        return event.hash;
    }
  }

  // The Done event is always the last event, so this is unreachable unless
  // the Rust side failed, in which case the loop above has already thrown.
  throw StateError('Hashing ended without a result');
}
