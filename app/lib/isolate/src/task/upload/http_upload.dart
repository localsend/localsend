import 'package:localsend_app/isolate/model/device.dart';
import 'package:localsend_app/isolate/src/isolate/child/http_provider.dart';
import 'package:localsend_app/rust/api/http.dart';
import 'package:localsend_app/rust/api/stream.dart';
import 'package:localsend_app/util/rust.dart';
import 'package:refena_flutter/refena_flutter.dart';

final httpUploadProvider = ViewProvider((ref) {
  final client = ref.watch(httpProvider).longLiving;
  return HttpUploadService(client);
});

class HttpUploadService {
  final RsHttpClient _client;

  HttpUploadService(this._client);

  Future<void> upload({
    required Stream<List<int>> stream,
    required int contentLength,
    required Device target,
    required String? remoteSessionId,
    required String fileId,
    required String token,
    required void Function(double progress) onSendProgress,
    required RsCancellationToken cancelToken,
  }) async {
    final (sink, receiver) = await createStream();

    final uploadFuture = _client.upload(
      protocol: target.getProtocolType(),
      ip: target.ip!,
      port: target.port,
      publicKey: null,
      sessionId: remoteSessionId ?? '',
      fileId: fileId,
      token: token,
      binary: receiver,
      cancelToken: cancelToken,
    );

    try {
      int sent = 0;
      await for (final chunk in stream) {
        try {
          await sink.add(data: chunk);
        } catch (_) {
          // The Rust side dropped the receiver, i.e. the upload request already
          // ended (e.g. rejected by the receiver or cancelled).
          // The actual error is thrown here:
          await uploadFuture;
          rethrow;
        }
        sent += chunk.length;
        onSendProgress(sent / contentLength);
      }
      sink.close();
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
