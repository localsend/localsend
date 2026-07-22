import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/http.dart';
import 'package:localsend_isolates/rust/api/stream.dart';
import 'package:localsend_isolates/src/isolate/child/http_provider.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:refena_flutter/refena_flutter.dart';

final httpUploadProvider = ViewProvider((ref) {
  final client = ref.watch(httpProvider).longLiving;
  return HttpUploadService(client);
});

class HttpUploadService {
  final RsHttpClient _client;

  HttpUploadService(this._client);

  Future<void> upload({
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

    final uploadFuture = _client
        .upload(
          protocol: target.getProtocolType(),
          ip: target.ip!,
          port: target.port,
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
        .forEach(onSendProgress);

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
