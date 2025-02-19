import 'package:common/api_route_builder.dart';
import 'package:common/model/device.dart';
import 'package:common/src/isolate/child/http_provider.dart';
import 'package:refena/refena.dart';

final httpUploadProvider = ViewProvider((ref) {
  final client = ref.watch(httpProvider).longLiving;
  return HttpUploadService(client);
});

class HttpUploadService {
  final CustomHttpClient _client;

  HttpUploadService(this._client);

  Future<void> upload({
    required Stream<List<int>> stream,
    required int contentLength,
    required String contentType,
    required Device target,
    required String? remoteSessionId,
    required String fileId,
    required String token,
    required void Function(double) onSendProgress,
    required CustomCancelToken cancelToken,
  }) async {
    await _client.postStream(
      uri: ApiRoute.upload.target(target),
      query: {
        if (remoteSessionId != null) 'sessionId': remoteSessionId,
        'fileId': fileId,
        'token': token,
      },
      headers: {
        'Content-Length': contentLength.toString(),
        'Content-Type': contentType,
      },
      stream: stream,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );
  }
}
