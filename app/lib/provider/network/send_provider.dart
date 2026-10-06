import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/model/state/send/send_session_state.dart';
import 'package:localsend_app/model/state/send/sending_file.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/home_page_controller.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/send_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/file_transfer_provider.dart';
import 'package:localsend_app/provider/http_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/widget/dialogs/pin_dialog.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_status.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:localsend_isolates/rust/api/cancel.dart' as rust_cancel;
import 'package:localsend_isolates/rust/api/http.dart' as rust_http;
import 'package:localsend_isolates/rust/api/model.dart' as rust_model;
import 'package:localsend_isolates/util/file_hash.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:localsend_isolates/util/sleep.dart';
import 'package:localsend_isolates/util/transfer_notification.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/addons.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';
import 'package:uri_content/uri_content.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();
final _logger = Logger('Send');

/// This provider manages sending files to other devices.
///
/// In contrast to [serverProvider], this provider does not manage a server.
/// Instead, it only does HTTP requests to other servers.
final sendProvider = NotifierProvider<SendNotifier, Map<String, SendSessionState>>((ref) {
  return SendNotifier();
});

class SendNotifier extends Notifier<Map<String, SendSessionState>> {
  SendNotifier();

  /// Cancel tokens of the running checksum calculations.
  /// Session ID -> Cancel token
  final _hashCancelTokens = <String, rust_cancel.RsCancellationToken>{};

  /// Cancel tokens of the running prepare-upload requests.
  /// Cancelling aborts the request, which tells the receiver that the sender
  /// is no longer waiting for a decision.
  /// Session ID -> Cancel token
  final _prepareUploadCancelTokens = <String, rust_cancel.RsCancellationToken>{};

  @override
  Map<String, SendSessionState> init() {
    return {};
  }

  /// The debug observer stringifies the state on every change,
  /// so large file maps must be summarized to keep transfers responsive in debug mode.
  @override
  String describeState(Map<String, SendSessionState> state) {
    if (state.values.every((session) => session.files.length <= 10)) {
      return state.toString();
    }
    return state.map((sessionId, session) {
      if (session.files.length <= 10) {
        return MapEntry(sessionId, session.toString());
      }
      return MapEntry(
        sessionId,
        session.copyWith(files: {}).toString().replaceFirst('files: {}', 'files: <${session.files.length} files>'),
      );
    }).toString();
  }

