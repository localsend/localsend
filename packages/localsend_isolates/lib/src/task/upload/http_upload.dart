import 'package:localsend_isolates/model/content_source.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/cancel.dart';
import 'package:localsend_isolates/rust/api/http.dart';
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
    required ContentSource source,
    required int contentLength,
    required Device target,
    required String? remoteSessionId,
    required String fileId,
    required String token,
    required void Function(double progress) onSendProgress,
    required RsCancellationToken cancelToken,
  }) async {
    await ContentSource.fromStream(source.openRead).transfer<void>(
      (resolved) => client
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
            source: resolved,
            contentLength: BigInt.from(contentLength),
            cancelToken: cancelToken,
          )
          .forEach((event) {
            switch (event) {
              case RsUploadEvent_Progress(:final progress):
                onSendProgress(progress);
              case RsUploadEvent_Failed(:final error):
                // Fails the upload with the typed client error.
                throw error;
            }
          }),
      cancelToken: cancelToken,
      contentLength: contentLength,
    );
  }
}
