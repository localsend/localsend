import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/dto/send_request_dto.dart';
import 'package:localsend_app/model/file_status.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/server/receive_state.dart';
import 'package:localsend_app/model/server/receiving_file.dart';
import 'package:localsend_app/model/server/server_state.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:localsend_app/service/persistence_service.dart';
import 'package:localsend_app/util/alias_generator.dart';
import 'package:localsend_app/util/api_route_builder.dart';
import 'package:localsend_app/util/device_info_helper.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:localsend_app/util/file_saver.dart';
import 'package:localsend_app/util/security_helper.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:routerino/routerino.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';

/// This provider manages receiving file requests.
final serverProvider = StateNotifierProvider<ServerNotifier, ServerState?>((ref) {
  final deviceInfo = ref.watch(deviceRawInfoProvider);
  return ServerNotifier(ref, deviceInfo);
});

const _uuid = Uuid();

class ServerNotifier extends StateNotifier<ServerState?> {
  final DeviceInfoResult deviceInfo;
  final Ref _ref;

  ServerNotifier(this._ref, this.deviceInfo) : super(null);

  Future<ServerState?> startServer({required String alias, required int port}) async {
    if (state != null) {
      print('Server already running.');
      return null;
    }

    alias = alias.trim();
    if (alias.isEmpty) {
      alias = generateRandomAlias();
    }

    if (port < 0 || port > 65535) {
      port = defaultPort;
    }

    final router = Router();

    final String destinationDir;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        destinationDir = '/storage/emulated/0/Download';
        break;
      case TargetPlatform.iOS:
        destinationDir = (await path.getApplicationDocumentsDirectory()).path;
        break;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.fuchsia:
        destinationDir = (await path.getDownloadsDirectory())!.path;
        break;
    }

    print('Destination Directory: $destinationDir');
    _configureRoutes(router, alias, port, destinationDir);

    print('Starting server...');
    ServerState? newServerState;

    final securityContextResult = generateSecurityContext();

    newServerState = ServerState(
      httpServer: await serve(router, '0.0.0.0', port, securityContext: SecurityContext()
        ..usePrivateKeyBytes(securityContextResult.privateKey.codeUnits)
        ..useCertificateChainBytes(securityContextResult.certificate.codeUnits)
      ),
      alias: alias,
      port: port,
      receiveState: null,
    );
    print('Server started. (Port: ${newServerState.port})');

