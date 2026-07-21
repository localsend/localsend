import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/home_page_controller.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/http_provider.dart';
import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/provider/receive_history_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/native/directories.dart';
import 'package:localsend_app/util/native/file_saver.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
import 'package:localsend_app/widget/dialogs/open_file_dialog.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/file_status.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:localsend_isolates/rust/api/server.dart' show SessionEndReasonV2;
import 'package:localsend_isolates/util/rust.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';
import 'package:uuid/uuid.dart';
import 'package:window_manager/window_manager.dart';

final _logger = Logger('ReceiveController');

/// Handles all server events for receiving files.
/// The HTTP requests themselves are served by the Rust server which emits
/// the events handled here.
class ReceiveController {
  final ServerUtils server;

  ReceiveController(this.server);

  /// A device registered itself on this server.
  Future<void> onRegister(HttpServerRegisterEvent event) async {
    if (event.info.fingerprint == server.ref.read(securityProvider).certificateHash) {
      // "I talked to myself lol"
      return;
    }

    await server.ref.redux(nearbyDevicesProvider).dispatchAsync(RegisterDeviceAction(event.info.toDevice(event.ip, HttpDiscovery(ip: event.ip))));
    server.ref.notifier(discoveryLoggerProvider).addLog('[DISCOVER/TCP] Received "/register" HTTP request: ${event.info.alias} (${event.ip})');
  }

  /// A sender requests to upload files.
  /// The Rust server already checked the PIN and enforces that only one
  /// session can be active at a time.
  Future<void> onPrepareUpload(HttpServerPrepareUploadEvent event) async {
    if (server.getStateOrNull()?.session != null) {
      // The Rust server is the authority on the single-session invariant:
      // a new request means the old session is over (e.g. finished but still
      // displayed, or aborted while waiting).
      closeSession();
    }

    final settings = server.ref.read(settingsProvider);
    final destinationDir = settings.destination ?? await getDefaultDestinationDirectory();
    final cacheDir = await getCacheDirectory();
    final sessionId = event.sessionId;
    final files = {
      for (final entry in event.files.entries) entry.key: entry.value.toDart(),
    };

    // The fingerprint of the sender's mTLS certificate cannot be spoofed, unlike the
    // self-reported fingerprint in the JSON payload which is only used as fallback
    // when encryption is disabled.
    final senderFingerprint = event.certFingerprint ?? event.info.fingerprint;

    _logger.info('Session Id: $sessionId');
    _logger.info('Destination Directory: $destinationDir');

    server.setState(
      (oldState) => oldState?.copyWith(
        session: ReceiveSessionState(
          sessionId: sessionId,
          status: SessionStatus.waiting,
          sender: event.info.toDevice(event.ip, null).copyWith(fingerprint: senderFingerprint),
          senderAlias: server.ref.read(favoritesProvider).firstWhereOrNull((e) => e.fingerprint == senderFingerprint)?.alias ?? event.info.alias,
          files: {
            for (final file in files.values)
              file.id: ReceivingFile(
                file: file,
                status: FileStatus.queue,
                token: null,
                desiredName: null,
                path: null,
                savedToGallery: false,
                errorMessage: null,
              ),
          },
          startTime: null,
          endTime: null,
          destinationDirectory: destinationDir,
          cacheDirectory: cacheDir,
          saveToGallery: checkPlatformWithGallery() && settings.saveToGallery && files.values.every((f) => !f.fileName.contains('/')),
          createdDirectories: {},
        ),
      ),
    );

    bool quickSave = settings.quickSave && server.getState().session?.message == null;
    final quickSaveFromFavorites = settings.quickSaveFromFavorites && server.getState().session?.message == null;
    if (quickSaveFromFavorites) {
      final bool isFavorite = server.ref.read(favoritesProvider).any((e) => e.fingerprint == senderFingerprint);
      if (isFavorite) {
        quickSave = true;
      }
    }

    if (quickSave) {
      // accept all files
      await acceptFileRequest({
        for (final f in files.values) f.id: f.fileName,
      });

      // ignore: use_build_context_synchronously, unawaited_futures
      Routerino.context.pushImmediately(
        () => ProgressPage(
          showAppBar: false,
          closeSessionOnClose: true,
          sessionId: sessionId,
        ),
      );
      return;
    }

    if (checkPlatformHasTray() && (await windowManager.isMinimized() || !(await windowManager.isVisible()) || !(await windowManager.isFocused()))) {
      await showFromTray();
    }

    final message = server.getState().session?.message;
    if (message != null) {
      // Message already received
      await server.ref
          .redux(receiveHistoryProvider)
          .dispatchAsync(
            AddHistoryEntryAction(
              entryId: const Uuid().v4(),
              fileName: message,
              fileType: FileType.text,
              path: null,
              savedToGallery: false,
              isMessage: true,
              fileSize: utf8.encode(message).length,
              senderAlias: server.getState().session!.senderAlias,
              timestamp: DateTime.now().toUtc(),
            ),
          );
    }

    final receiveProvider = ViewProvider((ref) {
      final session = ref.watch(serverProvider.select((state) => state?.session));
      return ReceivePageVm(
        status: session?.status,
        sender: session?.sender ?? Device.empty,
        showSenderInfo: true,
        files: session?.files.values.map((f) => f.file).toList() ?? [],
        message: message,
        onAccept: () async {
          if (message != null) {
            // accept nothing
            await ref.notifier(serverProvider).acceptFileRequest({});
            return;
          }

          final sessionId = ref.read(serverProvider)?.session?.sessionId;
          if (sessionId == null) {
            return;
          }

          final selectedFiles = ref.read(selectedReceivingFilesProvider);
          await ref.notifier(serverProvider).acceptFileRequest(selectedFiles);

          // ignore: use_build_context_synchronously
          await Routerino.context.pushAndRemoveUntilImmediately(
            removeUntil: ReceivePage,
            builder: () => ProgressPage(
              showAppBar: false,
              closeSessionOnClose: true,
              sessionId: sessionId,
            ),
          );
        },
        onDecline: () {
          ref.notifier(serverProvider).declineFileRequest();
        },
        onClose: () {
          ref.notifier(serverProvider).closeSession();
        },
      );
    });

    // ignore: use_build_context_synchronously, unawaited_futures
    Routerino.context.push(() => ReceivePage(receiveProvider));
  }

