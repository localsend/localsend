import 'package:localsend_isolates/constants.dart';
import 'package:localsend_isolates/model/dto/multicast_dto.dart';
import 'package:localsend_isolates/rust/api/model.dart' show FileDto;
import 'package:localsend_isolates/rust/api/server.dart';
import 'package:localsend_isolates/src/isolate/child/main.dart';
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:localsend_isolates/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_isolates/src/task/server/http_server.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:typed_isolates/typed_isolates.dart';

sealed class BaseHttpServerTask {}

/// Starts the HTTP server.
/// The device information is derived from the sync state.
///
/// The server emits [HttpServerEvent]s on the stream of this task
/// until the server is stopped via [HttpServerStopTask].
class HttpServerStartTask implements BaseHttpServerTask {
  /// Optional PIN that senders must provide to start an upload session.
  final String? pin;

  /// Enables web send (download API) so web browsers can download the offered files.
  /// `null` disables web send.
  final WebSendParams? webSend;

  /// Enables the internal `show` endpoint, guarded by this token, that lets another
  /// application instance request this one to show itself. `null` disables it.
  final String? showToken;

  HttpServerStartTask({
    required this.pin,
    required this.webSend,
    required this.showToken,
  });
}

/// Stops the HTTP server.
class HttpServerStopTask implements BaseHttpServerTask {}

/// Answers a pending [HttpServerPrepareUploadEvent].
class HttpServerPrepareUploadDecisionTask implements BaseHttpServerTask {
  /// The file IDs to accept (a subset of the offered files).
  /// `null` declines the request.
  final List<String>? acceptedFileIds;

  HttpServerPrepareUploadDecisionTask({
    required this.acceptedFileIds,
  });
}

/// Answers a pending [HttpServerFileUploadEvent] with the target the file
/// should be saved to: either a file [path] or a writable [fileDescriptor] (Android).
///
/// The file is written by the Rust server itself.
/// A [HttpServerFileUploadResultEvent] is emitted on the stream of this task
/// once the file has been received completely (or failed).
class HttpServerFileUploadTargetTask implements BaseHttpServerTask {
  final String sessionId;
  final String fileId;
  final String? path;
  final int? fileDescriptor;

  HttpServerFileUploadTargetTask({
    required this.sessionId,
    required this.fileId,
    required this.path,
    required this.fileDescriptor,
  });
}

/// Answers a pending [HttpServerWebPrepareDownloadEvent].
class HttpServerPrepareDownloadDecisionTask implements BaseHttpServerTask {
  final String sessionId;

  /// `true` accepts the download request, `false` declines it.
  final bool accept;

  HttpServerPrepareDownloadDecisionTask({
    required this.sessionId,
    required this.accept,
  });
}

/// Answers a pending [HttpServerWebFileDownloadEvent] with the source the file
/// content should be read from: either a file [path] or a readable [fileDescriptor] (Android).
///
/// The file is read and streamed by the Rust server itself.
class HttpServerFileDownloadTargetTask implements BaseHttpServerTask {
  final String sessionId;
  final String fileId;
  final String? path;
  final int? fileDescriptor;

  HttpServerFileDownloadTargetTask({
    required this.sessionId,
    required this.fileId,
    required this.path,
    required this.fileDescriptor,
  });
}

/// A message sent from the server isolate to the main isolate.
sealed class HttpServerEvent {}

/// A device registered itself on this server.
class HttpServerRegisterEvent extends HttpServerEvent {
  final String ip;
  final RegisterDtoV2 info;

  HttpServerRegisterEvent({
    required this.ip,
    required this.info,
  });
}

/// A sender requests to upload files.
/// Must be answered with a [HttpServerPrepareUploadDecisionTask].
class HttpServerPrepareUploadEvent extends HttpServerEvent {
  final String ip;
  final RegisterDtoV2 info;
  final Map<String, FileDto> files;

  HttpServerPrepareUploadEvent({
    required this.ip,
    required this.info,
    required this.files,
  });
}

/// An accepted file is being uploaded.
/// Must be answered with a [HttpServerFileUploadTargetTask].
class HttpServerFileUploadEvent extends HttpServerEvent {
  final String sessionId;
  final String fileId;
  final FileDto file;

  HttpServerFileUploadEvent({
    required this.sessionId,
    required this.fileId,
    required this.file,
  });
}

/// The result of a [HttpServerFileUploadTargetTask].
class HttpServerFileUploadResultEvent extends HttpServerEvent {
  final String sessionId;
  final String fileId;

  /// `null` if the file has been saved successfully.
  final String? error;

  HttpServerFileUploadResultEvent({
    required this.sessionId,
    required this.fileId,
    required this.error,
  });
}

/// An upload session ended.
class HttpServerSessionEndEvent extends HttpServerEvent {
  final String sessionId;
  final SessionEndReasonV2 reason;

  HttpServerSessionEndEvent({
    required this.sessionId,
    required this.reason,
  });
}

/// A web client requests to download the shared files.
/// Must be answered with a [HttpServerPrepareDownloadDecisionTask].
class HttpServerWebPrepareDownloadEvent extends HttpServerEvent {
  final String ip;
  final String sessionId;
  final String? userAgent;

