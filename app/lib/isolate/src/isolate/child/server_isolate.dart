import 'package:localsend_app/isolate/constants.dart';
import 'package:localsend_app/isolate/model/dto/multicast_dto.dart';
import 'package:localsend_app/isolate/src/isolate/child/main.dart';
import 'package:localsend_app/isolate/src/isolate/child/sync_provider.dart';
import 'package:localsend_app/isolate/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_app/isolate/src/task/server/http_server.dart';
import 'package:localsend_app/rust/api/model.dart' show FileDto;
import 'package:localsend_app/rust/api/server.dart';
import 'package:localsend_app/util/rust.dart';
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

  HttpServerStartTask({
    required this.pin,
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
      }
    },
  );
}
