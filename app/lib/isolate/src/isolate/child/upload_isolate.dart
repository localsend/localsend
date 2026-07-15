import 'dart:typed_data';

import 'package:localsend_app/isolate/isolate.dart';
import 'package:localsend_app/isolate/model/device.dart';
import 'package:localsend_app/isolate/src/isolate/child/main.dart';
import 'package:localsend_app/isolate/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_app/isolate/src/task/upload/http_upload.dart';
import 'package:localsend_app/rust/api/http.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart';
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

class HttpUploadFile {
  final String remoteFileToken;
  final String fileId;
  final String? filePath;
  final List<int>? fileBytes;
  final int fileSize;

  HttpUploadFile({
    required this.remoteFileToken,
    required this.fileId,
    required this.filePath,
    required this.fileBytes,
    required this.fileSize,
  });
}

/// Uploads a list of files as one isolate task.
///
/// This task is intended to replace the file scheduling loop in the parent
/// isolate. Files are uploaded sequentially and progress is reported across
/// the complete list.
class HttpUploadFilesTask implements BaseHttpUploadTask {
  final String? remoteSessionId;
  final List<HttpUploadFile> files;
  final Device device;

  HttpUploadFilesTask({
    required this.remoteSessionId,
    required this.files,
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
      final String? remoteSessionId;
      final List<HttpUploadFile> files;
      final Device device;
      switch (task.data) {
        case HttpUploadSetContentStreamResolverTask task:
          final rootIsolateToken = ref.read(syncProvider).rootIsolateToken;
          task.resolver.init(
            rootIsolateToken: rootIsolateToken,
          );
          return;
        case HttpUploadTask task:
          remoteSessionId = task.remoteSessionId;
          files = [
            HttpUploadFile(
              remoteFileToken: task.remoteFileToken,
              fileId: task.fileId,
              filePath: task.filePath,
              fileBytes: task.fileBytes,
              fileSize: task.fileSize,
            ),
          ];
          device = task.device;
          break;
        case HttpUploadFilesTask task:
          remoteSessionId = task.remoteSessionId;
          files = task.files;
          device = task.device;
          break;
        case HttpUploadCancelTask task:
          final cancelToken = ref.read(_cancelTokenProvider)[task.taskId];
          cancelToken?.cancel();
          ref.read(_cancelTokenProvider).remove(task.taskId);
          return;
      }

      try {
        final cancelToken = createCancellationToken();
        ref.read(_cancelTokenProvider).putIfAbsent(task.id, () => cancelToken);
        final totalSize = files.fold<int>(0, (sum, file) => sum + file.fileSize);
        var completedSize = 0;

        for (final file in files) {
          final filePath = file.filePath;
          final isContentUri = filePath?.startsWith('content://') ?? false;
          final fileDescriptor = isContentUri ? await getFileDescriptorAndroid(uri: filePath!) : null;

          await ref
              .read(httpUploadProvider)
              .upload(
                stream: filePath == null && file.fileBytes != null ? Stream.value(file.fileBytes!) : null,
                path: !isContentUri ? filePath : null,
                fileDescriptor: fileDescriptor,
                contentLength: file.fileSize,
                target: device,
                remoteSessionId: remoteSessionId,
                fileId: file.fileId,
                token: file.remoteFileToken,
                onSendProgress: (progress) {
                  final totalProgress = totalSize == 0 ? 1.0 : (completedSize + progress * file.fileSize) / totalSize;
                  sendToMain(
                    IsolateTaskStreamResult.event(
                      id: task.id,
                      data: totalProgress,
                    ),
                  );
                },
                cancelToken: cancelToken,
              );

          completedSize += file.fileSize;
        }

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
        ref.read(_cancelTokenProvider).remove(task.id);
      }
    },
  );
}
