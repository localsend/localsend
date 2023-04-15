import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/dto/register_dto.dart';
import 'package:localsend_app/model/dto/send_request_dto.dart';
import 'package:localsend_app/model/file_status.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
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
import 'package:path/path.dart' as p;
import 'package:routerino/routerino.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';
import 'package:window_manager/window_manager.dart';

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
    router.get(ApiRoute.info.path, (Request request) {
      final senderFingerprint = request.url.queryParameters['fingerprint'];
      if (senderFingerprint == fingerprint) {
        // "I talked to myself lol"
        return server.response(412, message: 'Self-discovered');
      }

      final deviceInfo = server.ref.read(deviceRawInfoProvider);

      final dto = InfoDto(
        alias: alias,
        deviceModel: deviceInfo.deviceModel,
        deviceType: deviceInfo.deviceType,
      );

      return server.response(200, body: dto.toJson());
    });

    // An upgraded version of /info
    router.post(ApiRoute.register.path, (Request request) async {
      final payload = await request.readAsString();
      final RegisterDto requestDto;
      try {
        requestDto = RegisterDto.fromJson(jsonDecode(payload));
      } catch (e) {
        return server.response(400, message: 'Request body malformed');
      }

      if (requestDto.fingerprint == fingerprint) {
        // "I talked to myself lol"
        return server.response(412, message: 'Self-discovered');
      }

      // Save device information
      server.ref.read(nearbyDevicesProvider.notifier).registerDevice(requestDto.toDevice(request.ip, port, https));

      final deviceInfo = server.ref.read(deviceRawInfoProvider);

      final responseDto = InfoDto(
        alias: alias,
        deviceModel: deviceInfo.deviceModel,
        deviceType: deviceInfo.deviceType,
      );

      return server.response(200, body: responseDto.toJson());
    });

    router.post(ApiRoute.sendRequest.path, (Request request) async {
      if (server.getState().session != null) {
        // block incoming requests when we are already in a session
        return server.response(409, message: 'Blocked by another session');
      }

      final payload = await request.readAsString();
      final SendRequestDto dto;
      try {
        dto = SendRequestDto.fromJson(jsonDecode(payload));
      } catch (e) {
        return server.response(400, message: 'Request body malformed');
      }

      if (dto.files.isEmpty) {
        // block empty requests (at least one file is required)
        return server.response(400, message: 'Request must contain at least one file');
      }

      final settings = server.ref.read(settingsProvider);
      final destinationDir = settings.destination ?? await getDefaultDestinationDirectory();
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
        if (checkPlatformHasTray() &&
            (await windowManager.isMinimized() || !(await windowManager.isVisible()) || !(await windowManager.isFocused()))) {
          await showFromTray();
        }

        // ignore: use_build_context_synchronously, unawaited_futures
        Routerino.context.push(() => const ReceivePage());

        // Delayed response (waiting for user's decision)
        selection = await streamController.stream.first;
      }

      if (server.getState().session == null) {
        // somehow this state is already disposed
        return server.response(500, message: 'Server is in invalid state');
      }

      if (selection == null) {
        closeSession();
        return server.response(403, message: 'File request declined by recipient');
      }

      if (selection.isEmpty) {
        // nothing selected, send this to sender and close session
        // This usually happens for message transfers
        closeSession();
        return server.response(200);
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

      return server.response(200, body: {
        for (final file in server.getState().session!.files.values.where((f) => f.token != null)) file.file.id: file.token,
      });
    });

    router.post(ApiRoute.send.path, (Request request) async {
      final receiveState = server.getState().session;
      if (receiveState == null) {
        return server.response(409, message: 'No session');
      }

      if (request.ip != receiveState.sender.ip) {
        print('Invalid ip address: ${request.ip} (expected: ${receiveState.sender.ip})');
        return server.response(403, message: 'Invalid IP address: ${request.ip}');
      }

      if (receiveState.status != SessionStatus.sending) {
        print('Wrong state: ${receiveState.status} (expected: ${SessionStatus.sending})');
        return server.response(409, message: 'Recipient is in wrong state');
      }

      final fileId = request.url.queryParameters['fileId'];
      final token = request.url.queryParameters['token'];
      if (fileId == null || token == null) {
        // reject because of missing parameters
        print('Missing parameters');
        return server.response(400, message: 'Missing parameters');
      }

      final receivingFile = receiveState.files[fileId];
      if (receivingFile == null || receivingFile.token != token) {
        // reject because there is no file or token does not match
        print('Wrong token: $token (expected: ${receivingFile?.token})');
        return server.response(403, message: 'Invalid token');
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

        print('Saving ${receivingFile.file.fileName} to $destinationPath');

        final saveToGallery = checkPlatformWithGallery() &&
            server.ref.read(settingsProvider).saveToGallery &&
            (receivingFile.file.fileType == FileType.image || receivingFile.file.fileType == FileType.video);
        await saveFile(
          destinationPath: destinationPath,
          name: receivingFile.desiredName!,
          saveToGallery: saveToGallery,
          stream: request.read(),
          onProgress: (savedBytes) {
            if (receivingFile.file.size != 0) {
              server.ref.read(progressProvider.notifier).setProgress(
                    sessionId: receiveState.sessionId,
                    fileId: fileId,
                    progress: savedBytes / receivingFile.file.size,
                  );
            }
          },
        );
        if (server.getState().session == null || server.getState().session!.status != SessionStatus.sending) {
          return server.response(500, message: 'Server is in invalid state');
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
        await server.ref.read(receiveHistoryProvider.notifier).addEntry(
              id: fileId,
              fileName: receivingFile.desiredName!,
              fileType: receivingFile.file.fileType,
              path: saveToGallery ? null : destinationPath,
              savedToGallery: saveToGallery,
              fileSize: receivingFile.file.size,
              senderAlias: receiveState.sender.alias,
              timestamp: DateTime.now().toUtc(),
            );

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
        print(e);
        print(st);
      }

      server.ref.read(progressProvider.notifier).setProgress(
            sessionId: receiveState.sessionId,
            fileId: fileId,
            progress: 1,
          );

      final session = server.getState().session!;
      if (session.files.values.every((f) => f.status == FileStatus.finished || f.status == FileStatus.skipped || f.status == FileStatus.failed)) {
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
          // close the session after return of the response
          Future.delayed(Duration.zero, () {
            closeSession();
            // ignore: use_build_context_synchronously
            Routerino.context.popUntilRoot();
          });
        }
        print('Received all files.');
      }

      return server.getState().session?.files[fileId]?.status == FileStatus.finished
          ? server.response(200)
          : server.response(500, message: 'Could not save file');
    });

    router.post(ApiRoute.cancel.path, (Request request) {
      if (server.getState().session?.sender.ip == request.ip) {
        _cancelBySender(server);
      }

      return server.response(200);
    });

    router.post(ApiRoute.show.path, (Request request) async {
      final senderToken = request.url.queryParameters['token'];
      if (senderToken == showToken && checkPlatformIsDesktop()) {
        unawaited(
          showFromTray().catchError((e) {
            // don't wait for it
            print(e);
          }),
        );
        return server.response(200);
      }

      return server.response(403, message: 'Invalid token');
    });
  }

  void acceptFileRequest(Map<String, String> fileNameMap) {
    final controller = server.getState().session?.responseHandler;
    if (controller == null) {
      return;
    }

    controller.add(fileNameMap);
    unawaited(controller.close());
  }

  void declineFileRequest() {
    final controller = server.getState().session?.responseHandler;
    if (controller == null) {
      return;
    }

    controller.add(null);
    unawaited(controller.close());
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

  /// In addition to [closeSession], this method also cancels incoming requests.
  void cancelSession() {
    final tempState = server.getStateOrNull();
    if (tempState == null) {
      // the server is not running
      return;
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
    server.ref.read(progressProvider.notifier).removeSession(sessionId);
  }
}

void _cancelBySender(ServerUtils server) {
  final currentStatus = server.getState().session?.status;
  if (currentStatus != null && (currentStatus == SessionStatus.waiting || currentStatus == SessionStatus.sending)) {
    Routerino.context.popUntil(ReceivePage); // pop just in case if use is in [ReceiveOptionsPage]
    server.setState((oldState) => oldState?.copyWith(
          session: oldState.session?.copyWith(
            status: SessionStatus.canceledBySender,
          ),
        ));
  }
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
