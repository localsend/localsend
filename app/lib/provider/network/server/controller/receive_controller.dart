import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/dto/info_register_dto.dart';
import 'package:localsend_app/model/dto/prepare_upload_request_dto.dart';
import 'package:localsend_app/model/dto/prepare_upload_response_dto.dart';
import 'package:localsend_app/model/dto/register_dto.dart';
import 'package:localsend_app/model/file_status.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/model/state/send/send_session_state.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/dio_provider.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/provider/receive_history_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:localsend_app/util/native/file_saver.dart';
import 'package:localsend_app/util/native/get_destination_directory.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'package:routerino/routerino.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';
import 'package:window_manager/window_manager.dart';

const _uuid = Uuid();

final _logger = Logger('ReceiveController');

/// Handles all requests for receiving files.
class ReceiveController {
  final ServerUtils server;

  ReceiveController(this.server);

  /// Installs all routes for receiving files.
  void installRoutes({
    required Router router,
    required String alias,
    required int port,
    required bool https,
    required String fingerprint,
    required String showToken,
  }) {
    router.get(ApiRoute.info.v1, (Request request) {
      return _infoHandler(request: request, alias: alias, fingerprint: fingerprint);
    });

    router.get(ApiRoute.info.v2, (Request request) {
      return _infoHandler(request: request, alias: alias, fingerprint: fingerprint);
    });

    // An upgraded version of /info
    router.post(ApiRoute.register.v1, (Request request) async {
      return _registerHandler(request: request, alias: alias, port: port, https: https, fingerprint: fingerprint);
    });

    router.post(ApiRoute.register.v2, (Request request) async {
      return _registerHandler(request: request, alias: alias, port: port, https: https, fingerprint: fingerprint);
    });

    router.post(ApiRoute.prepareUpload.v1, (Request request) async {
      return _prepareUploadHandler(request: request, port: port, https: https, v2: false);
    });

    router.post(ApiRoute.prepareUpload.v2, (Request request) async {
      return _prepareUploadHandler(request: request, port: port, https: https, v2: true);
    });

    router.post(ApiRoute.upload.v1, (Request request) async {
      return _uploadHandler(request: request, v2: false);
    });

    router.post(ApiRoute.upload.v2, (Request request) async {
      return _uploadHandler(request: request, v2: true);
    });

    router.post(ApiRoute.cancel.v1, (Request request) {
      return _cancelHandler(request: request, v2: false);
    });

    router.post(ApiRoute.cancel.v2, (Request request) {
      return _cancelHandler(request: request, v2: true);
    });

    router.post(ApiRoute.show.v1, (Request request) async {
      return _showHandler(request: request, showToken: showToken);
    });

    router.post(ApiRoute.show.v2, (Request request) async {
      return _showHandler(request: request, showToken: showToken);
    });
  }

  Response _infoHandler({
    required Request request,
    required String alias,
    required String fingerprint,
  }) {
    final senderFingerprint = request.url.queryParameters['fingerprint'];
    if (senderFingerprint == fingerprint) {
      // "I talked to myself lol"
      return server.responseJson(412, message: 'Self-discovered');
    }

    final deviceInfo = server.ref.read(deviceInfoProvider);

    final dto = InfoDto(
      alias: alias,
      version: protocolVersion,
      deviceModel: deviceInfo.deviceModel,
      deviceType: deviceInfo.deviceType,
      fingerprint: fingerprint,
      download: server.getState().webSendState != null,
    );

    return server.responseJson(200, body: dto.toJson());
  }

