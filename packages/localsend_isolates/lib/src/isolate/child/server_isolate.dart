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
/// The stream of this task completes once the server has released the port.
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
/// [HttpServerFileUploadProgressEvent]s are emitted on the stream of this task
/// while the file is being received, followed by a final
/// [HttpServerFileUploadResultEvent] once the file has been received
/// completely (or failed).
class HttpServerFileUploadTargetTask implements BaseHttpServerTask {
  final String sessionId;
  final String fileId;
  final String? path;
  final int? fileDescriptor;

  /// The expected file size in bytes, used to compute the progress.
  final int fileSize;

  HttpServerFileUploadTargetTask({
    required this.sessionId,
    required this.fileId,
    required this.path,
    required this.fileDescriptor,
    required this.fileSize,
  });
}

/// Rejects a pending [HttpServerFileUploadEvent], e.g. because preparing the
/// save target for the file failed. The upload request fails with an error
/// response and the file is marked as failed; the session itself continues.
/// Does nothing if the upload was already answered with a
/// [HttpServerFileUploadTargetTask].
class HttpServerRejectFileUploadTask implements BaseHttpServerTask {
  final String sessionId;
  final String fileId;

  HttpServerRejectFileUploadTask({
    required this.sessionId,
    required this.fileId,
  });
}

/// Cancels the active upload session, e.g. because the user aborted the
/// transfer on the receiving side. Uploads that are already in progress still
/// run to completion, but new upload requests are rejected and a new session
/// can be created. No [HttpServerSessionEndEvent] is emitted.
class HttpServerCancelSessionTask implements BaseHttpServerTask {
  final String sessionId;

  HttpServerCancelSessionTask({
    required this.sessionId,
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

/// Rejects a pending [HttpServerWebFileDownloadEvent], e.g. because no source
/// for the file content could be resolved. The download request fails with an
/// error response. Does nothing if the download was already answered with a
/// [HttpServerFileDownloadTargetTask].
class HttpServerRejectFileDownloadTask implements BaseHttpServerTask {
  final String sessionId;
  final String fileId;

  HttpServerRejectFileDownloadTask({
    required this.sessionId,
    required this.fileId,
  });
}

/// A message sent from the server isolate to the main isolate.
sealed class HttpServerEvent {}

/// The server has been started and is listening.
/// Always the first event emitted by a [HttpServerStartTask].
class HttpServerStartedEvent extends HttpServerEvent {}

/// A device registered itself on this server.
///
/// On TLS, this event is only emitted when [RegisterDtoV2.fingerprint] matches
/// the fingerprint of the client certificate verified during the mTLS
/// handshake, so the fingerprint cannot be spoofed.
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
  /// The session ID the upload session will have when the request is accepted.
  final String sessionId;
  final String ip;
  final RegisterDtoV2 info;

  /// The SHA-256 fingerprint (uppercase hex) of the sender's client
  /// certificate verified during the mTLS handshake. Unlike
  /// [RegisterDtoV2.fingerprint], this value cannot be spoofed.
  /// `null` when the server runs without TLS.
  final String? certFingerprint;

  final Map<String, FileDto> files;

  HttpServerPrepareUploadEvent({
    required this.sessionId,
    required this.ip,
    required this.info,
    required this.certFingerprint,
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

/// The progress of a [HttpServerFileUploadTargetTask] as a fraction (0.0 to 1.0).
class HttpServerFileUploadProgressEvent extends HttpServerEvent {
  final String sessionId;
  final String fileId;
  final double progress;

  HttpServerFileUploadProgressEvent({
    required this.sessionId,
    required this.fileId,
    required this.progress,
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

/// A prepare-upload request was aborted before a session was created,
/// e.g. the sender disconnected while the application was still deciding.
/// The [HttpServerPrepareUploadEvent] with the same [sessionId]
/// no longer needs to be answered.
class HttpServerPrepareUploadAbortedEvent extends HttpServerEvent {
  final String sessionId;

  HttpServerPrepareUploadAbortedEvent({required this.sessionId});
}

/// The remote device cancels a transfer this application is currently
/// *sending* to it. [sessionId] is the session ID issued by the remote device
/// during prepare-upload. The application must verify that [ip] matches the
/// target of the send session before cancelling it.
class HttpServerCancelReceivedEvent extends HttpServerEvent {
  final String ip;
  final String sessionId;

  HttpServerCancelReceivedEvent({
    required this.ip,
    required this.sessionId,
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
          final Stream<RsServerEvent> events;
          try {
            events = await ref
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
          } catch (e) {
            // Starting failed (e.g. the port is already in use).
            // The error must be sendable across the isolate boundary.
            sendToMain(
              IsolateTaskStreamResult.error(
                id: task.id,
                error: e.humanErrorMessage,
              ),
            );
            return;
          }

          sendToMain(
            IsolateTaskStreamResult.event(
              id: task.id,
              data: HttpServerStartedEvent(),
            ),
          );

          try {
            await for (final event in events) {
              sendToMain(
                IsolateTaskStreamResult.event(
                  id: task.id,
                  data: switch (event) {
                    RsServerEvent_Register(:final ip, :final info) => HttpServerRegisterEvent(ip: ip, info: info),
                    RsServerEvent_PrepareUpload(:final sessionId, :final ip, :final info, :final certFingerprint, :final files) =>
                      HttpServerPrepareUploadEvent(
                        sessionId: sessionId,
                        ip: ip,
                        info: info,
                        certFingerprint: certFingerprint,
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
                    RsServerEvent_PrepareUploadAborted(:final sessionId) => HttpServerPrepareUploadAbortedEvent(
                      sessionId: sessionId,
                    ),
                    RsServerEvent_CancelReceived(:final ip, :final sessionId) => HttpServerCancelReceivedEvent(
                      ip: ip,
                      sessionId: sessionId,
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
          sendToMain(
            IsolateTaskStreamResult.done(
              id: task.id,
            ),
          );
          return;
        case HttpServerPrepareUploadDecisionTask decisionTask:
          await ref.read(httpServerProvider).respondPrepareUpload(acceptedFileIds: decisionTask.acceptedFileIds);
          return;
        case HttpServerFileUploadTargetTask targetTask:
          String? error;
          try {
            final progressStream = ref
                .read(httpServerProvider)
                .respondFileUpload(
                  sessionId: targetTask.sessionId,
                  fileId: targetTask.fileId,
                  path: targetTask.path,
                  fileDescriptor: targetTask.fileDescriptor,
                  fileSize: targetTask.fileSize,
                );
            await for (final progress in progressStream) {
              sendToMain(
                IsolateTaskStreamResult.event(
                  id: task.id,
                  data: HttpServerFileUploadProgressEvent(
                    sessionId: targetTask.sessionId,
                    fileId: targetTask.fileId,
                    progress: progress,
                  ),
                ),
              );
            }
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
        case HttpServerRejectFileUploadTask rejectTask:
          await ref
              .read(httpServerProvider)
              .rejectFileUpload(
                sessionId: rejectTask.sessionId,
                fileId: rejectTask.fileId,
              );
          return;
        case HttpServerCancelSessionTask cancelTask:
          await ref.read(httpServerProvider).cancelSession(sessionId: cancelTask.sessionId);
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
        case HttpServerRejectFileDownloadTask rejectTask:
          await ref
              .read(httpServerProvider)
              .rejectFileDownload(
                sessionId: rejectTask.sessionId,
                fileId: rejectTask.fileId,
              );
          return;
      }
    },
  );
}
