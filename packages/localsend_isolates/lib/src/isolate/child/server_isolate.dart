import 'dart:async';

import 'package:flutter/services.dart';
import 'package:localsend_isolates/constants.dart';
import 'package:localsend_isolates/model/dto/multicast_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/rust/api/model.dart' show FileDto;
import 'package:localsend_isolates/rust/api/server.dart';
import 'package:localsend_isolates/src/isolate/child/main.dart';
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:localsend_isolates/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_isolates/src/task/server/file_saver.dart';
import 'package:localsend_isolates/src/task/server/http_server.dart';
import 'package:localsend_isolates/util/future_queue.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:typed_isolates/typed_isolates.dart';

final _logger = Logger('HttpServerIsolate');

sealed class BaseHttpServerTask {}

/// Starts the HTTP server.
/// The device information is derived from the sync state.
///
/// The server emits [HttpServerEvent]s on the stream of this task
/// until the server is stopped via [HttpServerStopTask].
class HttpServerStartTask implements BaseHttpServerTask {
  /// Optional PIN that senders must provide to start an upload session.
  final String? pin;

  /// Whether the SHA-256 checksums that senders provide for their files are
  /// verified after receiving.
  final bool verifyChecksums;

  /// Configures the pages served to browsers: the download page (web download),
  /// the upload page, or the 403 page when web share is disabled.
  final WebParams web;

  /// Enables the internal `show` endpoint, guarded by this token, that lets another
  /// application instance request this one to show itself. `null` disables it.
  final String? showToken;

  HttpServerStartTask({
    required this.pin,
    required this.verifyChecksums,
    required this.web,
    required this.showToken,
  });
}

/// Stops the HTTP server.
/// The stream of this task completes once the server has released the port.
class HttpServerStopTask implements BaseHttpServerTask {}

/// Everything the server isolate needs to receive the accepted files on its
/// own, without further involvement of the main isolate.
class HttpServerReceiveConfig {
  /// The session ID of the [HttpServerPrepareUploadEvent] being answered.
  final String sessionId;

  /// The accepted file IDs mapped to the desired file name
  /// (may contain a relative directory prefix).
  final Map<String, String> fileNameMap;

  final String destinationDirectory;

  /// Used as intermediate storage when [saveToGallery] is enabled.
  final String cacheDirectory;

  /// Save received images/videos to the OS gallery instead of
  /// [destinationDirectory].
  final bool saveToGallery;

  /// The Android SDK version, `null` on other platforms. Enables SAF handling
  /// for destinations that cannot be written directly.
  final int? androidSdkInt;

  HttpServerReceiveConfig({
    required this.sessionId,
    required this.fileNameMap,
    required this.destinationDirectory,
    required this.cacheDirectory,
    required this.saveToGallery,
    required this.androidSdkInt,
  });
}

/// Answers a pending [HttpServerPrepareUploadEvent].
///
/// When accepted, the server isolate receives all files on its own:
/// it resolves the save target for every upload, lets the Rust server write
/// the file and applies post-processing (timestamps, gallery). The main
/// isolate only observes [HttpServerFileUploadEvent],
/// [HttpServerFileUploadProgressEvent] and [HttpServerFileUploadResultEvent]
/// on the server event stream and may cancel the session via
/// [HttpServerCancelSessionTask].
class HttpServerPrepareUploadDecisionTask implements BaseHttpServerTask {
  /// The receive configuration including the accepted file IDs.
  /// `null` declines the request.
  final HttpServerReceiveConfig? config;

