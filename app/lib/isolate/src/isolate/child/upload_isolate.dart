import 'dart:io';
import 'dart:typed_data';

import 'package:localsend_app/isolate/isolate.dart';
import 'package:localsend_app/isolate/model/device.dart';
import 'package:localsend_app/isolate/src/isolate/child/main.dart';
import 'package:localsend_app/isolate/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_app/isolate/src/task/upload/http_upload.dart';
import 'package:localsend_app/isolate/util/stream.dart';
import 'package:localsend_app/rust/api/http.dart';
import 'package:localsend_app/util/rust.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:typed_isolates/typed_isolates.dart';

sealed class BaseHttpUploadTask {}

class HttpUploadSetContentStreamResolverTask implements BaseHttpUploadTask {
  final UriContentStreamResolver resolver;

  HttpUploadSetContentStreamResolverTask({
    required this.resolver,
  });
}

class HttpUploadTask implements BaseHttpUploadTask {
  final String? remoteSessionId;
  final String remoteFileToken;
  final String fileId;
  final String? filePath;
  final List<int>? fileBytes;
  final int fileSize;
  final Device device;

  HttpUploadTask({
    required this.remoteSessionId,
    required this.remoteFileToken,
    required this.fileId,
    required this.filePath,
    required this.fileBytes,
    required this.fileSize,
    required this.device,
  });
}

class HttpUploadCancelTask implements BaseHttpUploadTask {
  final int taskId;

  HttpUploadCancelTask({required this.taskId});
}

/// Map of cancel tokens for each task.
/// Task ID -> CancelToken
final _cancelTokenProvider = Provider((ref) => <int, RsCancellationToken>{});

abstract class UriContentStreamResolver {
  /// Separate initialization method to create instance in the child isolate.
  /// Cannot reference the RootIsolateToken class because it is not part of Dart.
  void init({required Object? rootIsolateToken});

  /// Resolves the content stream for the given URI.
  Stream<Uint8List> resolve(Uri uri);
}

UriContentStreamResolver? _uriContentStreamResolver;

Future<void> setupHttpUploadIsolate(
  Stream<SendToIsolateData<IsolateTask<BaseHttpUploadTask>>> receiveFromMain,
  void Function(IsolateTaskStreamResult<double>) sendToMain,
  InitialData initialData,
) async {
  await setupChildIsolateHelper(
    debugLabel: 'HttpUploadIsolate',
    receiveFromMain: receiveFromMain,
    sendToMain: sendToMain,
    initialData: initialData,
    handler: (ref, task) async {
      final HttpUploadTask uploadTask;
      switch (task.data) {
        case HttpUploadSetContentStreamResolverTask task:
          final rootIsolateToken = ref.read(syncProvider).rootIsolateToken;
          task.resolver.init(
            rootIsolateToken: rootIsolateToken,
          );
          _uriContentStreamResolver = task.resolver;
          return;
        case HttpUploadTask task:
          uploadTask = task;
          break;
        case HttpUploadCancelTask task:
          final cancelToken = ref.read(_cancelTokenProvider)[task.taskId];
          cancelToken?.cancel();
          ref.read(_cancelTokenProvider).remove(task.taskId);
          return;
      }

      final Stream<List<int>>? fileStream = uploadTask.filePath != null
          ? _uriContentStreamResolver != null && uploadTask.filePath!.startsWith('content://')
                ? _uriContentStreamResolver!.resolve(Uri.parse(uploadTask.filePath!))
                : File(uploadTask.filePath!).openRead()
          : null;

      final (streamController, subscription) = fileStream?.digested() ?? (null, null);

      try {
        final cancelToken = createCancellationToken();
        ref.read(_cancelTokenProvider).putIfAbsent(task.id, () => cancelToken);

        await ref
            .read(httpUploadProvider)
            .upload(
              stream: streamController?.stream ?? Stream.fromIterable([uploadTask.fileBytes!]),
              contentLength: uploadTask.fileSize,
              target: uploadTask.device,
              remoteSessionId: uploadTask.remoteSessionId,
              fileId: uploadTask.fileId,
              token: uploadTask.remoteFileToken,
              onSendProgress: (progress) {
                sendToMain(
                  IsolateTaskStreamResult.event(
                    id: task.id,
                    data: progress,
                  ),
                );
              },
              cancelToken: cancelToken,
            );

        sendToMain(
          IsolateTaskStreamResult.done(
            id: task.id,
          ),
        );
      } catch (e) {
        sendToMain(
          IsolateTaskStreamResult.error(
            id: task.id,
            error: e.humanErrorMessage,
          ),
        );
      } finally {
        // Close the stream if it is still open
        // ignore: unawaited_futures
        streamController?.close();

        // Cancel the subscription if it is still open
        // ignore: unawaited_futures
        subscription?.cancel();
      }
    },
  );
}