  /// Starts a session.
  /// If [background] is true, then the session closes itself on success and no pages will be open
  /// If [background] is false, then this method will open pages by itself and waits for user input to close the session.
  Future<void> startSession({
    required Device target,
    required List<CrossFile> files,
    required bool background,
  }) async {
    // Pinned to the device the user picked, so the request is not sent at all
    // if someone else answers on that address.
    final client = ref.read(httpProvider).pinnedTo(target.fingerprint);
    final sessionId = _uuid.v4();
    final createChecksums = ref.read(settingsProvider).createChecksums;

    // The ids are assigned upfront, so the checksums calculated below
    // can be mapped back to the corresponding file.
    final selectedFiles = files.map((file) => (id: _uuid.v4(), file: file)).toList();

    state = state.updateSession(
      sessionId: sessionId,
      state: (_) => SendSessionState(
        sessionId: sessionId,
        remoteSessionId: null,
        background: background,
        status: SessionStatus.waiting,
        target: target,
        files: {
          for (final (:id, :file) in selectedFiles)
            id: SendingFile(
              file: FileDto(
                id: id,
                fileName: file.name,
                size: file.size,
                fileType: file.fileType,
                hash: null,
                // calculated below
                preview: files.length == 1 && files.first.fileType == FileType.text && files.first.bytes != null
                    ? utf8.decode(files.first.bytes!) // send simple message by embedding it into the preview
                    : null,
                metadata: file.lastModified != null || file.lastAccessed != null
                    ? FileMetadata(
                        lastModified: file.lastModified,
                        lastAccessed: file.lastAccessed,
                      )
                    : null,
              ),
              token: null,
              thumbnail: file.thumbnail,
              asset: file.asset,
              path: file.path,
              bytes: file.bytes,
              errorMessage: null,
            ),
        },
        // Skipping the checksums marks all files as hashed, so the UI does not
        // show the checksum progress.
        hashedFileCount: createChecksums ? 0 : selectedFiles.length,
        startTime: null,
        endTime: null,
        sendingTasks: [],
        errorMessage: null,
      ),
    );

    ref
        .notifier(fileTransferProvider)
        .setStatuses(
          sessionId: sessionId,
          statuses: {for (final f in selectedFiles) f.id: FileStatus.queue},
        );

    if (!background) {
      // ignore: use_build_context_synchronously, unawaited_futures
      Routerino.context.push(
        () => SendPage(showAppBar: false, closeSessionOnClose: true, sessionId: sessionId),
        transition: RouterinoTransition.fade(),
      );
    }

    // Calculate the checksums which are part of the request.
    // The files are read and hashed in Rust, one file after another.
    final hashes = <String, String>{};
    if (createChecksums) {
      final hashCancelToken = rust_cancel.createCancellationToken();
      _hashCancelTokens[sessionId] = hashCancelToken;
      try {
        for (final (:id, :file) in selectedFiles) {
          try {
            hashes[id] = await calculateFileHash(
              path: file.path,
              bytes: file.bytes,
              cancelToken: hashCancelToken,
              onProgress: (bytes) {
                if (state[sessionId] == null) {
                  // session has been canceled while calculating the checksums
                  return;
                }
                ref
                    .notifier(fileTransferProvider)
                    .setProgress(
                      sessionId: sessionId,
                      fileId: id,
                      progress: file.size == 0 ? 1 : (bytes / file.size).clamp(0, 1),
                    );
              },
            );
          } catch (e) {
            if (state[sessionId] != null) {
              // Sending the checksum is optional, so a file that cannot be read
              // here still gets a chance to be sent.
              // Errors caused by the cancellation are not logged.
              _logger.warning('Could not calculate the checksum of ${file.name}', e);
            }
          }

          if (state[sessionId] == null) {
            // session has been canceled while calculating the checksums
            return;
          }

          // Also set for files whose hashing failed, so the progress bar stays
          // consistent with the files that are left.
          ref.notifier(fileTransferProvider).setProgress(sessionId: sessionId, fileId: id, progress: 1);
          state = state.updateSession(
            sessionId: sessionId,
            state: (s) => s?.copyWith(hashedFileCount: s.hashedFileCount + 1),
          );
        }
      } finally {
        _hashCancelTokens.remove(sessionId);
      }
    }

    final hashedState = state[sessionId];
    if (hashedState == null) {
      // session has been canceled while calculating the checksums
      return;
    }

    final requestState = hashedState.copyWith(
      files: hashedState.files.map(
        (id, sendingFile) => MapEntry(id, sendingFile.copyWith(file: sendingFile.file.withHash(hashes[id]))),
      ),
    );
    state = state.updateSession(
      sessionId: sessionId,
      state: (_) => requestState,
    );

    final originDevice = ref.read(deviceFullInfoProvider);
    final requestDto = rust_model.PrepareUploadRequestDto(
      info: rust_model.RegisterDto(
        alias: originDevice.alias,
        version: originDevice.version,
        deviceModel: originDevice.deviceModel,
        deviceType: originDevice.deviceType.toRust(),
        token: originDevice.fingerprint,
        port: originDevice.port,
        protocol: originDevice.https ? rust_model.ProtocolType.https : rust_model.ProtocolType.http,
        hasWebInterface: originDevice.download,
      ),
      files: {
        for (final entry in requestState.files.entries) entry.key: entry.value.file.toRust(),
      },
    );

    rust_http.PrepareUploadResult? response;
    bool invalidPin;
    bool pinFirstAttempt = true;
    String? pin;
    final prepareUploadCancelToken = rust_cancel.createCancellationToken();
    _prepareUploadCancelTokens[sessionId] = prepareUploadCancelToken;
    try {
      do {
        invalidPin = false;
        try {
          response = await client.prepareUpload(
            protocol: target.getProtocolType(),
            ip: target.ip!,
            port: target.port,
            payload: requestDto,
            // The peer is already verified during the TLS handshake by the
            // fingerprint the client is pinned to.
            publicKey: null,
            pin: pin,
            cancelToken: prepareUploadCancelToken,
          );
        } on rust_http.RsHttpClientError_StatusCode catch (e) {
          switch (e.status) {
            case 401:
              invalidPin = true;

              // wait until animation is finished
              await sleepAsync(500);

              pin = await showDialog<String>(
                context: Routerino.context, // ignore: use_build_context_synchronously
                builder: (_) => PinDialog(
                  obscureText: true,
                  showInvalidPin: !pinFirstAttempt,
                ),
              );

              pinFirstAttempt = false;

              if (pin == null) {
                state = state.updateSession(
                  sessionId: sessionId,
                  state: (s) => s?.copyWith(
                    status: SessionStatus.canceledBySender,
                  ),
                );
                return;
              }
              break;
            case 403:
              state = state.updateSession(
                sessionId: sessionId,
                state: (s) => s?.copyWith(
                  status: SessionStatus.declined,
                ),
              );
              return;
            case 409:
              state = state.updateSession(
                sessionId: sessionId,
                state: (s) => s?.copyWith(
                  status: SessionStatus.recipientBusy,
                ),
              );
              return;
            case 429:
              state = state.updateSession(
                sessionId: sessionId,
                state: (s) => s?.copyWith(
                  status: SessionStatus.tooManyAttempts,
                ),
              );
              return;
            default:
              state = state.updateSession(
                sessionId: sessionId,
                state: (s) => s?.copyWith(
                  status: SessionStatus.finishedWithErrors,
                  errorMessage: e.humanErrorMessage,
                ),
              );
              return;
          }
        } catch (e) {
          state = state.updateSession(
            sessionId: sessionId,
            state: (s) => s?.copyWith(
              status: SessionStatus.finishedWithErrors,
              errorMessage: e.humanErrorMessage,
            ),
          );
          return;
        }
      } while (invalidPin);
    } finally {
      _prepareUploadCancelTokens.remove(sessionId);
    }

    if (response == null) {
      return;
    }

    final Map<String, String> fileMap;
    if (response.statusCode == 204) {
      // Nothing selected
      // Interpret this as "Read and close"
      fileMap = {};
    } else {
      try {
        fileMap = response.response!.files;
        final remoteSessionId = response.response!.sessionId;
        state = state.updateSession(
          sessionId: sessionId,
          state: (s) => s?.copyWith(
            remoteSessionId: remoteSessionId,
          ),
        );
      } catch (e) {
        state = state.updateSession(
          sessionId: sessionId,
          state: (s) => s?.copyWith(
            status: SessionStatus.finishedWithErrors,
            errorMessage: e.humanErrorMessage,
          ),
        );
        return;
      }
    }

    if (fileMap.isEmpty) {
      // receiver has nothing selected
      state = state.updateSession(
        sessionId: sessionId,
        state: (s) => s?.copyWith(
          status: SessionStatus.finished,
        ),
      );

      if (state[sessionId]?.background == false) {
        // Pop back to the existing HomePage instead of pushing a new one:
        // a second HomePage attaches a second PageView to the shared PageController,
        // and removing routes without animation orphans a hero in flight.
        ref.redux(homePageControllerProvider).dispatch(ChangeTabAction(HomeTab.send));
        ref.global.dispatch(NavigateAction.popUntilRoot());
      }

      closeSession(sessionId);
      return;
    }

    final sendingFiles = {
      for (final file in requestState.files.values)
        file.file.id: fileMap.containsKey(file.file.id) ? file.copyWith(token: fileMap[file.file.id]) : file,
    };

    // Recreate the transfer state: the hash progress is no longer needed and must not be
    // mistaken for upload progress, which starts at zero for every file.
    final transferNotifier = ref.notifier(fileTransferProvider);
    transferNotifier.removeSession(sessionId);
    transferNotifier.setStatuses(
      sessionId: sessionId,
      statuses: {for (final file in sendingFiles.values) file.file.id: file.token != null ? FileStatus.queue : FileStatus.skipped},
    );

    if (state[sessionId]?.background == false) {
      final background = ref.read(settingsProvider).sendMode == SendMode.multiple;

      unawaited(
        // ignore: use_build_context_synchronously
        Routerino.context
            .pushAndRemoveUntil(
              removeUntil: HomePage,
              transition: RouterinoTransition.fade(),
              // immediately is not possible: https://github.com/flutter/flutter/issues/121910
              builder: () => ProgressPage(
                showAppBar: background,
                closeSessionOnClose: !background,
                sessionId: sessionId,
              ),
            )
            .then((_) {
              if (background) {
                // The page was popped (e.g. backing out mid-transfer), so the session
                // runs in background again and is removed silently on success.
                setBackground(sessionId, true);
              }
            }),
      );
    }

    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.copyWith(
        status: SessionStatus.sending,
        files: sendingFiles,
      ),
    );

