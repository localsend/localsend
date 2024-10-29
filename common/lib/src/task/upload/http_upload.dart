import 'package:common/api_route_builder.dart';
import 'package:common/model/device.dart';
import 'package:common/src/isolate/child/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:refena/refena.dart';

final httpUploadProvider = ViewProvider((ref) {
  final dio = ref.watch(dioProvider).discovery;
  return HttpUploadService(dio);
});

class HttpUploadService {
  final Dio _dio;

  HttpUploadService(this._dio);

  /*
  await dio.post(
        ApiRoute.upload.target(target, query: {
          if (remoteSessionId != null) 'sessionId': remoteSessionId,
          'fileId': file.file.id,
          'token': token,
        }),
        options: Options(
          headers: {
            'Content-Length': file.file.size,
            'Content-Type': file.file.lookupMime(),
          },
        ),
        data: streamController?.stream ?? file.bytes!,
        onSendProgress: (curr, total) {
          if (stopwatch.elapsedMilliseconds >= 100) {
            stopwatch.reset();
            ref.notifier(progressProvider).setProgress(
                  sessionId: sessionId,
                  fileId: file.file.id,
                  progress: curr / total,
                );
          }
        },
        cancelToken: cancelToken,
      );
   */

  Future<void> upload({
    required Stream<int> stream,
    required int contentLength,
    required String contentType,
    required Device target,
    required String? remoteSessionId,
    required String fileId,
    required String token,
    required void Function(double) onSendProgress,
    required CancelToken cancelToken,
  }) async {
    final stopwatch = Stopwatch()..start();
    await _dio.post(
      ApiRoute.upload.target(target, query: {
        if (remoteSessionId != null) 'sessionId': remoteSessionId,
        'fileId': fileId,
        'token': token,
      }),
      options: Options(
        headers: {
          'Content-Length': contentLength,
          'Content-Type': contentType,
        },
      ),
      data: stream,
      onSendProgress: (curr, total) {
        if (stopwatch.elapsedMilliseconds >= 100) {
          stopwatch.reset();
          onSendProgress(curr / total);
        }
      },
      cancelToken: cancelToken,
    );
  }
}
