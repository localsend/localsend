import 'dart:async';
import 'dart:convert';

import 'package:common/model/device.dart';
import 'package:common/model/dto/file_dto.dart';
import 'package:common/model/file_status.dart';
import 'package:common/model/session_status.dart';
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
import 'package:localsend_app/rust/api/quic.dart' as quic;
import 'package:localsend_app/rust/api/stream.dart';
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
    } catch (e) {
      _logger.warning('Failed to connect via QUIC', e);
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

    // Send files sequentially via QUIC
    for (final entry in updatedFiles.entries) {
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

      try {
        // Start progress polling timer — reads atomic counter from Rust.
        final fileSize = file.file.size;
        Timer? progressTimer;
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
          // Use mmap for file path
          await quic.quicSendFileMmap(
            transfer: transfer,
            filePath: file.path!,
            fileId: file.file.id,
            token: file.token!,
          );
        } else if (file.bytes != null) {
          // Use stream for in-memory bytes
          final (sink, receiver) = await createStream();

          // Push bytes to the stream in the background
          final streamFuture = () async {
            await sink.add(data: file.bytes!);
          }();

          final uploadFuture = quic.quicSendFileStream(
            transfer: transfer,
            fileId: file.file.id,
            token: file.token!,
            data: receiver,
          );

          await Future.wait([streamFuture, uploadFuture]);
        }

        // Stop progress polling
        progressTimer?.cancel();

        // Wait for receiver ACK
        final ack = await quic.quicWaitFileAck(transfer: transfer);
        _logger.info('File ACK received: $ack');

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
        _logger.warning('Failed to send file via QUIC: ${file.file.fileName}', e, st);
        state = _updateSession(
          sessionId,
          (s) => s?.withFileStatus(file.file.id, FileStatus.failed, e.toString()),
        );
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

    // Signal done
    try {
      await quic.quicDone(transfer: transfer);
    } catch (e) {
      _logger.warning('Failed to send QUIC done signal', e);
    }
  }

  /// Cancels the session and sends cancel to the receiver.
  void cancelSession(String sessionId) {
    final sessionState = state[sessionId];
    if (sessionState == null) return;

    state = _updateSession(
      sessionId,
      (s) => s?.copyWith(
        status: SessionStatus.canceledBySender,
        endTime: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  /// Closes and removes the session.
  void closeSession(String sessionId) {
    final sessionState = state[sessionId];
    if (sessionState == null) return;
    ref.notifier(progressProvider).removeSession(sessionId);
    state = {...state}..remove(sessionId);

    if (sessionState.status == SessionStatus.finished && ref.read(settingsProvider).sendMode == SendMode.single) {
      ref.redux(selectedSendingFilesProvider).dispatch(ClearSelectionAction());
    }
  }

  void clearAllSessions() {
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