  HttpServerWebPrepareDownloadEvent({
    required this.ip,
    required this.sessionId,
    required this.userAgent,
  });
}

/// A web client downloads an offered file.
/// Must be answered with a [HttpServerFileDownloadTargetTask].
class HttpServerWebFileDownloadEvent extends HttpServerEvent {
  final String sessionId;
  final String fileId;
  final FileDto file;

  HttpServerWebFileDownloadEvent({
    required this.sessionId,
    required this.fileId,
    required this.file,
  });
}

/// Another application instance requested the running application to show itself.
class HttpServerShowEvent extends HttpServerEvent {
  /// Command-line arguments forwarded by the other application instance.
  final List<String> args;

  HttpServerShowEvent({
    required this.args,
  });
}

Future<void> setupHttpServerIsolate(
  Stream<SendToIsolateData<IsolateTask<BaseHttpServerTask>>> receiveFromMain,
  void Function(IsolateTaskStreamResult<HttpServerEvent>) sendToMain,
  InitialData initialData,
) async {
  await setupChildIsolateHelper(
    debugLabel: 'HttpServerIsolate',
    receiveFromMain: receiveFromMain,
    sendToMain: sendToMain,
    initialData: initialData,
    handler: (ref, task) async {
      switch (task.data) {
        case HttpServerStartTask startTask:
          final syncState = ref.read(syncProvider);
          final events = await ref
              .read(httpServerProvider)
              .start(
                port: syncState.port,
                tls: syncState.protocol == ProtocolType.https
                    ? TlsConfig(
                        cert: syncState.securityContext.certificate,
                        privateKey: syncState.securityContext.privateKey,
                      )
                    : null,
                alias: syncState.alias,
                version: protocolVersion,
                deviceModel: syncState.deviceInfo.deviceModel,
                deviceType: syncState.deviceInfo.deviceType.toRust(),
                fingerprint: syncState.securityContext.certificateHash,
                pin: startTask.pin,
                webSend: startTask.webSend,
                showToken: startTask.showToken,
              );

          try {
            await for (final event in events) {
              sendToMain(
                IsolateTaskStreamResult.event(
                  id: task.id,
                  data: switch (event) {
                    RsServerEvent_Register(:final ip, :final info) => HttpServerRegisterEvent(ip: ip, info: info),
                    RsServerEvent_PrepareUpload(:final ip, :final info, :final files) => HttpServerPrepareUploadEvent(
                      ip: ip,
                      info: info,
                      files: files,
                    ),
                    RsServerEvent_FileUpload(:final sessionId, :final fileId, :final file) => HttpServerFileUploadEvent(
                      sessionId: sessionId,
                      fileId: fileId,
                      file: file,
                    ),
                    RsServerEvent_SessionEnd(:final sessionId, :final reason) => HttpServerSessionEndEvent(
                      sessionId: sessionId,
                      reason: reason,
                    ),
                    RsServerEvent_WebPrepareDownload(:final ip, :final sessionId, :final userAgent) => HttpServerWebPrepareDownloadEvent(
                      ip: ip,
                      sessionId: sessionId,
                      userAgent: userAgent,
                    ),
                    RsServerEvent_WebFileDownload(:final sessionId, :final fileId, :final file) => HttpServerWebFileDownloadEvent(
                      sessionId: sessionId,
                      fileId: fileId,
                      file: file,
                    ),
                    RsServerEvent_Show(:final args) => HttpServerShowEvent(args: args),
                  },
                ),
              );
            }
          } finally {
            sendToMain(
              IsolateTaskStreamResult.done(
                id: task.id,
              ),
            );
          }
          return;
        case HttpServerStopTask _:
          await ref.read(httpServerProvider).stop();
          return;
        case HttpServerPrepareUploadDecisionTask decisionTask:
          await ref.read(httpServerProvider).respondPrepareUpload(acceptedFileIds: decisionTask.acceptedFileIds);
          return;
        case HttpServerFileUploadTargetTask targetTask:
          String? error;
          try {
            await ref
                .read(httpServerProvider)
                .respondFileUpload(
                  sessionId: targetTask.sessionId,
                  fileId: targetTask.fileId,
                  path: targetTask.path,
                  fileDescriptor: targetTask.fileDescriptor,
                );
          } catch (e) {
            error = e.humanErrorMessage;
          }

          sendToMain(
            IsolateTaskStreamResult.event(
              id: task.id,
              data: HttpServerFileUploadResultEvent(
                sessionId: targetTask.sessionId,
                fileId: targetTask.fileId,
                error: error,
              ),
            ),
          );
          sendToMain(
            IsolateTaskStreamResult.done(
              id: task.id,
            ),
          );
          return;
        case HttpServerPrepareDownloadDecisionTask decisionTask:
          await ref
              .read(httpServerProvider)
              .respondPrepareDownload(
                sessionId: decisionTask.sessionId,
                accept: decisionTask.accept,
              );
          return;
        case HttpServerFileDownloadTargetTask targetTask:
          await ref
              .read(httpServerProvider)
              .respondFileDownload(
                sessionId: targetTask.sessionId,
                fileId: targetTask.fileId,
                path: targetTask.path,
                fileDescriptor: targetTask.fileDescriptor,
              );
          return;
      }
    },
  );
}
