import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/main.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/dto/send_request_dto.dart';
import 'package:localsend_app/model/server/receive_state.dart';
import 'package:localsend_app/model/server/receiving_file.dart';
import 'package:localsend_app/model/server/server_state.dart';
import 'package:localsend_app/model/server/temp_request.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/routes.dart';
import 'package:localsend_app/service/persistence_service.dart';
import 'package:localsend_app/util/alias_generator.dart';
import 'package:localsend_app/util/device_info_helper.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';

/// This provider manages receiving file requests.
final serverProvider = StateNotifierProvider<ServerNotifier, ServerState?>((ref) {
  final deviceInfo = ref.watch(deviceRawInfoProvider);
  return ServerNotifier(deviceInfo);
});

const _basePath = '/localsend/v1';
const _uuid = Uuid();

class ServerNotifier extends StateNotifier<ServerState?> {
  final DeviceInfoResult deviceInfo;

  ServerNotifier(this.deviceInfo) : super(null);

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

    final app = Router();

    app.get('$_basePath/info', (Request request) {
      final dto = InfoDto(
        alias: alias,
        deviceModel: deviceInfo.deviceModel,
        deviceType: deviceInfo.deviceType,
      );
      return Response.ok(jsonEncode(dto.toJson()), headers: {'Content-Type': 'application/json'});
    });

    app.post('$_basePath/send-request', (Request request) async {
      if (state!.tempRequest != null || state!.receiveState != null) {
        // block incoming requests when we are already in a session
        return Response.badRequest();
      }

      final ip = request.context['shelf.io.connection_info'] as HttpConnectionInfo;
      final payload = await request.readAsString();
      final dto = SendRequestDto.fromJson(jsonDecode(payload));
      final streamController = StreamController<bool>();
      state = state!.copyWith(
        tempRequest: TempRequest(
          sender: dto.info.toDevice(ip.remoteAddress.address, port),
          files: dto.files,
          responseHandler: streamController,
        ),
      );

      // ignore: use_build_context_synchronously
      const ReceiveRoute().push(LocalSendApp.routerContext);

      // Delayed response (waiting for user's decision)
      final result = await streamController.stream.first;
      if (result) {
        return Response.ok(jsonEncode({
          for (final file in state!.receiveState!.files.values)
            file.file.id: file.token,
        }), headers: {'Content-Type': 'application/json'});
      } else {
        return Response.badRequest();
      }
    });

    print('Starting server...');
    ServerState? newServerState;
    try {
      newServerState = ServerState(
        httpServer: await serve(app, '0.0.0.0', port),
        alias: alias,
        port: port,
        tempRequest: null,
        receiveState: null,
      );
      print('Server started. (Port: ${newServerState.port})');
    } catch (e) {
      print(e);
    }

    state = newServerState;
    return newServerState;
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
    final tempRequest = state?.tempRequest;
    if (tempRequest == null) {
      return;
    }

    state = state?.copyWith(
      tempRequest: null,
      receiveState: ReceiveState(
        sender: tempRequest.sender,
        files: {
          for (final file in tempRequest.files.values)
            file.id: ReceivingFile(
              token: _uuid.v4(),
              file: file,
              tempPath: fileIds.contains(file.id) ? _uuid.v4() : null,
            ),
        },
      ),
    );

    tempRequest.responseHandler.add(true);
    tempRequest.responseHandler.close();
  }

  void declineFileRequest() {
    final controller = state?.tempRequest?.responseHandler;
    if (controller == null) {
      return;
    }

    state = state?.copyWith(
      tempRequest: null,
      receiveState: null,
    );

    controller.add(false);
    controller.close();
  }
}
