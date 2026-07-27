import 'dart:typed_data';

import 'package:localsend_isolates/rust/api/cancel.dart';
import 'package:localsend_isolates/rust/api/crypto.dart' as rust_crypto;
import 'package:localsend_isolates/util/android_channel.dart';

/// Calculates the SHA-256 checksum (lowercase hex) of a single file.
///
/// The file is read and hashed in Rust, so this only occupies the Dart isolate
/// while waiting for the result.
/// Cancelling [cancelToken] aborts the calculation and throws.
Future<String> calculateFileHash({
  required String? path,
  required List<int>? bytes,
  required RsCancellationToken cancelToken,
}) async {
  if (path != null) {
    if (path.startsWith('content://')) {
      // Android SAF files can only be read through a file descriptor.
      // The descriptor is closed by Rust after the file has been read.
      final fileDescriptor = await getFileDescriptorAndroid(uri: path);
      return await rust_crypto.hashFile(fileDescriptor: fileDescriptor, cancelToken: cancelToken);
    }
    return await rust_crypto.hashFile(path: path, cancelToken: cancelToken);
  }

  if (bytes != null) {
    return await rust_crypto.hashFile(
      bytes: bytes is Uint8List ? bytes : Uint8List.fromList(bytes),
      cancelToken: cancelToken,
    );
  }

  throw ArgumentError('Either path or bytes must be provided');
}