  Future<Response> _registerHandler({
    required Request request,
    required String alias,
    required String fingerprint,
    required int port,
    required bool https,
  }) async {
    final payload = await request.readAsString();
    final RegisterDto requestDto;
    try {
      requestDto = RegisterDto.fromJson(jsonDecode(payload));
    } catch (e) {
      return server.responseJson(400, message: 'Request body malformed');
    }

    if (requestDto.fingerprint == fingerprint) {
      // "I talked to myself lol"
      return server.responseJson(412, message: 'Self-discovered');
    }

    // Save device information
    await server.ref.redux(nearbyDevicesProvider).dispatchAsync(RegisterDeviceAction(requestDto.toDevice(request.ip, port, https)));
    server.ref.notifier(discoveryLoggerProvider).addLog('[DISCOVER/TCP] Received "/register" HTTP request: ${requestDto.alias} (${request.ip})');

    final deviceInfo = server.ref.read(deviceInfoProvider);

    final responseDto = InfoDto(
      alias: alias,
      version: protocolVersion,
      deviceModel: deviceInfo.deviceModel,
      deviceType: deviceInfo.deviceType,
      fingerprint: fingerprint,
      download: server.getState().webSendState != null,
    );

    return server.responseJson(200, body: responseDto.toJson());
  }