    state = newServerState;
    return newServerState;
  }

  void _configureRoutes(Router router, String alias, int port, String destinationDir) {
    router.get(ApiRoute.info.path, (Request request) {
      final dto = InfoDto(
        alias: alias,
        deviceModel: deviceInfo.deviceModel,
        deviceType: deviceInfo.deviceType,
      );
      return Response.ok(jsonEncode(dto.toJson()), headers: {'Content-Type': 'application/json'});
    });

    router.post(ApiRoute.sendRequest.path, (Request request) async {
      if (state!.receiveState != null) {
        // block incoming requests when we are already in a session
        return Response.badRequest();
      }

      final payload = await request.readAsString();
      final dto = SendRequestDto.fromJson(jsonDecode(payload));
      if (dto.files.isEmpty) {
        // block empty requests (at least one file is required)
        return Response.badRequest();
      }

      final streamController = StreamController<bool>();
      state = state!.copyWith(
        receiveState: ReceiveState(
          status: SessionStatus.waiting,
          sender: dto.info.toDevice(request.ip, port),
          files: {
            for (final file in dto.files.values)
              file.id: ReceivingFile(
                file: file,
                status: FileStatus.queue,
                token: null,
                tempPath: null,
              ),
          },
          startTime: null,
          endTime: null,
          responseHandler: streamController,
        ),
      );

      // ignore: use_build_context_synchronously
      Routerino.context.push(() => const ReceivePage());

      // Delayed response (waiting for user's decision)
      final result = await streamController.stream.first;
      if (result) {
        if (state!.receiveState!.files.values.every((file) => file.token == null)) {
          // nothing selected, send this to sender and close session
          closeSession();
          return Response.ok(
            jsonEncode({}),
            headers: {'Content-Type': 'application/json'},
          );
        }
        state = state?.copyWith(
          receiveState: state?.receiveState?.copyWith(
            status: SessionStatus.sending,
          ),
        );
        return Response.ok(
            jsonEncode({
              for (final file in state!.receiveState!.files.values) file.file.id: file.token,
            }),
            headers: {'Content-Type': 'application/json'});
      } else {
        return Response.badRequest();
      }
    });

    router.post(ApiRoute.send.path, (Request request) async {
      final receiveState = state?.receiveState;
      if (receiveState == null || request.ip != receiveState.sender.ip || receiveState.status != SessionStatus.sending) {
        // reject because there is no session or IP does not match session
        print('No session or wrong IP. Current status: ${receiveState?.status}');
        return Response.badRequest();
      }

      final fileId = request.url.queryParameters['fileId'];
      final token = request.url.queryParameters['token'];
      if (fileId == null || token == null) {
        // reject because of missing parameters
        print('Missing parameters');
        return Response.badRequest();
      }

      final receivingFile = receiveState.files[fileId];
      if (receivingFile == null || receivingFile.token != token) {
        // reject because there is no file or token does not match
        print('Wrong token');
        return Response.badRequest();
      }

      // begin of actual file transfer
      state = state?.copyWith(
        receiveState: receiveState.copyWith(
          files: {...receiveState.files}..update(fileId, (_) => receivingFile.copyWith(status: FileStatus.sending)),
          startTime: receiveState.startTime ?? DateTime.now().millisecondsSinceEpoch,
        ),
      );

      final destinationPath = await _digestFilePath(
        dir: destinationDir,
        fileName: receivingFile.file.fileName,
      );

      print('Saving ${receivingFile.file.fileName} to $destinationPath');

      try {
        await saveFile(
          destinationPath: destinationPath,
          saveToGallery: (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) &&
              (receivingFile.file.fileType == FileType.image || receivingFile.file.fileType == FileType.video),
          stream: request.read(),
          onProgress: (savedBytes) {
            if (receivingFile.file.size != 0) {
              _ref.read(progressProvider.notifier).setProgress(fileId, savedBytes / receivingFile.file.size);
            }
          },
        );
        if (state?.receiveState == null || state!.receiveState!.status != SessionStatus.sending) {
          return Response.badRequest();
        }
        state = state?.copyWith(
          receiveState: state?.receiveState?.withFileStatus(fileId, FileStatus.finished),
        );
        print('Saved ${receivingFile.file.fileName}.');
      } catch (e, st) {
        state = state?.copyWith(
          receiveState: state?.receiveState?.withFileStatus(fileId, FileStatus.failed),
        );
        print(e);
        print(st);
      }

      final progressNotifier = _ref.read(progressProvider.notifier);
      progressNotifier.setProgress(fileId, 1);

      if (state!.receiveState!.files.values
          .every((f) => f.status == FileStatus.finished || f.status == FileStatus.skipped || f.status == FileStatus.failed)) {
        final hasError = state!.receiveState!.files.values.any((f) => f.status == FileStatus.failed);
        state = state?.copyWith(
          receiveState: state!.receiveState!.copyWith(
            status: hasError ? SessionStatus.finishedWithErrors : SessionStatus.finished,
            endTime: DateTime.now().millisecondsSinceEpoch,
          ),
        );
        print('Received all files.');
      }

      return state?.receiveState?.files[fileId]?.status == FileStatus.finished ? Response.ok('') : Response.internalServerError();
    });

    router.post(ApiRoute.cancel.path, (Request request) {
      if (state?.receiveState?.sender.ip == request.ip) {
        _cancelBySender();
      }

      return Response.ok('');
    });
  }

  Future<void> stopServer() async {
    await state?.httpServer.close(force: true);
    state = null;
    print('Server stopped.');
  }

  Future<ServerState?> restartServer({required String alias, required int port}) async {
    await stopServer();
    return await startServer(alias: alias, port: port);
  }

  void acceptFileRequest(Set<String> fileIds) {
    final receiveState = state?.receiveState;
    if (receiveState == null) {
      return;
    }

    final responseHandler = receiveState.responseHandler;
    if (responseHandler == null) {
      return;
    }

    state = state?.copyWith(
      receiveState: receiveState.copyWith(
        files: {
          for (final file in receiveState.files.values)
            file.file.id: ReceivingFile(
              file: file.file,
              status: fileIds.contains(file.file.id) ? FileStatus.queue : FileStatus.skipped,
              token: fileIds.contains(file.file.id) ? _uuid.v4() : null,
              tempPath: null,
            ),
        },
        responseHandler: null,
      ),
    );

    responseHandler.add(true);
    responseHandler.close();
  }

  void declineFileRequest() {
    final controller = state?.receiveState?.responseHandler;
    if (controller == null) {
      return;
    }

    controller.add(false);
    controller.close();
    closeSession();
  }

  void _cancelBySender() {
    final currentStatus = state?.receiveState?.status;
    if (currentStatus != null && (currentStatus == SessionStatus.waiting || currentStatus == SessionStatus.sending)) {
      state = state?.copyWith(
        receiveState: state?.receiveState?.copyWith(
          status: SessionStatus.canceledBySender,
        ),
      );
    }
  }

  /// In addition to [closeSession], this method also cancels incoming requests.
  void cancelSession() {
    final tempState = state;
    if (tempState == null) {
      // the server is not running
      return;
    }
    closeSession();

    // TODO: cancel incoming requests (https://github.com/dart-lang/shelf/issues/319)
    // restartServer(alias: tempState.alias, port: tempState.port);
  }

  void closeSession() {
    state = state?.copyWith(
      receiveState: null,
    );
  }
}

extension on Request {
  String get ip {
    return (context['shelf.io.connection_info'] as HttpConnectionInfo).remoteAddress.address;
  }
}

/// If there is a file with the same name, then it appends a number to its file name
Future<String> _digestFilePath({required String dir, required String fileName}) async {
  String destinationPath;
  int counter = 1;
  do {
    destinationPath = counter == 1 ? '$dir/$fileName' : '$dir/${fileName.withCount(counter)}';
    counter++;
  } while (await File(destinationPath).exists());
  return destinationPath;
}

extension on ReceiveState {
  ReceiveState withFileStatus(String fileId, FileStatus status) {
    return copyWith(files: {...files}..update(fileId, (file) => file.copyWith(status: status)));
  }
}
