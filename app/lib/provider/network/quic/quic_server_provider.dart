import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:common/constants.dart';
import 'package:common/model/device.dart';
import 'package:common/model/dto/file_dto.dart';
import 'package:common/model/file_status.dart';
import 'package:common/model/file_type.dart';
import 'package:common/model/session_status.dart';
import 'package:gal/gal.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/provider/receive_history_provider.dart';
import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/rust/api/quic.dart' as quic;
import 'package:localsend_app/util/native/directories.dart';
import 'package:localsend_app/util/native/file_saver.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
import 'package:logging/logging.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;
import 'package:refena_flutter/refena_flutter.dart';
import 'package:saf_stream/saf_stream.dart';
import 'package:routerino/routerino.dart';
import 'package:uuid/uuid.dart';
import 'package:window_manager/window_manager.dart';

const _uuid = Uuid();
final _logger = Logger('QuicServer');
final _saf = SafStream();

/// State for the QUIC server.
class QuicServerState {
  final quic.RsQuicServer server;
  final int port;
  final String localAddr;

  /// Active receive session (if any).
  final ReceiveSessionState? session;

  const QuicServerState({
    required this.server,
    required this.port,
    required this.localAddr,
    this.session,
  });

  QuicServerState copyWith({
    ReceiveSessionState? session,
    bool clearSession = false,
  }) {
    return QuicServerState(
      server: server,
      port: port,
      localAddr: localAddr,
      session: clearSession ? null : (session ?? this.session),
    );
  }
}

/// This provider manages a QUIC server for receiving files.
/// It runs alongside the HTTP server, accepting QUIC connections
/// from senders that support QUIC transport.
final quicServerProvider = NotifierProvider<QuicServerService, QuicServerState?>(
  (ref) => QuicServerService(),
);

class QuicServerService extends Notifier<QuicServerState?> {
  @override
  QuicServerState? init() => null;

  /// Starts the QUIC server on the given port using the app's TLS certificate.
  Future<QuicServerState?> startServer({required int port}) async {
    if (state != null) {
      _logger.info('QUIC server already running at ${state!.localAddr}');
      return state;
    }

    final securityContext = ref.read(securityProvider);

    _logger.info('Starting QUIC server on port $port...');
    final server = await quic.quicServerStart(
      port: port,
      certPem: securityContext.certificate,
      keyPem: securityContext.privateKey,
    );

    final localAddr = await quic.quicServerLocalAddr(server: server);
    _logger.info('QUIC server started at $localAddr');

    final newState = QuicServerState(
      server: server,
      port: port,
      localAddr: localAddr,
    );
    state = newState;

    // Start accepting connections in the background.
    _acceptLoop(server);

    return newState;
  }

  /// Background loop that accepts incoming QUIC connections.
  void _acceptLoop(quic.RsQuicServer server) async {
    final securityContext = ref.read(securityProvider);
    final originDevice = ref.read(deviceFullInfoProvider);
    while (true) {
      try {
        final (transfer, senderInfoJson) = await quic.quicServerAccept(
          server: server,
          serverAlias: originDevice.alias,
          serverFingerprint: securityContext.certificateHash,
        );

        // If the current state has been disposed, stop the loop.
        if (state == null) break;

        _handleIncomingTransfer(transfer, senderInfoJson);
      } catch (e) {
        if (state == null) break; // server stopped
        _logger.warning('Error accepting QUIC connection', e);
      }
    }
  }

  /// Handles a single incoming QUIC transfer.
  void _handleIncomingTransfer(quic.RsQuicReceiveTransfer transfer, String senderInfoJson) async {
    try {
      await _handleIncomingTransferInner(transfer, senderInfoJson);
    } catch (e, st) {
      _logger.warning('Error handling QUIC transfer', e, st);
      // Try to decline if something went wrong before accept
      try {
        await quic.quicDecline(transfer: transfer);
      } catch (_) {}
    }
  }