  Future<Response> _prepareUploadHandler({
    required Request request,
    required int port,
    required bool https,
    required bool v2,
  }) async {
    if (server.getState().session != null) {
      // block incoming requests when we are already in a session
      return server.responseJson(409, message: 'Blocked by another session');
    }

    final payload = await request.readAsString();
    final PrepareUploadRequestDto dto;
    try {
      dto = PrepareUploadRequestDto.fromJson(jsonDecode(payload));
    } catch (e) {
      return server.responseJson(400, message: 'Request body malformed');
    }

    if (dto.files.isEmpty) {
      // block empty requests (at least one file is required)
      return server.responseJson(400, message: 'Request must contain at least one file');
    }

    final settings = server.ref.read(settingsProvider);
    final destinationDir = settings.destination ?? await getDefaultDestinationDirectory();
    final sessionId = _uuid.v4();

    _logger.info('Session Id: $sessionId');
    _logger.info('Destination Directory: $destinationDir');

    final streamController = StreamController<Map<String, String>?>();
    server.setState(
      (oldState) => oldState?.copyWith(
        session: ReceiveSessionState(
          sessionId: sessionId,
          status: SessionStatus.waiting,
          sender: dto.info.toDevice(request.ip, port, https),
          senderAlias: server.ref.read(favoritesProvider).firstWhereOrNull((e) => e.fingerprint == dto.info.fingerprint)?.alias ?? dto.info.alias,
          files: {
            for (final file in dto.files.values)
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
          saveToGallery: checkPlatformWithGallery() && settings.saveToGallery && dto.files.values.every((f) => !f.fileName.contains('/')),
          responseHandler: streamController,
        ),
      ),
    );

    final quickSave = settings.quickSave && server.getState().session?.message == null;
    final Map<String, String>? selection;
    if (quickSave) {
      // accept all files
      selection = {
        for (final f in dto.files.values) f.id: f.fileName,
      };
    } else {
      if (checkPlatformHasTray() && (await windowManager.isMinimized() || !(await windowManager.isVisible()) || !(await windowManager.isFocused()))) {
        await showFromTray();
      }

      // ignore: use_build_context_synchronously, unawaited_futures
      Routerino.context.push(() => const ReceivePage());

      // Delayed response (waiting for user's decision)
      selection = await streamController.stream.first;
    }

    if (server.getState().session == null) {
      // somehow this state is already disposed
      return server.responseJson(500, message: 'Server is in invalid state');
    }

    if (selection == null) {
      closeSession();
      return server.responseJson(403, message: 'File request declined by recipient');
    }

    if (selection.isEmpty) {
      // nothing selected, send this to sender and close session
      // This usually happens for message transfers
      closeSession();
      return server.responseJson(204);
    }

    server.setState(
      (oldState) {
        final receiveState = oldState!.session!;
        return oldState.copyWith(
          session: receiveState.copyWith(
            status: SessionStatus.sending,
            files: Map.fromEntries(
              receiveState.files.values.map((entry) {
                final desiredName = selection![entry.file.id];
                return MapEntry(
                  entry.file.id,
                  ReceivingFile(
                    file: entry.file,
                    status: desiredName != null ? FileStatus.queue : FileStatus.skipped,
                    token: desiredName != null ? _uuid.v4() : null,
                    desiredName: desiredName,
                    path: null,
                    savedToGallery: false,
                    errorMessage: null,
                  ),
                );
              }),
            ),
            responseHandler: null,
          ),
        );
      },
    );

    if (quickSave) {
      // ignore: use_build_context_synchronously, unawaited_futures
      Routerino.context.pushImmediately(() => ProgressPage(
            showAppBar: false,
            closeSessionOnClose: true,
            sessionId: sessionId,
          ));
    }

    final files = {
      for (final file in server.getState().session!.files.values.where((f) => f.token != null)) file.file.id: file.token,
    };

    if (checkPlatform([TargetPlatform.android, TargetPlatform.iOS])) {
      if (checkPlatform([TargetPlatform.android]) && !server.getState().session!.destinationDirectory.startsWith('/storage/emulated/0/Download')) {
        // Android requires manageExternalStorage permission to save files outside of the Download directory
        try {
          final result = await Permission.manageExternalStorage.request();
          _logger.info('manageExternalStorage permission: $result');
        } catch (e) {
          _logger.warning('Could not request manageExternalStorage permission', e);
        }
      }
      try {
        await Permission.storage.request();
      } catch (e) {
        _logger.warning('Could not request storage permission', e);
      }
    }

    if (v2) {
      return server.responseJson(200,
          body: PrepareUploadResponseDto(
            sessionId: sessionId,
            files: files.cast(),
          ).toJson());
    }
    return server.responseJson(200, body: files);
  }

  Future<Response> _uploadHandler({
    required Request request,
    required bool v2,
  }) async {
    final receiveState = server.getState().session;
    if (receiveState == null) {
      return server.responseJson(409, message: 'No session');
    }

    if (request.ip != receiveState.sender.ip) {
      _logger.warning('Invalid ip address: ${request.ip} (expected: ${receiveState.sender.ip})');
      return server.responseJson(403, message: 'Invalid IP address: ${request.ip}');
    }

    if (receiveState.status != SessionStatus.sending) {
      _logger.warning('Wrong state: ${receiveState.status} (expected: ${SessionStatus.sending})');
      return server.responseJson(409, message: 'Recipient is in wrong state');
    }

    final fileId = request.url.queryParameters['fileId'];
    final token = request.url.queryParameters['token'];
    final sessionId = request.url.queryParameters['sessionId'];
    if (fileId == null || token == null || (v2 && sessionId == null)) {
      // reject because of missing parameters
      _logger.warning('Missing parameters: fileId=$fileId, token=$token, sessionId=$sessionId');
      return server.responseJson(400, message: 'Missing parameters');
    }

    if (v2 && sessionId != receiveState.sessionId) {
      // reject because of wrong session id
      _logger.warning('Wrong session id: $sessionId (expected: ${receiveState.sessionId})');
      return server.responseJson(403, message: 'Invalid session id');
    }

    final receivingFile = receiveState.files[fileId];
    if (receivingFile == null || receivingFile.token != token) {
      // reject because there is no file or token does not match
      _logger.warning('Wrong fileId: $fileId (expected: ${receivingFile?.file.id})');
      return server.responseJson(403, message: 'Invalid token');
    }

    // begin of actual file transfer
    server.setState(
      (oldState) => oldState?.copyWith(
        session: receiveState.copyWith(
          files: {...receiveState.files}..update(
              fileId,
              (_) => receivingFile.copyWith(
                status: FileStatus.sending,
                token: null, // remove token to reject further uploads of the same file
              ),
            ),
          startTime: receiveState.startTime ?? DateTime.now().millisecondsSinceEpoch,
        ),
      ),
    );

    try {
      final destinationPath = await _digestFilePathAndPrepareDirectory(
        parentDirectory: receiveState.destinationDirectory,
        fileName: receivingFile.desiredName!,
      );

      _logger.info('Saving ${receivingFile.file.fileName} to $destinationPath');

      final fileType = receivingFile.file.fileType;
      final saveToGallery = receiveState.saveToGallery && (fileType == FileType.image || fileType == FileType.video);
      await saveFile(
        destinationPath: destinationPath,
        name: receivingFile.desiredName!,
        saveToGallery: saveToGallery,
        isImage: fileType == FileType.image,
        stream: request.read(),
        onProgress: (savedBytes) {
          if (receivingFile.file.size != 0) {
            server.ref.notifier(progressProvider).setProgress(
                  sessionId: receiveState.sessionId,
                  fileId: fileId,
                  progress: savedBytes / receivingFile.file.size,
                );
          }
        },
      );
      if (server.getState().session == null || server.getState().session!.status != SessionStatus.sending) {
        return server.responseJson(500, message: 'Server is in invalid state');
      }
      server.setState(
        (oldState) => oldState?.copyWith(
          session: oldState.session?.fileFinished(
            fileId: fileId,
            status: FileStatus.finished,
            path: saveToGallery ? null : destinationPath,
            savedToGallery: saveToGallery,
            errorMessage: null,
          ),
        ),
      );

      // Track it in history
      await server.ref.redux(receiveHistoryProvider).dispatchAsync(AddHistoryEntryAction(
            entryId: fileId,
            fileName: receivingFile.desiredName!,
            fileType: receivingFile.file.fileType,
            path: saveToGallery ? null : destinationPath,
            savedToGallery: saveToGallery,
            fileSize: receivingFile.file.size,
            senderAlias: receiveState.senderAlias,
            timestamp: DateTime.now().toUtc(),
          ));

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
    }

    server.ref.notifier(progressProvider).setProgress(
          sessionId: receiveState.sessionId,
          fileId: fileId,
          progress: 1,
        );

    final session = server.getState().session!;
    if (session.status == SessionStatus.sending &&
        session.files.values.every((f) => f.status == FileStatus.finished || f.status == FileStatus.skipped || f.status == FileStatus.failed)) {
      final hasError = session.files.values.any((f) => f.status == FileStatus.failed);
      server.setState(
        (oldState) => oldState?.copyWith(
          session: oldState.session!.copyWith(
            status: hasError ? SessionStatus.finishedWithErrors : SessionStatus.finished,
            endTime: DateTime.now().millisecondsSinceEpoch,
          ),
        ),
      );
      if (server.ref.read(settingsProvider).quickSave && server.getState().session?.message == null) {
        // close the session **after** return of the response
        Future.delayed(Duration.zero, () {
          closeSession();
          // ignore: use_build_context_synchronously
          Routerino.context.pushRootImmediately(() => const HomePage(initialTab: HomeTab.receive, appStart: false));
        });
      }
      _logger.info('Received all files.');
    }

    return server.getState().session?.files[fileId]?.status == FileStatus.finished
        ? server.responseJson(200)
        : server.responseJson(500, message: 'Could not save file');
  }

  Response _cancelHandler({
    required Request request,
    required bool v2,
  }) {
    final receiveSession = server.getState().session;
    if (receiveSession != null) {
      // We are currently receiving files.

      if (!v2 && receiveSession.sender.version != '1.0') {
        // disallow v1 cancel for active v2 sessions
        return server.responseJson(403, message: 'No permission');
      }

      if (receiveSession.sender.ip != request.ip) {
        return server.responseJson(403, message: 'No permission');
      }

      // require session id for v2
      // don't require it when during waiting state
      if (v2 && receiveSession.status != SessionStatus.waiting) {
        final sessionId = request.url.queryParameters['sessionId'];
        if (sessionId != receiveSession.sessionId) {
          return server.responseJson(403, message: 'No permission');
        }
      }

      // check if valid state
      final currentStatus = receiveSession.status;
      if (currentStatus != SessionStatus.waiting && currentStatus != SessionStatus.sending) {
        return server.responseJson(403, message: 'No permission');
      }

      _cancelBySender(server);
      return server.responseJson(200);
    } else {
      // We are not receiving files so we may be sending files.

      final sessionId = request.url.queryParameters['sessionId'];
      final sendSessions = server.ref.read(sendProvider);
      final SendSessionState sendState;
      if (v2) {
        // In v2, we require sessionId.

        final selectedSession = sendSessions.values.firstWhereOrNull((s) => s.remoteSessionId == sessionId);
        if (selectedSession == null) {
          return server.responseJson(403, message: 'No permission');
        }

        sendState = selectedSession;
      } else {
        // In v1, we are a little bit more tolerant.
        // Let's assume the sessionId if only one send session exist

        final onlySession = sendSessions.values.singleOrNull;
        if (onlySession == null) {
          return server.responseJson(403, message: 'No permission');
        }

        sendState = onlySession;
      }

      if (sendState.target.ip != request.ip) {
        return server.responseJson(403, message: 'No permission');
      }

      // check if valid state
      if (sendState.status != SessionStatus.sending) {
        return server.responseJson(403, message: 'No permission');
      }

      server.ref.notifier(sendProvider).cancelSessionByReceiver(
            sendState.sessionId,
          );
      return server.responseJson(200);
    }
  }

  Response _showHandler({
    required Request request,
    required String showToken,
  }) {
    final senderToken = request.url.queryParameters['token'];
    if (senderToken == showToken && checkPlatformIsDesktop()) {
      // ignore: discarded_futures
      showFromTray().catchError((e) {
        // don't wait for it
        _logger.severe('Failed to show from tray', e);
      });
      return server.responseJson(200);
    }

    return server.responseJson(403, message: 'Invalid token');
  }

  void acceptFileRequest(Map<String, String> fileNameMap) {
    final controller = server.getState().session?.responseHandler;
    if (controller == null || controller.isClosed) {
      return;
    }

    controller.add(fileNameMap);
    controller.close(); // ignore: discarded_futures
  }

  void declineFileRequest() {
    final controller = server.getState().session?.responseHandler;
    if (controller == null || controller.isClosed) {
      return;
    }

    controller.add(null);
    controller.close(); // ignore: discarded_futures
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
  /// - cancels incoming requests (TODO)
  /// - notifies the sender that the session has been canceled
  void cancelSession() async {
    final session = server.getStateOrNull()?.session;
    if (session == null) {
      // the server is not running
      return;
    }

    // notify sender
    try {
      // ignore: unawaited_futures
      server.ref.read(dioProvider).discovery.post(ApiRoute.cancel.target(session.sender, query: {'sessionId': session.sessionId}));
    } catch (e) {
      _logger.warning('Failed to notify sender', e);
    }

    closeSession();

    // TODO: cancel incoming requests (https://github.com/dart-lang/shelf/issues/319)
    // restartServer(alias: tempState.alias, port: tempState.port);
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
  final receiveSession = server.getState().session;
  if (receiveSession == null) {
    return;
  }

  if (receiveSession.status == SessionStatus.waiting) {
    // received cancel during accept/decline
    // pop just in case if user is in [ReceiveOptionsPage]
    Routerino.context.popUntil(ReceivePage);
  }

  server.setState((oldState) => oldState?.copyWith(
        session: oldState.session?.copyWith(
          status: SessionStatus.canceledBySender,
          endTime: DateTime.now().millisecondsSinceEpoch,
        ),
      ));
}

/// If there is a file with the same name, then it appends a number to its file name
Future<String> _digestFilePathAndPrepareDirectory({required String parentDirectory, required String fileName}) async {
  final actualFileName = p.basename(fileName);
  final fileNameParts = p.split(fileName);
  final dir = p.joinAll([parentDirectory, ...fileNameParts.take(fileNameParts.length - 1)]);

  Directory(dir).createSync(recursive: true);

  String destinationPath;
  int counter = 1;
  do {
    destinationPath = counter == 1 ? p.join(dir, actualFileName) : p.join(dir, actualFileName.withCount(counter));
    counter++;
  } while (await File(destinationPath).exists());
  return destinationPath;
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
      files: {...files}..update(
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
