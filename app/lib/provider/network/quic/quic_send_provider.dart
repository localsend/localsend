import 'dart:async';
import 'dart:convert';

import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/send_mode.dart';
import 'package:localsend_app/model/state/send/send_session_state.dart';
import 'package:localsend_app/model/state/send/sending_file.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/send_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_status.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:localsend_isolates/rust/api/quic.dart' as quic;
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();
final _logger = Logger('QuicSend');

/// This provider manages sending files to other devices via QUIC.
/// It mirrors the HTTP [sendProvider] but uses QUIC transport.
final quicSendProvider = NotifierProvider<QuicSendService, Map<String, SendSessionState>>(
  (ref) => QuicSendService(),
);

class QuicSendService extends Notifier<Map<String, SendSessionState>> {
  // Active transfers keyed by sessionId — used for cancel/close.
  final Map<String, quic.RsQuicSendTransfer> _transfers = {};

  @override
  Map<String, SendSessionState> init() => {};

  /// Starts a QUIC send session to the given [target] device.
  Future<void> startSession({
    required Device target,
    required List<CrossFile> files,
    required bool background,
  }) async {
    final sessionId = _uuid.v4();

    // Build the file map
    final sendingFiles = <String, SendingFile>{};
    final filesJsonMap = <String, Map<String, dynamic>>{};
    for (final file in files) {
      final id = _uuid.v4();
      final fileDto = FileDto(
        id: id,
        fileName: file.name,
        size: file.size,
        fileType: file.fileType,
        hash: null,
        preview: null,
        metadata: file.lastModified != null || file.lastAccessed != null
            ? FileMetadata(
                lastModified: file.lastModified,
                lastAccessed: file.lastAccessed,
              )
            : null,
      );
      sendingFiles[id] = SendingFile(
        file: fileDto,
        status: FileStatus.queue,
        token: null,
        thumbnail: file.thumbnail,
        asset: file.asset,
        path: file.path,
        bytes: file.bytes,
        errorMessage: null,
      );
      filesJsonMap[id] = FileDtoMapper().encode(fileDto) as Map<String, dynamic>;
    }

    final requestState = SendSessionState(
      sessionId: sessionId,
      remoteSessionId: null,
      background: background,
      status: SessionStatus.waiting,
      target: target,
      files: sendingFiles,
      startTime: null,
      endTime: null,
      sendingTasks: [],
      errorMessage: null,
    );

    state = _updateSession(sessionId, (_) => requestState);

    if (!background) {
      // ignore: use_build_context_synchronously, unawaited_futures
      Routerino.context.push(
        () => SendPage(showAppBar: false, closeSessionOnClose: true, sessionId: sessionId),
        transition: RouterinoTransition.fade(),
      );
    }

    // Create QUIC client and connect
    final securityContext = ref.read(securityProvider);
    final originDevice = ref.read(deviceFullInfoProvider);

    quic.RsQuicSendTransfer? transfer;
    try {
      // Don't pass our own cert — the server presents *its* cert.
      // Use the danger verifier and verify fingerprint post-connection.
      final client = await quic.quicClientNew(
        serverCertPem: null,
      );

      // QUIC server listens on port+1 to avoid UDP conflict with multicast
      final quicPort = target.port + 1;
      final addr = target.ip!.contains(':') ? '[${target.ip}]:$quicPort' : '${target.ip}:$quicPort';
      transfer = await quic.quicClientConnect(
        client: client,
        addr: addr,
        alias: originDevice.alias,
        fingerprint: securityContext.certificateHash,
      );

      _logger.info('QUIC connected to $addr');
      _transfers[sessionId] = transfer;
    } catch (e) {
      state = _updateSession(
        sessionId,
        (s) => s?.copyWith(
          status: SessionStatus.finishedWithErrors,
          errorMessage: 'QUIC connection failed: $e',
        ),
      );
      return;
    }

    // Send prepare-upload (file list)
    String? responseJson;
    try {
      responseJson = await quic.quicPrepareUpload(
        transfer: transfer,
        filesJson: jsonEncode(filesJsonMap),
      );
    } catch (e) {
      _logger.warning('QUIC prepare-upload failed', e);
      state = _updateSession(
        sessionId,
        (s) => s?.copyWith(
          status: SessionStatus.finishedWithErrors,
          errorMessage: 'QUIC prepare-upload failed: $e',
        ),
      );
      return;
    }

    if (responseJson == null) {
      // Declined
      state = _updateSession(
        sessionId,
        (s) => s?.copyWith(status: SessionStatus.declined),
      );
      return;
    }

    // Parse response: { "sessionId": "...", "files": { "fileId": "token" } }
    final Map<String, dynamic> responseMap;
    try {
      responseMap = jsonDecode(responseJson) as Map<String, dynamic>;
    } catch (e) {
      _logger.warning('Failed to parse QUIC prepare-upload response', e);
      state = _updateSession(
        sessionId,
        (s) => s?.copyWith(
          status: SessionStatus.finishedWithErrors,
          errorMessage: 'Invalid response from receiver',
        ),
      );
      return;
    }

    final remoteSessionId = responseMap['sessionId'] as String?;
    final fileTokens = (responseMap['files'] as Map<String, dynamic>?) ?? {};

    if (remoteSessionId != null) {
      state = _updateSession(
        sessionId,
        (s) => s?.copyWith(remoteSessionId: remoteSessionId),
      );
    }

    // Update files with tokens
    final updatedFiles = <String, SendingFile>{};
    for (final entry in sendingFiles.entries) {
      final token = fileTokens[entry.key] as String?;
      if (token != null) {
        updatedFiles[entry.key] = entry.value.copyWith(token: token);
      } else {
        updatedFiles[entry.key] = entry.value.copyWith(status: FileStatus.skipped);
      }
    }

    // Navigate to progress page
    if (!background) {
      Routerino.context.pushAndRemoveUntil(
        removeUntil: HomePage,
        transition: RouterinoTransition.fade(),
        builder: () => ProgressPage(
          showAppBar: ref.read(settingsProvider).sendMode == SendMode.multiple,
          closeSessionOnClose: ref.read(settingsProvider).sendMode != SendMode.multiple,
          sessionId: sessionId,
        ),
      );
    }

    state = _updateSession(
      sessionId,
      (s) => s?.copyWith(
        status: SessionStatus.sending,
        files: updatedFiles,
        startTime: DateTime.now().millisecondsSinceEpoch,
      ),
    );

    // Send files via QUIC — parallel when multiple path-based files,
    // sequential for single files or mixed (path + bytes) scenarios.
    final pathFiles = updatedFiles.entries
        .where((e) => e.value.status != FileStatus.skipped && e.value.token != null && e.value.path != null)
        .toList();
    final bytesFiles = updatedFiles.entries
        .where((e) => e.value.status != FileStatus.skipped && e.value.token != null && e.value.path == null && e.value.bytes != null)
        .toList();

    if (pathFiles.length >= 2 && bytesFiles.isEmpty) {
      // ─── Parallel path: 2+ file-path files ────────────────────────────
      _logger.info('Sending ${pathFiles.length} files in parallel via QUIC');

      // Mark all as sending (single batched state update to avoid
      // N separate state → watcher notifications for large file sets).
      state = _updateSession(sessionId, (s) {
        if (s == null) return null;
        final newFiles = <String, SendingFile>{...s.files};
        for (final entry in pathFiles) {
          newFiles[entry.value.file.id] = newFiles[entry.value.file.id]!.copyWith(
            status: FileStatus.sending,
            errorMessage: null,
          );
        }
        return s.copyWith(files: newFiles);
      });

      // Start per-file progress polling
      final progressTimer = Timer.periodic(
        const Duration(milliseconds: 200),
        (_) async {
          try {
            final progressJson = await quic.quicGetParallelSendProgress(transfer: transfer!);
            final progressMap = jsonDecode(progressJson) as Map<String, dynamic>;
            for (final entry in progressMap.entries) {
              final file = state[sessionId]?.files[entry.key];
              if (file != null && file.file.size > 0) {
                final progress = (entry.value as num).toDouble() / file.file.size;
                ref
                    .notifier(progressProvider)
                    .setProgress(
                      sessionId: sessionId,
                      fileId: entry.key,
                      progress: progress,
                    );
                // Mark individual files as finished as they complete,
                // so the UI file counter updates incrementally.
                if (progress >= 1.0 && file.status != FileStatus.finished) {
                  state = _updateSession(
                    sessionId,
                    (s) => s?.withFileStatus(entry.key, FileStatus.finished, null),
                  );
                }
              }
            }
          } catch (_) {}
        },
      );

      try {
        final filesList = pathFiles
            .map(
              (e) => {
                'filePath': e.value.path!,
                'fileId': e.key,
                'token': e.value.token!,
              },
            )
            .toList();

        await quic.quicSendFilesParallel(
          transfer: transfer!,
          filesJson: jsonEncode(filesList),
        );

        progressTimer.cancel();

        // Mark all as finished
        for (final entry in pathFiles) {
          ref
              .notifier(progressProvider)
              .setProgress(
                sessionId: sessionId,
                fileId: entry.key,
                progress: 1,
              );
          state = _updateSession(
            sessionId,
            (s) => s?.withFileStatus(entry.value.file.id, FileStatus.finished, null),
          );
        }
      } catch (e, st) {
        progressTimer.cancel();
        _logger.warning('Parallel QUIC send failed', e, st);
        // Mark all in-progress files as failed
        for (final entry in pathFiles) {
          final current = state[sessionId]?.files[entry.key];
          if (current?.status == FileStatus.sending) {
            state = _updateSession(
              sessionId,
              (s) => s?.withFileStatus(entry.value.file.id, FileStatus.failed, e.toString()),
            );
          }
        }
      }
    } else {
      // ─── Sequential path: single file, or mixed path+bytes ─────────────
      final allFiles = [...pathFiles, ...bytesFiles];
      for (final entry in allFiles) {
        final file = entry.value;
        if (file.status == FileStatus.skipped || file.token == null) continue;

        final currentStatus = state[sessionId]?.status;
        if (currentStatus != SessionStatus.sending && currentStatus != SessionStatus.finishedWithErrors) {
          break;
        }

        _logger.info('Sending file via QUIC: ${file.file.fileName}');
        state = _updateSession(
          sessionId,
          (s) => s?.withFileStatus(file.file.id, FileStatus.sending, null),
        );

        Timer? progressTimer;
        try {
          // Start progress polling timer — reads atomic counter from Rust.
          final fileSize = file.file.size;
          if (file.path != null) {
            progressTimer = Timer.periodic(
              const Duration(milliseconds: 200),
              (_) async {
                final bytes = await quic.quicGetSendProgress(transfer: transfer!);
                if (fileSize > 0) {
                  ref
                      .notifier(progressProvider)
                      .setProgress(
                        sessionId: sessionId,
                        fileId: file.file.id,
                        progress: bytes.toDouble() / fileSize,
                      );
                }
              },
            );
          }

          if (file.path != null) {
            await quic.quicSendSingleFile(
              transfer: transfer!,
              filePath: file.path!,
              fileId: file.file.id,
              token: file.token!,
            );
          } else if (file.bytes != null) {
            await quic.quicSendBytes(
              transfer: transfer!,
              data: file.bytes!,
              fileId: file.file.id,
              token: file.token!,
            );
          }

          progressTimer?.cancel();

          ref
              .notifier(progressProvider)
              .setProgress(
                sessionId: sessionId,
                fileId: file.file.id,
                progress: 1,
              );

          state = _updateSession(
            sessionId,
            (s) => s?.withFileStatus(file.file.id, FileStatus.finished, null),
          );
        } catch (e, st) {
          progressTimer?.cancel();
          _logger.warning('Failed to send file via QUIC: ${file.file.fileName}', e, st);
          state = _updateSession(
            sessionId,
            (s) => s?.withFileStatus(file.file.id, FileStatus.failed, e.toString()),
          );
        }
      }
    }

    // Check final status
    final sessionState = state[sessionId];
    if (sessionState != null && sessionState.status == SessionStatus.sending) {
      final hasError = sessionState.files.values.any((f) => f.status == FileStatus.failed);
      state = _updateSession(
        sessionId,
        (s) => s?.copyWith(
          status: hasError ? SessionStatus.finishedWithErrors : SessionStatus.finished,
          endTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );

      if (!hasError && sessionState.background) {
        closeSession(sessionId);
      }

      _logger.info('QUIC send session $sessionId finished');
    }

    // Signal done — only if session wasn't canceled or already errored.
    final finalState = state[sessionId];
    if (finalState != null && finalState.status != SessionStatus.canceledBySender && finalState.status != SessionStatus.canceledByReceiver) {
      try {
        await quic.quicDone(transfer: transfer);
      } catch (e) {
        _logger.warning('Failed to send QUIC done signal', e);
      }
    }
  }

  /// Cancels the session, signals the receiver, and closes the connection.
  Future<void> cancelSession(String sessionId) async {
    final sessionState = state[sessionId];
    if (sessionState == null) return;

    state = _updateSession(
      sessionId,
      (s) => s?.copyWith(
        status: SessionStatus.canceledBySender,
        endTime: DateTime.now().millisecondsSinceEpoch,
      ),
    );

    // Signal the Rust side to abort in-flight I/O, send Cancel frame,
    // and close the QUIC connection.
    final transfer = _transfers[sessionId];
    if (transfer != null) {
      try {
        await quic.quicCancel(
          transfer: transfer,
          sessionId: sessionState.remoteSessionId ?? sessionId,
        );
      } catch (e) {
        _logger.warning('Failed to cancel QUIC transfer: $e');
      }
      _transfers.remove(sessionId);
    }
  }

  /// Closes and removes the session.
  void closeSession(String sessionId) {
    final sessionState = state[sessionId];
    if (sessionState == null) return;
    ref.notifier(progressProvider).removeSession(sessionId);
    _transfers.remove(sessionId);
    state = {...state}..remove(sessionId);

    if (sessionState.status == SessionStatus.finished && ref.read(settingsProvider).sendMode == SendMode.single) {
      ref.redux(selectedSendingFilesProvider).dispatch(ClearSelectionAction());
    }
  }

  void clearAllSessions() {
    _transfers.clear();
    state = {};
    ref.notifier(progressProvider).removeAllSessions();
  }

  Map<String, SendSessionState> _updateSession(
    String sessionId,
    SendSessionState? Function(SendSessionState? old) updater,
  ) {
    final newState = updater(state[sessionId]);
    if (newState == null) return state;
    return {...state, sessionId: newState};
  }
}

extension on SendSessionState {
  SendSessionState withFileStatus(String fileId, FileStatus status, String? errorMessage) {
    return copyWith(
      files: {...files}
        ..update(
          fileId,
          (file) => file.copyWith(status: status, errorMessage: errorMessage),
        ),
    );
  }
}