  Future<void> _handleIncomingTransferInner(quic.RsQuicReceiveTransfer transfer, String senderInfoJson) async {
    // Check if already in a session (synchronous check before any await)
    if (state?.session != null) {
      _logger.info('Already in a session, declining QUIC transfer');
      await quic.quicDecline(transfer: transfer);
      return;
    }

    _logger.info('Receiving file list via QUIC...');

    // Receive the file list (JSON-encoded map of fileId -> FileDto JSON)
    final filesJson = await quic.quicReceiveFileList(transfer: transfer);

    // Re-check after await — another connection may have started a session
    if (state?.session != null) {
      _logger.info('Session started by another connection, declining');
      await quic.quicDecline(transfer: transfer);
      return;
    }
    final Map<String, dynamic> filesMap;
    try {
      filesMap = jsonDecode(filesJson) as Map<String, dynamic>;
    } catch (e) {
      _logger.warning('Failed to parse file list from QUIC sender', e);
      await quic.quicDecline(transfer: transfer);
      return;
    }

    // Parse files
    final Map<String, ReceivingFile> receivingFiles = {};
    for (final entry in filesMap.entries) {
      final fileDto = FileDtoMapper().decode(entry.value);
      receivingFiles[entry.key] = ReceivingFile(
        file: fileDto,
        status: FileStatus.queue,
        token: null,
        desiredName: null,
        path: null,
        savedToGallery: false,
        errorMessage: null,
      );
    }

    if (receivingFiles.isEmpty) {
      await quic.quicDecline(transfer: transfer);
      return;
    }

    final settings = ref.read(settingsProvider);
    final destinationDir = settings.destination ?? await getDefaultDestinationDirectory();
    final cacheDir = await getCacheDirectory();
    final sessionId = _uuid.v4();

    _logger.info('QUIC session $sessionId: ${receivingFiles.length} files from sender');

    // Parse sender info from the Hello handshake.
    String senderAlias = 'QUIC Sender';
    String senderFingerprint = '';
    String senderVersion = protocolVersion;
    try {
      final info = jsonDecode(senderInfoJson) as Map<String, dynamic>;
      senderAlias = info['alias'] as String? ?? senderAlias;
      senderFingerprint = info['fingerprint'] as String? ?? senderFingerprint;
      senderVersion = info['version'] as String? ?? senderVersion;
    } catch (e) {
      _logger.warning('Failed to parse sender info from QUIC handshake', e);
    }

    // Create a sender device from the handshake info.
    final sender = Device(
      signalingId: null,
      ip: null, // QUIC doesn't expose IP directly through FFI yet
      version: senderVersion,
      port: state!.port,
      https: true,
      fingerprint: senderFingerprint,
      alias: senderAlias,
      deviceModel: null,
      deviceType: DeviceType.desktop,
      download: false,
      discoveryMethods: {},
      supportsQuic: true,
    );

    final streamController = StreamController<Map<String, String>?>();

    state = state!.copyWith(
      session: ReceiveSessionState(
        sessionId: sessionId,
        status: SessionStatus.waiting,
        sender: sender,
        senderAlias: sender.alias,
        files: receivingFiles,
        startTime: null,
        endTime: null,
        destinationDirectory: destinationDir,
        cacheDirectory: cacheDir,
        saveToGallery: checkPlatformWithGallery() && settings.saveToGallery && receivingFiles.values.every((f) => !f.file.fileName.contains('/')),
        createdDirectories: {},
        responseHandler: streamController,
      ),
    );

    // Quick-save or show receive page
    bool quickSave = settings.quickSave;
    final quickSaveFromFavorites = settings.quickSaveFromFavorites;
    if (quickSaveFromFavorites) {
      final bool isFavorite = ref.read(favoritesProvider).any((e) => e.fingerprint == sender.fingerprint);
      if (isFavorite) {
        quickSave = true;
      }
    }

    final Map<String, String>? selection;
    if (quickSave) {
      selection = {
        for (final f in receivingFiles.values) f.file.id: f.file.fileName,
      };
    } else {
      if (checkPlatformHasTray() && (await windowManager.isMinimized() || !(await windowManager.isVisible()) || !(await windowManager.isFocused()))) {
        await showFromTray();
      }

      final receiveProvider = ViewProvider((r) {
        final session = r.watch(quicServerProvider.select((s) => s?.session));
        return ReceivePageVm(
          status: session?.status,
          sender: session?.sender ?? Device.empty,
          showSenderInfo: true,
          files: session?.files.values.map((f) => f.file).toList() ?? [],
          message: null,
          onAccept: () async {
            final sid = r.read(quicServerProvider)?.session?.sessionId;
            if (sid == null) return;
            final selectedFiles = r.read(selectedReceivingFilesProvider);
            r.notifier(quicServerProvider).acceptFileRequest(selectedFiles);
            await Routerino.context.pushAndRemoveUntilImmediately(
              removeUntil: ReceivePage,
              builder: () => ProgressPage(
                showAppBar: false,
                closeSessionOnClose: true,
                sessionId: sid,
              ),
            );
          },
          onDecline: () {
            r.notifier(quicServerProvider).declineFileRequest();
          },
          onClose: () {
            r.notifier(quicServerProvider).closeSession();
          },
        );
      });

      // ignore: use_build_context_synchronously, unawaited_futures
      Routerino.context.push(() => ReceivePage(receiveProvider));

      selection = await streamController.stream.first;
    }

    if (state?.session == null) {
      await quic.quicDecline(transfer: transfer);
      return;
    }

    if (selection == null) {
      closeSession();
      await quic.quicDecline(transfer: transfer);
      return;
    }

    if (selection.isEmpty) {
      closeSession();
      await quic.quicDecline(transfer: transfer);
      return;
    }

    // Build file tokens
    final fileTokens = <String, String>{};
    final updatedFiles = <String, ReceivingFile>{};
    for (final entry in receivingFiles.entries) {
      final desiredName = selection[entry.key];
      if (desiredName != null) {
        final token = _uuid.v4();
        fileTokens[entry.key] = token;
        updatedFiles[entry.key] = entry.value.copyWith(
          status: FileStatus.queue,
          token: token,
          desiredName: desiredName,
        );
      } else {
        updatedFiles[entry.key] = entry.value.copyWith(
          status: FileStatus.skipped,
        );
      }
    }

    state = state!.copyWith(
      session: state!.session!.copyWith(
        status: SessionStatus.sending,
        files: updatedFiles,
        responseHandler: null,
      ),
    );

    // Accept the files on the QUIC side
    await quic.quicAcceptFiles(
      transfer: transfer,
      sessionId: sessionId,
      fileTokensJson: jsonEncode(fileTokens),
    );

    if (quickSave) {
      // ignore: use_build_context_synchronously, unawaited_futures
      Routerino.context.pushImmediately(
        () => ProgressPage(
          showAppBar: false,
          closeSessionOnClose: true,
          sessionId: sessionId,
        ),
      );
    }

    // Receive each file
    final receiveState = state!.session!;
    for (final entry in updatedFiles.entries) {
      final file = entry.value;
      if (file.status == FileStatus.skipped || file.token == null) continue;

      _logger.info('Receiving file via QUIC: ${file.desiredName}');

      state = state!.copyWith(
        session: state!.session!.copyWith(
          files: {...state!.session!.files}..update(entry.key, (_) => file.copyWith(status: FileStatus.sending)),
          startTime: state!.session!.startTime ?? DateTime.now().millisecondsSinceEpoch,
        ),
      );

      final fileType = file.file.fileType;
      final shouldSaveToGallery = state!.session!.saveToGallery && (fileType == FileType.image || fileType == FileType.video);

      String? filePath;
      bool savedToGallery = false;
      try {
        // When saving to gallery, write to cache first so the file can be
        // deleted cleanly after the gallery import.
        final outputDir = shouldSaveToGallery ? state!.session!.cacheDirectory : receiveState.destinationDirectory;

        // Use the same path digestion as HTTP: handles name collisions,
        // filename legalization, subdirectory creation, and content:// URIs.
        final (resolvedPath, documentUri, finalName) = await digestFilePathAndPrepareDirectory(
          parentDirectory: outputDir,
          fileName: file.desiredName!,
          createdDirectories: state!.session!.createdDirectories,
        );

        // Validate path is within the expected directory (prevent traversal)
        if (!p.isWithin(outputDir, resolvedPath) && !resolvedPath.startsWith('content://')) {
          throw 'Path traversal detected: ${file.desiredName}';
        }

        // For content:// URIs (SAF on Android), write to temp file first,
        // then copy via SAF.
        String actualOutputPath = resolvedPath;
        bool needsSafCopy = resolvedPath.startsWith('content://') || documentUri != null;

        if (needsSafCopy) {
          // Write to cache first, then copy via SAF
          actualOutputPath = '${state!.session!.cacheDirectory}/$finalName';
        }

        // Start progress polling timer — reads atomic counter from Rust.
        final fileSize = file.file.size;
        Timer? progressTimer;
        progressTimer = Timer.periodic(
          const Duration(milliseconds: 200),
          (_) async {
            final bytes = await quic.quicGetReceiveProgress(transfer: transfer);
            if (fileSize > 0) {
              ref
                  .notifier(progressProvider)
                  .setProgress(
                    sessionId: sessionId,
                    fileId: entry.key,
                    progress: bytes.toDouble() / fileSize,
                  );
            }
          },
        );

        // Receive the file using chunked API to avoid FRB SSE timeout.
        // Step 1: accept uni stream, read header, open output file.
        final startJson = await quic.quicReceiveFileStart(
          transfer: transfer,
          outputPath: actualOutputPath,
        );
        // startJson contains fileId and token for reference if needed.
        jsonDecode(startJson); // validate JSON

        // Step 2: read chunks in a loop. Each FFI call is short (bounded
        // by maxBytes), so FRB never times out.
        const chunkSize = 64 * 1024 * 1024; // 64 MiB per chunk
        bool eof = false;
        while (!eof) {
          final chunkJson = await quic.quicReceiveFileReadChunk(
            transfer: transfer,
            maxBytes: BigInt.from(chunkSize),
          );
          final chunkMap = jsonDecode(chunkJson) as Map<String, dynamic>;
          eof = chunkMap['eof'] as bool;
        }

        // Step 3: flush writer, send ACK, clean up.
        final finishJson = await quic.quicReceiveFileFinish(
          transfer: transfer,
        );

        // Stop progress polling
        progressTimer.cancel();

        final resultMap = jsonDecode(finishJson) as Map<String, dynamic>;
        final bytesWritten = (resultMap['bytesWritten'] as num).toInt();

        _logger.info('Received $bytesWritten bytes for $finalName');

        // If SAF copy is needed, stream from cache to the content URI in chunks.
        if (needsSafCopy) {
          final safPath = documentUri ?? resolvedPath;
          _logger.info('Copying to SAF: $safPath as $finalName');
          final tempFile = File(actualOutputPath);

          final safSession = await _saf.startWriteStream(
            safPath,
            finalName,
            lookupMimeType(finalName) ?? '*/*',
          );
          // Stream in chunks to avoid loading the entire file into RAM.
          final input = tempFile.openRead();
          await for (final chunk in input) {
            await _saf.writeChunk(safSession.session, Uint8List.fromList(chunk));
          }
          await _saf.endWriteStream(safSession.session);
          await tempFile.delete();
          filePath = resolvedPath; // keep the content URI for reference
        } else {
          filePath = actualOutputPath;
        }

        // Save to gallery if requested (mobile only)
        if (shouldSaveToGallery) {
          try {
            fileType == FileType.image ? await Gal.putImage(filePath) : await Gal.putVideo(filePath);
            await File(filePath).delete();
            savedToGallery = true;
            filePath = null; // no longer at this path
          } on GalException catch (e) {
            if (e.type == GalExceptionType.notSupportedFormat) {
              _logger.info('Format not supported by gallery, keeping file in destination');
              // Move from cache to destination directory
              final destPath = '${receiveState.destinationDirectory}/${file.desiredName}';
              await File(actualOutputPath).rename(destPath);
              filePath = destPath;
              savedToGallery = false;
            } else {
              rethrow;
            }
          }
        }

        // ACK is already sent inside quicReceiveFileFinish (avoids FRB timeout).

        // Update progress
        ref
            .notifier(progressProvider)
            .setProgress(
              sessionId: sessionId,
              fileId: entry.key,
              progress: 1,
            );

        // Mark as finished
        state = state!.copyWith(
          session: _fileFinished(
            state!.session!,
            fileId: entry.key,
            status: FileStatus.finished,
            path: filePath,
            savedToGallery: savedToGallery,
            errorMessage: null,
          ),
        );

        // Track in receive history
        await ref
            .redux(receiveHistoryProvider)
            .dispatchAsync(
              AddHistoryEntryAction(
                entryId: entry.key,
                fileName: file.desiredName!,
                fileType: file.file.fileType,
                path: filePath,
                savedToGallery: savedToGallery,
                isMessage: false,
                fileSize: file.file.size,
                senderAlias: state!.session!.senderAlias,
                timestamp: DateTime.now().toUtc(),
              ),
            );

        _logger.info('Received file via QUIC: ${file.desiredName}');
      } catch (e, st) {
        _logger.severe('Failed to receive file via QUIC: ${file.desiredName}', e, st);

        // Send error ACK to sender
        try {
          await quic.quicAckFile(
            transfer: transfer,
            fileId: entry.key,
            error: e.toString(),
          );
        } catch (_) {
          // best-effort ACK
        }

        state = state!.copyWith(
          session: _fileFinished(
            state!.session!,
            fileId: entry.key,
            status: FileStatus.failed,
            path: null,
            savedToGallery: false,
            errorMessage: e.toString(),
          ),
        );
      }
    }

    // Check if all files are done
    final session = state?.session;
    if (session != null) {
      final allDone = session.files.values.every(
        (f) => f.status == FileStatus.finished || f.status == FileStatus.failed || f.status == FileStatus.skipped,
      );
      if (allDone) {
        final hasError = session.files.values.any((f) => f.status == FileStatus.failed);
        state = state!.copyWith(
          session: session.copyWith(
            status: hasError ? SessionStatus.finishedWithErrors : SessionStatus.finished,
            endTime: DateTime.now().millisecondsSinceEpoch,
          ),
        );
        _logger.info('QUIC receive session $sessionId finished');
      }
    }
  }