    // Keep the process alive for the whole transfer. Started here, while the app is still in the
    // foreground, because Android 12+ rejects starting a foreground service from the background.
    TransferNotification.start(sessionId: sessionId, receiving: false);

    await _sendLoop(sessionId, sendingFiles);
  }

  /// Reports the total session progress to the foreground service notification,
  /// so that it stays up to date while the app is minimized.
  void _updateForegroundServiceProgress(String sessionId) {
    if (!TransferNotification.shouldUpdate) {
      // Checked before the sum below because progress events arrive several times per second per file.
      return;
    }

    final session = state[sessionId];
    if (session == null) {
      return;
    }

    final transferNotifier = ref.read(fileTransferProvider);
    int currentBytes = 0;
    int totalBytes = 0;
    for (final sendingFile in session.files.values) {
      if (transferNotifier.getStatus(sessionId: sessionId, fileId: sendingFile.file.id) == FileStatus.skipped) {
        // not accepted by the receiver
        continue;
      }
      final size = sendingFile.file.size;
      totalBytes += size;
      currentBytes += (transferNotifier.getProgress(sessionId: sessionId, fileId: sendingFile.file.id) * size).round();
    }

    TransferNotification.update(
      sessionId: sessionId,
      currentBytes: currentBytes,
      totalBytes: totalBytes,
      startTime: session.startTime,
      endTime: session.endTime,
    );
  }

  Future<void> _sendLoop(String sessionId, Map<String, SendingFile> files) async {
    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.copyWith(startTime: DateTime.now().millisecondsSinceEpoch),
    );

    await _sendFiles(
      sessionId: sessionId,
      files: files.values.toList(),
    );

    _finish(sessionId: sessionId);
  }

  void _finish({required String sessionId}) {
    final sessionState = state[sessionId];
    if (sessionState == null) {
      return;
    }

    // The transfer is over, the process no longer needs to be kept alive for it.
    TransferNotification.stop(sessionId);

    if (state[sessionId]!.status != SessionStatus.sending) {
      _logger.info('Transfer was canceled.');
    } else {
      final hasError = ref.read(fileTransferProvider).getStatuses(sessionId).any((status) => status == FileStatus.failed);
      if (!hasError && sessionState.background == true) {
        // close session because everything is fine and it is in background
        closeSession(sessionId);
        _logger.info('Transfer finished and session removed.');
      } else {
        // keep session alive when there are errors or currently in foreground
        state = state.updateSession(
          sessionId: sessionId,
          state: (s) => s?.copyWith(
            status: hasError ? SessionStatus.finishedWithErrors : SessionStatus.finished,
            endTime: DateTime.now().millisecondsSinceEpoch,
          ),
        );

        if (hasError) {
          _logger.info('Transfer finished with errors.');
        } else {
          _logger.info('Transfer finished successfully.');
        }
      }
    }
  }

  final uriContent = UriContent();

  /// Sends a single file. Currently only used to retry a failed file.
  Future<void> sendFile({
    required String sessionId,
    required SendingFile file,
    required bool isRetry,
  }) async {
    if (file.token == null) {
      return;
    }

    final status = state[sessionId]?.status;
    const allowedStates = {SessionStatus.sending, SessionStatus.finishedWithErrors};
    if (status == null || !allowedStates.contains(status)) {
      return;
    }

    if (isRetry) {
      _logger.info('Retrying ${file.file.fileName}');

      ref.notifier(fileTransferProvider).setStatus(sessionId: sessionId, fileId: file.file.id, status: FileStatus.queue);
      state = state.updateSession(
        sessionId: sessionId,
        state: (s) => s?.copyWith(
          status: SessionStatus.sending,
          files: s.files.map((key, value) {
            if (key == file.file.id) {
              return MapEntry(key, value.copyWith(errorMessage: null));
            }
            return MapEntry(key, value);
          }),
        ),
      );
    }

    await _sendFiles(
      sessionId: sessionId,
      files: [file],
    );

    if (isRetry) {
      if (state[sessionId] != null && ref.read(fileTransferProvider).getStatuses(sessionId).isFinishedOrError) {
        _finish(sessionId: sessionId);
      }
    }
  }

  /// Sends the given [files] as one isolate task.
  /// The isolate iterates through the list and reports the state of each file
  /// via [HttpUploadEvent]s.
  /// Files without a token (i.e. not selected by the receiver) are skipped.
  Future<void> _sendFiles({
    required String sessionId,
    required List<SendingFile> files,
  }) async {
    final sessionState = state[sessionId];
    if (sessionState == null) {
      return;
    }

    final uploadFiles = [
      for (final file in files)
        if (file.token != null)
          HttpUploadFile(
            remoteFileToken: file.token!,
            fileId: file.file.id,
            filePath: file.path,
            fileBytes: file.bytes,
            fileSize: file.file.size,
          ),
    ];

    if (uploadFiles.isEmpty) {
      return;
    }

    final taskResult = ref
        .redux(parentIsolateProvider)
        .dispatchTakeResult(
          IsolateHttpUploadFilesAction(
            remoteSessionId: sessionState.remoteSessionId,
            files: uploadFiles,
            device: sessionState.target,
          ),
        );

    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.copyWith(
        sendingTasks: [
          ...?s.sendingTasks,
          SendingTask(
            taskId: taskResult.taskId,
          ),
        ],
      ),
    );

    try {
      await for (final event in taskResult.events) {
        switch (event) {
          case HttpUploadFileStartedEvent():
            _logger.info('Sending ${state[sessionId]?.files[event.fileId]?.file.fileName}');
            ref.notifier(fileTransferProvider).setStatus(sessionId: sessionId, fileId: event.fileId, status: FileStatus.sending);
          case HttpUploadFileProgressEvent():
            ref
                .notifier(fileTransferProvider)
                .setProgress(
                  sessionId: sessionId,
                  fileId: event.fileId,
                  progress: event.progress,
                );
            _updateForegroundServiceProgress(sessionId);
          case HttpUploadFileFinishedEvent():
            // set progress to 100% when successfully finished
            ref
                .notifier(fileTransferProvider)
                .setProgress(
                  sessionId: sessionId,
                  fileId: event.fileId,
                  progress: 1,
                );
            _updateForegroundServiceProgress(sessionId);
            ref.notifier(fileTransferProvider).setStatus(sessionId: sessionId, fileId: event.fileId, status: FileStatus.finished);
          case HttpUploadFileFailedEvent():
            _logger.warning('Error while sending file ${state[sessionId]?.files[event.fileId]?.file.fileName}: ${event.error}');
            ref.notifier(fileTransferProvider).setStatus(sessionId: sessionId, fileId: event.fileId, status: FileStatus.failed);
            state = state.updateSession(
              sessionId: sessionId,
              state: (s) => s?.withFileError(event.fileId, event.error),
            );
        }
      }
    } catch (e, st) {
      // the whole task failed, mark all files of this task that did not finish as failed
      _logger.warning('Error while sending files', e, st);
      final error = e.humanErrorMessage;
      final transferNotifier = ref.notifier(fileTransferProvider);
      final failedFileIds = uploadFiles
          .map((file) => file.fileId)
          .where((id) => const {FileStatus.queue, FileStatus.sending}.contains(transferNotifier.getStatus(sessionId: sessionId, fileId: id)))
          .toSet();
      transferNotifier.setStatuses(
        sessionId: sessionId,
        statuses: {for (final id in failedFileIds) id: FileStatus.failed},
      );
      state = state.updateSession(
        sessionId: sessionId,
        state: (s) => s?.copyWith(
          files: s.files.map((key, value) {
            if (failedFileIds.contains(key)) {
              return MapEntry(key, value.copyWith(errorMessage: error));
            }
            return MapEntry(key, value);
          }),
        ),
      );
    } finally {
      state = state.updateSession(
        sessionId: sessionId,
        state: (s) => s?.copyWith(
          sendingTasks: s.sendingTasks?.where((task) => task.taskId != taskResult.taskId).toList(),
        ),
      );
    }
  }

  /// Closes the send-session and sends a cancel event to the receiver.
  void cancelSession(String sessionId) {
    final sessionState = state[sessionId];
    if (sessionState == null) {
      return;
    }
    final remoteSessionId = sessionState.remoteSessionId;

    _cancelRunningRequests(sessionState);

    if (remoteSessionId == null) {
      closeSession(sessionId);
      return;
    }

    // notify the receiver
    final target = sessionState.target;
    try {
      ref
          .read(httpProvider)
          .pinnedTo(target.fingerprint)
          // ignore: discarded_futures
          .cancel(
            protocol: target.getProtocolType(),
            ip: target.ip!,
            port: target.port,
            sessionId: remoteSessionId,
          );
    } catch (e) {
      _logger.warning('Error while canceling session', e);
    }

    // finally, close session locally
    closeSession(sessionId);
  }

  void cancelSessionByReceiver(String sessionId) {
    final sessionState = state[sessionId];
    if (sessionState == null) {
      return;
    }
    TransferNotification.stop(sessionId);
    _cancelRunningRequests(sessionState);

    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.copyWith(
        status: SessionStatus.canceledByReceiver,
        endTime: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  void _cancelRunningRequests(SendSessionState state) {
    _hashCancelTokens.remove(state.sessionId)?.cancel();
    _prepareUploadCancelTokens.remove(state.sessionId)?.cancel();

    for (final task in state.sendingTasks ?? <SendingTask>[]) {
      ref
          .redux(parentIsolateProvider)
          .dispatch(
            IsolateHttpUploadCancelAction(
              taskId: task.taskId,
            ),
          );
    }
  }

  /// Closes the session
  void closeSession(String sessionId) {
    final sessionState = state[sessionId];
    if (sessionState == null) {
      return;
    }
    TransferNotification.stop(sessionId);
    _hashCancelTokens.remove(sessionId)?.cancel();
    _prepareUploadCancelTokens.remove(sessionId)?.cancel();
    state = state.removeSession(ref, sessionId);
    if (sessionState.status == SessionStatus.finished && ref.read(settingsProvider).sendMode == SendMode.single) {
      // clear selected files
      ref.redux(selectedSendingFilesProvider).dispatch(ClearSelectionAction());
    }
  }

  void clearAllSessions() {
    for (final sessionId in state.keys) {
      TransferNotification.stop(sessionId);
    }
    for (final cancelToken in _hashCancelTokens.values) {
      cancelToken.cancel();
    }
    _hashCancelTokens.clear();
    for (final cancelToken in _prepareUploadCancelTokens.values) {
      cancelToken.cancel();
    }
    _prepareUploadCancelTokens.clear();
    state = {};
    ref.notifier(fileTransferProvider).removeAllSessions();
  }

  void setBackground(String sessionId, bool background) {
    state = state.updateSession(
      sessionId: sessionId,
      state: (s) => s?.copyWith(background: background),
    );
  }
}

extension on Map<String, SendSessionState> {
  Map<String, SendSessionState> updateSession({
    required String sessionId,
    required SendSessionState? Function(SendSessionState? old) state,
  }) {
    final newState = state(this[sessionId]);
    if (newState == null) {
      // no change
      return this;
    }
    return {
      ...this,
      sessionId: newState,
    };
  }

  Map<String, SendSessionState> removeSession(Ref ref, String sessionId) {
    ref.notifier(fileTransferProvider).removeSession(sessionId);
    return {...this}..remove(sessionId);
  }
}

extension on SendSessionState {
  SendSessionState withFileError(String fileId, String? errorMessage) {
    return copyWith(
      files: {...files}
        ..update(
          fileId,
          (file) => file.copyWith(
            errorMessage: errorMessage,
          ),
        ),
    );
  }
}
