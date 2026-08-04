import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/cancel.dart';
import 'package:localsend_isolates/rust/api/http.dart';
import 'package:localsend_isolates/rust/api/stream.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:refena_flutter/refena_flutter.dart';

final httpUploadProvider = ViewProvider((ref) => HttpUploadService());

class HttpUploadService {
  const HttpUploadService();

  /// Uploads a single file.
  ///
  /// [client] must be pinned to [target] so the file content is not streamed
  /// to a peer other than the one the session was negotiated with. It is
  /// passed in rather than resolved here so that all files of one task share
  /// a connection.
  Future<void> upload({
    required RsHttpClient client,
    required Stream<List<int>>? stream,
    required String? path,
    required int? fileDescriptor,
    required int contentLength,
    required Device target,
    required String? remoteSessionId,
    required String fileId,
    required String token,
    required void Function(double progress) onSendProgress,
    required RsCancellationToken cancelToken,
  }) async {
    final (sink, receiver) = stream != null ? await createStream() : (null, null);

    final uploadFuture = client
        .upload(
          protocol: target.getProtocolType(),
          ip: target.ip!,
          port: target.port,
          // The peer is already verified during the TLS handshake by the
          // fingerprint [client] is pinned to.
          publicKey: null,
          sessionId: remoteSessionId ?? '',
          fileId: fileId,
          token: token,
          binary: receiver,
          path: path,
          fileDescriptor: fileDescriptor,
          contentLength: BigInt.from(contentLength),
          cancelToken: cancelToken,
        )
        .forEach((event) {
          switch (event) {
            case RsUploadEvent_Progress(:final progress):
              onSendProgress(progress);
            case RsUploadEvent_Failed(:final error):
              // Fails [uploadFuture] with the typed client error.
              throw error;
          }
        });

    try {
      await for (final chunk in stream ?? const Stream<List<int>>.empty()) {
        try {
          await sink!.add(data: chunk);
        } catch (_) {
          // The Rust side dropped the receiver, i.e. the upload request already
          // ended (e.g. rejected by the receiver or cancelled).
          // The actual error is thrown here:
          await uploadFuture;
          rethrow;
        }
      }
      sink?.close();
    } catch (e) {
      // The source stream failed, so the upload request must be aborted.
      // [e] is the root cause, thus the error of the upload request is swallowed.
      cancelToken.cancel();
      try {
        await uploadFuture;
      } catch (_) {}
      rethrow;
    }

    await uploadFuture;
  }
}
