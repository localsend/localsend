import 'package:flutter/services.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/http.dart';
import 'package:localsend_isolates/src/isolate/child/main.dart';
import 'package:localsend_isolates/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_isolates/src/task/upload/http_upload.dart';
import 'package:localsend_isolates/util/android_channel.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:typed_isolates/typed_isolates.dart';

sealed class BaseHttpUploadTask {}

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

/// A message sent from the upload isolate to the main isolate
/// reporting the state of a single file of a [HttpUploadFilesTask].
sealed class HttpUploadEvent {
  final String fileId;

  HttpUploadEvent({required this.fileId});
}

/// The upload of the file has started.
class HttpUploadFileStartedEvent extends HttpUploadEvent {
  HttpUploadFileStartedEvent({required super.fileId});
}

/// The upload progress of the file in the range [0, 1].
class HttpUploadFileProgressEvent extends HttpUploadEvent {
  final double progress;

  HttpUploadFileProgressEvent({
    required super.fileId,
    required this.progress,
  });
}

/// The file has been uploaded successfully.
class HttpUploadFileFinishedEvent extends HttpUploadEvent {
  HttpUploadFileFinishedEvent({required super.fileId});
}

/// The upload of the file has failed. The next file is still uploaded.
class HttpUploadFileFailedEvent extends HttpUploadEvent {
  final String error;

  HttpUploadFileFailedEvent({
    required super.fileId,
    required this.error,
  });
}

/// Map of cancel tokens for each task.
/// Task ID -> CancelToken
final _cancelTokenProvider = Provider((ref) => <int, RsCancellationToken>{});

Future<void> setupHttpUploadIsolate(
  Stream<SendToIsolateData<IsolateTask<BaseHttpUploadTask>>> receiveFromMain,
  void Function(IsolateTaskStreamResult<HttpUploadEvent>) sendToMain,
  InitialData initialData,
) async {
  await setupChildIsolateHelper(
    debugLabel: 'HttpUploadIsolate',
    receiveFromMain: receiveFromMain,
    sendToMain: sendToMain,
    initialData: initialData,
    init: (ref) async {
      // Initialize the platform method channel so getFileDescriptorAndroid
      // (used to resolve "content://" files) works inside this isolate.
      BackgroundIsolateBinaryMessenger.ensureInitialized(
        ref.read(syncProvider).rootIsolateToken as RootIsolateToken,
      );
    },
    handler: (ref, task) async {
      final HttpUploadFilesTask uploadTask;
      switch (task.data) {
        case HttpUploadFilesTask task:
          uploadTask = task;
          break;
        case HttpUploadCancelTask task:
          final cancelToken = ref.read(_cancelTokenProvider)[task.taskId];
          cancelToken?.cancel();
          ref.read(_cancelTokenProvider).remove(task.taskId);
          return;
      }

      final cancelToken = createCancellationToken();
      ref.read(_cancelTokenProvider).putIfAbsent(task.id, () => cancelToken);
      try {
        for (final file in uploadTask.files) {
          sendToMain(
            IsolateTaskStreamResult.event(
              id: task.id,
              data: HttpUploadFileStartedEvent(fileId: file.fileId),
            ),
          );

          try {
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
                  target: uploadTask.device,
                  remoteSessionId: uploadTask.remoteSessionId,
                  fileId: file.fileId,
                  token: file.remoteFileToken,
                  onSendProgress: (progress) {
                    sendToMain(
                      IsolateTaskStreamResult.event(
                        id: task.id,
                        data: HttpUploadFileProgressEvent(
                          fileId: file.fileId,
                          progress: progress,
                        ),
                      ),
                    );
                  },
                  cancelToken: cancelToken,
                );

            sendToMain(
              IsolateTaskStreamResult.event(
                id: task.id,
                data: HttpUploadFileFinishedEvent(fileId: file.fileId),
              ),
            );
          } catch (e) {
            sendToMain(
              IsolateTaskStreamResult.event(
                id: task.id,
                data: HttpUploadFileFailedEvent(
                  fileId: file.fileId,
                  error: e.humanErrorMessage,
                ),
              ),
            );
          }

          if (!ref.read(_cancelTokenProvider).containsKey(task.id)) {
            // the task was canceled, do not upload the remaining files
            break;
          }
        }

        sendToMain(
          IsolateTaskStreamResult.done(
            id: task.id,
          ),
        );
      } finally {
        ref.read(_cancelTokenProvider).remove(task.id);
      }
    },
  );
}