  /// Accepts the file request with the given file name map.
  void acceptFileRequest(Map<String, String> fileNameMap) {
    final controller = state?.session?.responseHandler;
    if (controller == null || controller.isClosed) return;
    controller.add(fileNameMap);
    controller.close();
  }

  /// Declines the current file request.
  void declineFileRequest() {
    final controller = state?.session?.responseHandler;
    if (controller == null || controller.isClosed) return;
    controller.add(null);
    controller.close();
  }

  /// Closes the current session.
  void closeSession() {
    final sessionId = state?.session?.sessionId;
    if (sessionId == null) return;
    state = state!.copyWith(clearSession: true);
    ref.notifier(progressProvider).removeSession(sessionId);
  }

  /// Cancels the current session (marks as canceled).
  void cancelSession() {
    final session = state?.session;
    if (session == null) return;
    state = state!.copyWith(
      session: session.copyWith(status: SessionStatus.canceledByReceiver),
    );
    final streamController = session.responseHandler;
    if (streamController != null && !streamController.isClosed) {
      streamController.add(null);
      streamController.close();
    }
  }

  /// Stops the QUIC server.
  Future<void> stopServer() async {
    _logger.info('Stopping QUIC server...');
    closeSession();
    state = null;
    _logger.info('QUIC server stopped.');
  }
}

/// Helper to update a single file's status within a receive session.
ReceiveSessionState _fileFinished(
  ReceiveSessionState session, {
  required String fileId,
  required FileStatus status,
  required String? path,
  required bool savedToGallery,
  required String? errorMessage,
}) {
  return session.copyWith(
    files: {...session.files}
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