  HttpServerPrepareUploadDecisionTask({
    required this.config,
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

/// Fails a pending [HttpServerWebFileDownloadEvent], e.g. because no source
/// for the file content could be resolved. The download request fails with an
/// error response. Does nothing if the download was already answered with a
/// [HttpServerFileDownloadTargetTask].
class HttpServerFailFileDownloadTask implements BaseHttpServerTask {
  final String sessionId;
  final String fileId;

  HttpServerFailFileDownloadTask({
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

/// An accepted file started being uploaded.
/// The server isolate receives and saves the file on its own; the main
/// isolate only needs to update its view of the session.
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

/// The receive progress of a file as a fraction (0.0 to 1.0).
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

/// A file of the upload session has been received completely (or failed).
class HttpServerFileUploadResultEvent extends HttpServerEvent {
  final String sessionId;
  final String fileId;

  /// The path or content URI the file has been saved to.
  /// `null` when the file was saved to the gallery or on error.
  final String? path;

  /// Whether the file ended up in the OS gallery.
  final bool savedToGallery;

  /// `null` if the file has been saved successfully.
  final String? error;

  HttpServerFileUploadResultEvent({
    required this.sessionId,
    required this.fileId,
    required this.path,
    required this.savedToGallery,
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

/// The listening socket failed permanently, e.g. because the OS invalidated it
/// while the application was suspended (iOS reclaims the sockets of suspended
/// apps). The server has stopped itself; the application must restart it to
/// become reachable again.
class HttpServerListenerFailedEvent extends HttpServerEvent {
  /// Description of the failure.
  final String error;

  HttpServerListenerFailedEvent({
    required this.error,
  });
}

class _ReceiveSession {
  final HttpServerReceiveConfig config;

  /// Directories already created inside the destination, shared across all
  /// files of the session.
  final Set<String> createdDirectories = {};

  /// One queue per file ID, so that uploads of the same file do not overlap.
  ///
  /// A sender may upload the same file again after it was rejected because of
  /// a checksum mismatch. Both attempts write to the same [targets] entry.
  final Map<String, FutureQueue> uploads = {};

  /// The destination of each file of this session, by file ID.
  ///
  /// Remembered so that another attempt at the same file overwrites it instead
  /// of being saved next to it under a numbered name.
  final Map<String, FileSaveTarget> targets = {};

  _ReceiveSession(this.config);
}

/// Holds the active receive session, set when a prepare-upload request is accepted.
final _receiveSessionProvider = Provider((ref) => _ReceiveSessionHolder());

class _ReceiveSessionHolder {
  _ReceiveSession? session;
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
    init: (ref) async {
      // Initialize the platform method channel so SAF (file creation) and the
      // gallery plugin work inside this isolate.
      BackgroundIsolateBinaryMessenger.ensureInitialized(
        ref.read(syncProvider).rootIsolateToken as RootIsolateToken,
      );
    },
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
                  verifyChecksums: startTask.verifyChecksums,
                  web: startTask.web,
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

          void emit(HttpServerEvent data) {
            sendToMain(
              IsolateTaskStreamResult.event(
                id: task.id,
                data: data,
              ),
            );
          }

          try {
            await for (final event in events) {
              final holder = ref.read(_receiveSessionProvider);
              switch (event) {
                case RsServerEvent_Register(:final ip, :final info):
                  emit(HttpServerRegisterEvent(ip: ip, info: info));
                case RsServerEvent_PrepareUpload(:final sessionId, :final ip, :final info, :final certFingerprint, :final files):
                  // The Rust server is the authority on the single-session
                  // invariant: a new request means the old session is over.
                  holder.session = null;
                  emit(
                    HttpServerPrepareUploadEvent(
                      sessionId: sessionId,
                      ip: ip,
                      info: info,
                      certFingerprint: certFingerprint,
                      files: files,
                    ),
                  );
                case RsServerEvent_FileUpload(:final sessionId, :final fileId, :final file):
                  final session = holder.session;
                  if (session == null || session.config.sessionId != sessionId || !session.config.fileNameMap.containsKey(fileId)) {
                    _logger.warning('Rejecting upload of file $fileId: no matching active session');
                    // Reject the upload (and any further ones) by cancelling the session.
                    unawaited(ref.read(httpServerProvider).cancelSession(sessionId: sessionId));
                    break;
                  }

                  // Files may be uploaded concurrently, so the event loop must
                  // not block. Attempts of the same file are queued instead,
                  // see [_ReceiveSession.uploads].
                  final queue = session.uploads.putIfAbsent(
                    fileId,
                    () => FutureQueue(onError: (e, st) => _logger.severe('Unexpected error while receiving file $fileId', e, st)),
                  );
                  queue.add(() async {
                    emit(
                      HttpServerFileUploadEvent(
                        sessionId: sessionId,
                        fileId: fileId,
                        file: file,
                      ),
                    );

                    await _handleFileUpload(
                      ref: ref,
                      session: session,
                      sessionId: sessionId,
                      fileId: fileId,
                      file: file,
                      emit: emit,
                    );
                  });
                case RsServerEvent_SessionEnd(:final sessionId, :final reason):
                  if (holder.session?.config.sessionId == sessionId) {
                    holder.session = null;
                  }
                  emit(
                    HttpServerSessionEndEvent(
                      sessionId: sessionId,
                      reason: reason,
                    ),
                  );
                case RsServerEvent_PrepareUploadAborted(:final sessionId):
                  emit(
                    HttpServerPrepareUploadAbortedEvent(
                      sessionId: sessionId,
                    ),
                  );
                case RsServerEvent_CancelReceived(:final ip, :final sessionId):
                  emit(
                    HttpServerCancelReceivedEvent(
                      ip: ip,
                      sessionId: sessionId,
                    ),
                  );
                case RsServerEvent_WebPrepareDownload(:final ip, :final sessionId, :final userAgent):
                  emit(
                    HttpServerWebPrepareDownloadEvent(
                      ip: ip,
                      sessionId: sessionId,
                      userAgent: userAgent,
                    ),
                  );
                case RsServerEvent_WebFileDownload(:final sessionId, :final fileId, :final file):
                  emit(
                    HttpServerWebFileDownloadEvent(
                      sessionId: sessionId,
                      fileId: fileId,
                      file: file,
                    ),
                  );
                case RsServerEvent_Show(:final args):
                  emit(HttpServerShowEvent(args: args));
                case RsServerEvent_ListenerFailed(:final error):
                  ref.read(_receiveSessionProvider).session = null;
                  emit(HttpServerListenerFailedEvent(error: error));
              }
            }
          } finally {
            ref.read(_receiveSessionProvider).session = null;
            sendToMain(
              IsolateTaskStreamResult.done(
                id: task.id,
              ),
            );
          }
          return;
        case HttpServerStopTask _:
          ref.read(_receiveSessionProvider).session = null;
          await ref.read(httpServerProvider).stop();
          sendToMain(
            IsolateTaskStreamResult.done(
              id: task.id,
            ),
          );
          return;
        case HttpServerPrepareUploadDecisionTask decisionTask:
          final config = decisionTask.config;
          // An empty fileNameMap accepts nothing: the Rust server responds
          // with 204 and creates no session.
          ref.read(_receiveSessionProvider).session = config == null || config.fileNameMap.isEmpty ? null : _ReceiveSession(config);
          await ref.read(httpServerProvider).respondPrepareUpload(acceptedFileIds: config?.fileNameMap.keys.toList());
          return;
        case HttpServerCancelSessionTask cancelTask:
          final holder = ref.read(_receiveSessionProvider);
          if (holder.session?.config.sessionId == cancelTask.sessionId) {
            holder.session = null;
          }
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
        case HttpServerFailFileDownloadTask failTask:
          await ref
              .read(httpServerProvider)
              .failFileDownload(
                sessionId: failTask.sessionId,
                fileId: failTask.fileId,
              );
          return;
      }
    },
  );
}

/// Receives a single file without involving the main isolate:
/// resolves the save target, lets the Rust server write the file and applies
/// the post-processing (timestamps, gallery).
///
/// [emit]s [HttpServerFileUploadProgressEvent]s while the file is being
/// received, followed by a final [HttpServerFileUploadResultEvent].
Future<void> _handleFileUpload({
  required Ref ref,
  required _ReceiveSession session,
  required String sessionId,
  required String fileId,
  required FileDto file,
  required void Function(HttpServerEvent event) emit,
}) async {
  final config = session.config;
  final desiredName = config.fileNameMap[fileId]!;
  final dartFile = file.toDart();
  final isImage = dartFile.fileType == FileType.image;
  final shouldSaveToGallery = config.saveToGallery && (isImage || dartFile.fileType == FileType.video);

  void emitFailed(Object e) {
    emit(
      HttpServerFileUploadResultEvent(
        sessionId: sessionId,
        fileId: fileId,
        path: null,
        savedToGallery: false,
        error: e.humanErrorMessage,
      ),
    );
  }

  _logger.info('Saving ${dartFile.fileName}');

  final FileSaveTarget target;
  try {
    // A previous attempt at this file already picked a destination, which this
    // attempt overwrites instead of creating a numbered version.
    final previous = session.targets[fileId];
    target = previous != null
        ? await reopenFileSaveTarget(previous)
        : await prepareFileSaveTarget(
            destinationDirectory: config.destinationDirectory,
            cacheDirectory: config.cacheDirectory,
            fileName: desiredName,
            saveToGallery: shouldSaveToGallery,
            isImage: isImage,
            createdDirectories: session.createdDirectories,
            androidSdkInt: config.androidSdkInt,
          );
    session.targets[fileId] = target;
  } catch (e, st) {
    _logger.severe('Failed to prepare save target', e, st);

    // The Rust server is still waiting for the target; failing it ends the
    // sender's request which would otherwise hang forever.
    try {
      await ref.read(httpServerProvider).failFileUpload(sessionId: sessionId, fileId: fileId);
    } catch (e) {
      _logger.warning('Could not fail the pending file upload', e);
    }

    emitFailed(e);
    return;
  }

  try {
    // The Rust server writes the file and reports the progress.
    final progressStream = ref
        .read(httpServerProvider)
        .respondFileUpload(
          sessionId: sessionId,
          fileId: fileId,
          path: target.path,
          fileDescriptor: target.fileDescriptor,
          fileSize: dartFile.size,
        );
    await for (final progress in progressStream) {
      emit(
        HttpServerFileUploadProgressEvent(
          sessionId: sessionId,
          fileId: fileId,
          progress: progress,
        ),
      );
    }
  } catch (e, st) {
    // The incomplete file is kept: a retry of this file overwrites it, and
    // otherwise it stays behind as the partial file of a failed transfer.
    _logger.severe('Failed to save file', e, st);
    emitFailed(e);
    return;
  }

  try {
    String? filePath;
    bool savedToGallery = false;
    if (shouldSaveToGallery) {
      (savedToGallery, filePath) = await saveCachedFileToGallery(
        cachedPath: target.displayPath,
        destinationDirectory: config.destinationDirectory,
        fileName: desiredName,
        isImage: isImage,
        createdDirectories: session.createdDirectories,
      );
    } else {
      filePath = target.displayPath;
    }

    _logger.info('Saved ${dartFile.fileName}.');
    emit(
      HttpServerFileUploadResultEvent(
        sessionId: sessionId,
        fileId: fileId,
        path: filePath,
        savedToGallery: savedToGallery,
        error: null,
      ),
    );
  } catch (e, st) {
    _logger.severe('Failed to post-process file', e, st);
    emitFailed(e);
  }
}