  /// An accepted file is being uploaded.
  /// The Rust server already validated the session, the file token and the
  /// sender's IP address; the file content is written by the Rust server to
  /// the target resolved here.
  Future<void> onFileUpload(HttpServerFileUploadEvent event) async {
    final receiveState = server.getStateOrNull()?.session;
    const allowedStates = {SessionStatus.sending, SessionStatus.finishedWithErrors};
    if (receiveState == null || receiveState.sessionId != event.sessionId || !allowedStates.contains(receiveState.status)) {
      _logger.warning('Rejecting upload of file ${event.fileId}: no matching active session');
      // Reject the upload (and any further ones) by cancelling the session on the Rust side.
      server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerCancelSessionAction(sessionId: event.sessionId));
      return;
    }

    final fileId = event.fileId;
    final receivingFile = receiveState.files[fileId];
    if (receivingFile == null || receivingFile.desiredName == null) {
      _logger.warning('Unexpected fileId: $fileId');
      server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerCancelSessionAction(sessionId: event.sessionId));
      return;
    }

    // begin of actual file transfer
    server.setState(
      (oldState) => oldState?.copyWith(
        session: receiveState.copyWith(
          files: {...receiveState.files}
            ..update(
              fileId,
              (_) => receivingFile.copyWith(
                status: FileStatus.sending,
              ),
            ),
          startTime: receiveState.startTime ?? DateTime.now().millisecondsSinceEpoch,
          status: SessionStatus.sending, // in case it was finishedWithErrors and user retries a failed file
        ),
      ),
    );
    final fileType = receivingFile.file.fileType;
    final shouldSaveToGallery = receiveState.saveToGallery && (fileType == FileType.image || fileType == FileType.video);

    String? filePath;
    bool savedToGallery = false;
    try {
      _logger.info('Saving ${receivingFile.file.fileName}');

      final target = await prepareFileSaveTarget(
        destinationDirectory: receiveState.destinationDirectory,
        fileName: receivingFile.desiredName!,
        saveToGallery: shouldSaveToGallery,
        isImage: fileType == FileType.image,
        createdDirectories: receiveState.createdDirectories,
        androidSdkInt: server.ref.read(deviceInfoProvider).androidSdkInt,
      );

      // The Rust server writes the file and reports the progress.
      await server.ref
          .redux(parentIsolateProvider)
          .dispatchTakeResult(
            IsolateHttpServerFileUploadTargetAction(
              sessionId: event.sessionId,
              fileId: fileId,
              path: target.path,
              fileDescriptor: target.fileDescriptor,
              fileSize: receivingFile.file.size,
              onProgress: (progress) {
                server.ref
                    .notifier(progressProvider)
                    .setProgress(
                      sessionId: receiveState.sessionId,
                      fileId: fileId,
                      progress: progress,
                    );
              },
            ),
          );

      await applyFileTimestamps(
        target: target,
        lastModified: receivingFile.file.metadata?.lastModified,
        lastAccessed: receivingFile.file.metadata?.lastAccessed,
      );

      if (shouldSaveToGallery) {
        (savedToGallery, filePath) = await saveCachedFileToGallery(
          cachedPath: target.displayPath,
          destinationDirectory: receiveState.destinationDirectory,
          fileName: receivingFile.desiredName!,
          isImage: fileType == FileType.image,
          createdDirectories: receiveState.createdDirectories,
        );
      } else {
        filePath = target.displayPath;
      }

      if (server.getStateOrNull()?.session == null || !allowedStates.contains(server.getState().session!.status)) {
        return;
      }
      server.setState(
        (oldState) => oldState?.copyWith(
          session: oldState.session?.fileFinished(
            fileId: fileId,
            status: FileStatus.finished,
            path: filePath,
            savedToGallery: savedToGallery,
            errorMessage: null,
          ),
        ),
      );

      // Track it in history
      await server.ref
          .redux(receiveHistoryProvider)
          .dispatchAsync(
            AddHistoryEntryAction(
              entryId: fileId,
              fileName: receivingFile.desiredName!,
              fileType: receivingFile.file.fileType,
              path: filePath,
              savedToGallery: savedToGallery,
              isMessage: false,
              fileSize: receivingFile.file.size,
              senderAlias: receiveState.senderAlias,
              timestamp: DateTime.now().toUtc(),
            ),
          );

      _logger.info('Saved ${receivingFile.file.fileName}.');
    } catch (e, st) {
      server.setState(
        (oldState) => oldState?.copyWith(
          session: oldState.session?.fileFinished(
            fileId: fileId,
            status: FileStatus.failed,
            path: null,
            savedToGallery: false,
            errorMessage: e.toString(),
          ),
        ),
      );
      _logger.severe('Failed to save file', e, st);

      // If the failure happened before the upload target was dispatched
      // (e.g. preparing the save target failed), the Rust server is still
      // waiting for it and the sender's request would hang forever.
      // Rejecting fails the request; a no-op if the target was already sent.
      server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerRejectFileUploadAction(sessionId: event.sessionId, fileId: fileId));
    }

    server.ref
        .notifier(progressProvider)
        .setProgress(
          sessionId: receiveState.sessionId,
          fileId: fileId,
          progress: 1,
        );

    final session = server.getStateOrNull()?.session;
    if (session == null) {
      return;
    }

    if (allowedStates.contains(session.status) && session.files.values.map((e) => e.status).isFinishedOrError) {
      final hasError = session.files.values.any((f) => f.status == FileStatus.failed);
      server.setState(
        (oldState) => oldState?.copyWith(
          session: oldState.session!.copyWith(
            status: hasError ? SessionStatus.finishedWithErrors : SessionStatus.finished,
            endTime: DateTime.now().millisecondsSinceEpoch,
          ),
        ),
      );
      final settings = server.ref.read(settingsProvider);
      bool quickSave = settings.quickSave && server.getState().session?.message == null;
      final quickSaveFromFavorites = settings.quickSaveFromFavorites && server.getState().session?.message == null;
      if (quickSaveFromFavorites) {
        final bool isFavorite = server.ref.read(favoritesProvider).any((e) => e.fingerprint == session.sender.fingerprint);
        if (isFavorite) {
          quickSave = true;
        }
      }
      if (quickSave) {
        // close the session **after** the response has been sent
        Future.delayed(Duration.zero, () {
          closeSession();
          _logger.info('Closing session');

          // ignore: use_build_context_synchronously, discarded_futures
          Routerino.context.pushRootImmediately(() => const HomePage(initialTab: HomeTab.receive, appStart: false));

          // open the dialog to open file instantly
          if (filePath != null && filePath.isNotEmpty) {
            // ignore: discarded_futures
            OpenFileDialog.open(
              Routerino.context, // ignore: use_build_context_synchronously
              filePath: filePath,
              fileType: fileType,
              openGallery: savedToGallery,
            );
          }
        });
      }
      _logger.info('Received all files.');
    }
  }

  /// An upload session ended on the Rust server.
  void onSessionEnd(HttpServerSessionEndEvent event) {
    final receiveSession = server.getStateOrNull()?.session;
    if (receiveSession == null || receiveSession.sessionId != event.sessionId) {
      return;
    }

    switch (event.reason) {
      case SessionEndReasonV2.finished:
        // Already handled when the last file finished.
        break;
      case SessionEndReasonV2.cancelled:
        _cancelBySender(server);
    }
  }

  /// The sender aborted the request while the user was still deciding.
  void onPrepareUploadAborted(HttpServerPrepareUploadAbortedEvent event) {
    final receiveSession = server.getStateOrNull()?.session;
    if (receiveSession == null || receiveSession.sessionId != event.sessionId || receiveSession.status != SessionStatus.waiting) {
      return;
    }

    _cancelBySender(server);
  }

  /// A remote device cancels a transfer this application is currently
  /// *sending* to it.
  void onCancelReceived(HttpServerCancelReceivedEvent event) {
    final sendSessions = server.ref.read(sendProvider);
    final selectedSession = sendSessions.values.firstWhereOrNull((s) => s.remoteSessionId == event.sessionId);
    if (selectedSession == null) {
      return;
    }

    if (selectedSession.target.ip != event.ip) {
      return;
    }

    if (selectedSession.status != SessionStatus.sending) {
      return;
    }

    server.ref
        .notifier(sendProvider)
        .cancelSessionByReceiver(
          selectedSession.sessionId,
        );
  }

  /// Another application instance requested the running application to show itself.
  /// The show token has already been checked by the Rust server.
  void onShow(HttpServerShowEvent event) {
    if (!checkPlatformIsDesktop()) {
      return;
    }

    // ignore: discarded_futures
    showFromTray().catchError((e) {
      // don't wait for it
      _logger.severe('Failed to show from tray', e);
    });

    final args = event.args;
    if (args.isEmpty) {
      return;
    }

    // ignore: unawaited_futures, discarded_futures
    server.ref.redux(selectedSendingFilesProvider).dispatchAsyncTakeResult(LoadSelectionFromArgsAction(args)).then((filesAdded) {
      if (filesAdded) {
        server.ref.redux(homePageControllerProvider).dispatch(ChangeTabAction(HomeTab.send));
      }
    });
  }

  /// Accepts the file request with the given [fileNameMap] (file id -> desired file name).
  Future<void> acceptFileRequest(Map<String, String> fileNameMap) async {
    final session = server.getStateOrNull()?.session;
    if (session == null || session.status != SessionStatus.waiting) {
      return;
    }

    if (fileNameMap.isEmpty) {
      // nothing selected, the Rust server responds with 204 and creates no session
      // This usually happens for message transfers
      server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerPrepareUploadDecisionAction(acceptedFileIds: []));
      closeSession();
      return;
    }

    server.setState(
      (oldState) {
        final receiveState = oldState!.session!;
        return oldState.copyWith(
          session: receiveState.copyWith(
            status: SessionStatus.sending,
            files: Map.fromEntries(
              receiveState.files.values.map((entry) {
                final desiredName = fileNameMap[entry.file.id];
                return MapEntry(
                  entry.file.id,
                  ReceivingFile(
                    file: entry.file,
                    status: desiredName != null ? FileStatus.queue : FileStatus.skipped,
                    token: null,
                    desiredName: desiredName,
                    path: null,
                    savedToGallery: false,
                    errorMessage: null,
                  ),
                );
              }),
            ),
          ),
        );
      },
    );

    if (checkPlatform([TargetPlatform.android, TargetPlatform.iOS])) {
      if (checkPlatform([TargetPlatform.android]) && !session.destinationDirectory.startsWith('/storage/emulated/0/Download')) {
        // Android requires more permission to save files outside of the Download directory
        try {
          final result = await Permission.storage.request();
          _logger.info('storage permission: $result');
        } catch (e) {
          _logger.warning('Could not request storage permission', e);
        }
      }
      try {
        await Permission.storage.request();
      } catch (e) {
        _logger.warning('Could not request storage permission', e);
      }
    }

    server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerPrepareUploadDecisionAction(acceptedFileIds: fileNameMap.keys.toList()));
  }

  void declineFileRequest() {
    final session = server.getStateOrNull()?.session;
    if (session == null || session.status != SessionStatus.waiting) {
      return;
    }

    server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerPrepareUploadDecisionAction(acceptedFileIds: null));
    closeSession();
  }

  /// Updates the destination directory for the current session.
  void setSessionDestinationDir(String destinationDirectory) {
    server.setState(
      (oldState) => oldState?.copyWith(
        session: oldState.session?.copyWith(
          destinationDirectory: destinationDirectory.replaceAll('\\', '/'),
        ),
      ),
    );
  }

  /// Updates the "saveToGallery" setting for the current session.
  void setSessionSaveToGallery(bool saveToGallery) {
    server.setState(
      (oldState) => oldState?.copyWith(
        session: oldState.session?.copyWith(
          saveToGallery: saveToGallery,
        ),
      ),
    );
  }

  /// In addition to [closeSession], this method also
  /// - cancels the session on the Rust server so that further uploads are rejected
  /// - notifies the sender that the session has been canceled
  void cancelSession() async {
    final session = server.getStateOrNull()?.session;
    if (session == null) {
      // the server is not running
      return;
    }

    // reject further uploads
    server.ref.redux(parentIsolateProvider).dispatch(IsolateHttpServerCancelSessionAction(sessionId: session.sessionId));

    // notify sender
    final target = session.sender;
    try {
      server.ref
          .read(httpProvider)
          .v2
          // ignore: unawaited_futures
          .cancel(
            protocol: target.getProtocolType(),
            ip: target.ip!,
            port: target.port,
            sessionId: session.sessionId,
          );
    } catch (e) {
      _logger.warning('Failed to notify sender', e);
    }

    closeSession();
  }

  void closeSession() {
    final sessionId = server.getStateOrNull()?.session?.sessionId;
    if (sessionId == null) {
      return;
    }

    server.setState(
      (oldState) => oldState?.copyWith(
        session: null,
      ),
    );
    server.ref.notifier(progressProvider).removeSession(sessionId);
  }
}

void _cancelBySender(ServerUtils server) {
  final receiveSession = server.getStateOrNull()?.session;
  if (receiveSession == null) {
    return;
  }

  if (receiveSession.status == SessionStatus.waiting) {
    // received cancel during accept/decline
    // pop just in case if user is in [ReceiveOptionsPage]
    Routerino.context.popUntil(ReceivePage);
  }

  server.setState(
    (oldState) => oldState?.copyWith(
      session: oldState.session?.copyWith(
        status: SessionStatus.canceledBySender,
        endTime: DateTime.now().millisecondsSinceEpoch,
      ),
    ),
  );
}

extension on ReceiveSessionState {
  ReceiveSessionState fileFinished({
    required String fileId,
    required FileStatus status,
    required String? path,
    required bool savedToGallery,
    required String? errorMessage,
  }) {
    return copyWith(
      files: {...files}
        ..update(
          fileId,
          (file) => file.copyWith(
            status: status,
            path: path,
            savedToGallery: savedToGallery,
            errorMessage: errorMessage,
          ),
        ),
    );
  }
}
