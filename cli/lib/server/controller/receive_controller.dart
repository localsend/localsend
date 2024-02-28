import 'dart:async';
import 'dart:convert';

import 'package:cli/server/model/receive_session_state.dart';
import 'package:cli/server/model/receiving_file.dart';
import 'package:cli/server/model/send_session_state.dart';
import 'package:cli/server/controller/api_route_builder.dart';
import 'package:cli/server/controller/dio_provider.dart';
import 'package:cli/server/controller/file_saver.dart';
import 'package:cli/server/server_utils.dart';
import 'package:collection/collection.dart';
import 'package:common/common.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();


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
      return _infoHandler(
          request: request, alias: alias, fingerprint: fingerprint);
    });

    router.get(ApiRoute.info.v2, (Request request) {
      return _infoHandler(
          request: request, alias: alias, fingerprint: fingerprint);
    });

    // An upgraded version of /info
    router.post(ApiRoute.register.v1, (Request request) async {
      return _registerHandler(
          request: request,
          alias: alias,
          port: port,
          https: https,
          fingerprint: fingerprint);
    });

    router.post(ApiRoute.register.v2, (Request request) async {
      return _registerHandler(
          request: request,
          alias: alias,
          port: port,
          https: https,
          fingerprint: fingerprint);
    });

    router.post(ApiRoute.prepareUpload.v1, (Request request) async {
      return _prepareUploadHandler(
          request: request, port: port, https: https, v2: false);
    });

    router.post(ApiRoute.prepareUpload.v2, (Request request) async {
      return _prepareUploadHandler(
          request: request, port: port, https: https, v2: true);
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

    final dto = InfoDto(
      alias: alias,
      version: protocolVersion,
      deviceModel: 'deviceInfo.deviceModel',
      deviceType: DeviceType.desktop,
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
/*
    await server.ref.redux(nearbyDevicesProvider).dispatchAsync(RegisterDeviceAction(requestDto.toDevice(request.ip, port, https)));
    server.ref.notifier(discoveryLoggerProvider).addLog('[DISCOVER/TCP] Received "/register" HTTP request: ${requestDto.alias} (${request.ip})');

*/

    final responseDto = InfoDto(
      alias: alias,
      version: protocolVersion,
      deviceModel: 'deviceInfo.deviceModel',
      deviceType: DeviceType.desktop,
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
      return server.responseJson(400,
          message: 'Request must contain at least one file');
    }

    final destinationDir = '~/Downloads/';
    final cacheDir = '~/Downloads/cache/';
    final sessionId = _uuid.v4();

    print('Session Id: $sessionId');
    print('Destination Directory: $destinationDir');

    final streamController = StreamController<Map<String, String>?>();
    server.setState(
      (oldState) => oldState?.copyWith(
        session: ReceiveSessionState(
          sessionId: sessionId,
          status: SessionStatus.waiting,
          sender: dto.info.toDevice(request.ip, port, https),
          senderAlias: dto.info.alias,
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
          cacheDirectory: cacheDir,
          saveToGallery: false,
          responseHandler: streamController,
        ),
      ),
    );

    final quickSave = server.getState().session?.message == null;
    final Map<String, String>? selection;
    if (quickSave) {
      // accept all files
      selection = {
        for (final f in dto.files.values) f.id: f.fileName,
      };
    } else {
      // Delayed response (waiting for user's decision)
      selection = await streamController.stream.first;
    }

    if (server.getState().session == null) {
      // somehow this state is already disposed
      return server.responseJson(500, message: 'Server is in invalid state');
    }

    if (selection == null) {
      closeSession();
      return server.responseJson(403,
          message: 'File request declined by recipient');
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
                    status: desiredName != null
                        ? FileStatus.queue
                        : FileStatus.skipped,
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
    }

    final files = {
      for (final file in server
          .getState()
          .session!
          .files
          .values
          .where((f) => f.token != null))
        file.file.id: file.token,
    };

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
      print(
          'Invalid ip address: ${request.ip} (expected: ${receiveState.sender.ip})');
      return server.responseJson(403,
          message: 'Invalid IP address: ${request.ip}');
    }

    if (receiveState.status != SessionStatus.sending) {
      print(
          'Wrong state: ${receiveState.status} (expected: ${SessionStatus.sending})');
      return server.responseJson(409, message: 'Recipient is in wrong state');
    }

    final fileId = request.url.queryParameters['fileId'];
    final token = request.url.queryParameters['token'];
    final sessionId = request.url.queryParameters['sessionId'];
    if (fileId == null || token == null || (v2 && sessionId == null)) {
      // reject because of missing parameters
      print(
          'Missing parameters: fileId=$fileId, token=$token, sessionId=$sessionId');
      return server.responseJson(400, message: 'Missing parameters');
    }

    if (v2 && sessionId != receiveState.sessionId) {
      // reject because of wrong session id
      print(
          'Wrong session id: $sessionId (expected: ${receiveState.sessionId})');
      return server.responseJson(403, message: 'Invalid session id');
    }

    final receivingFile = receiveState.files[fileId];
    if (receivingFile == null || receivingFile.token != token) {
      // reject because there is no file or token does not match
      print(
          'Wrong fileId: $fileId (expected: ${receivingFile?.file.id})');
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
                token:
                    null, // remove token to reject further uploads of the same file
              ),
            ),
          startTime:
              receiveState.startTime ?? DateTime.now().millisecondsSinceEpoch,
        ),
      ),
    );

    try {
      final fileType = receivingFile.file.fileType;
      final saveToGallery = receiveState.saveToGallery &&
          (fileType == FileType.image || fileType == FileType.video);

      final destinationPath = await digestFilePathAndPrepareDirectory(
        parentDirectory: saveToGallery
            ? receiveState.cacheDirectory
            : receiveState.destinationDirectory,
        fileName: receivingFile.desiredName!,
      );

      print('Saving ${receivingFile.file.fileName} to $destinationPath');

      await saveFile(
        destinationPath: destinationPath,
        name: receivingFile.desiredName!,
        saveToGallery: saveToGallery,
        isImage: fileType == FileType.image,
        stream: request.read(),
        androidSdkInt: 0,
        onProgress: (savedBytes) {},
      );
      if (server.getState().session == null ||
          server.getState().session!.status != SessionStatus.sending) {
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

      print('Saved ${receivingFile.file.fileName}.');
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
     print('Failed to save file $e $st');
    }

    final session = server.getState().session!;
    if (session.status == SessionStatus.sending &&
        session.files.values.every((f) =>
            f.status == FileStatus.finished ||
            f.status == FileStatus.skipped ||
            f.status == FileStatus.failed)) {
      final hasError =
          session.files.values.any((f) => f.status == FileStatus.failed);
      server.setState(
        (oldState) => oldState?.copyWith(
          session: oldState.session!.copyWith(
            status: hasError
                ? SessionStatus.finishedWithErrors
                : SessionStatus.finished,
            endTime: DateTime.now().millisecondsSinceEpoch,
          ),
        ),
      );
      if (server.getState().session?.message == null) {
        // close the session **after** return of the response
        Future.delayed(Duration.zero, () {
          closeSession();
          // ignore: use_build_context_synchronously
        });
      }
      print('Received all files.');
    }

    return server.getState().session?.files[fileId]?.status ==
            FileStatus.finished
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
      if (currentStatus != SessionStatus.waiting &&
          currentStatus != SessionStatus.sending) {
        return server.responseJson(403, message: 'No permission');
      }

      _cancelBySender(server);
      return server.responseJson(200);
    } else {
      // We are not receiving files so we may be sending files.

      final sessionId = request.url.queryParameters['sessionId'];
      final sendSessions = <String, SendSessionState>{};
      final SendSessionState sendState;
      if (v2) {
        // In v2, we require sessionId.

        final selectedSession = sendSessions.values
            .firstWhereOrNull((s) => s.remoteSessionId == sessionId);
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

      return server.responseJson(200);
    }
  }

  Response _showHandler({
    required Request request,
    required String showToken,
  }) {
    final senderToken = request.url.queryParameters['token'];
    if (senderToken == showToken) {
      // ignore: discarded_futures

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
      dioCollection.discovery.post(ApiRoute.cancel
          .target(session.sender, query: {'sessionId': session.sessionId}));
    } catch (e) {
      print('Failed to notify sender, $e');
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
  }

  server.setState((oldState) => oldState?.copyWith(
        session: oldState.session?.copyWith(
          status: SessionStatus.canceledBySender,
          endTime: DateTime.now().millisecondsSinceEpoch,
        ),
      ));
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
