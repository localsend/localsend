import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/dto/info_dto.dart';
import 'package:localsend_app/model/server_state.dart';
import 'package:localsend_app/service/persistence_service.dart';
import 'package:localsend_app/util/alias_generator.dart';
import 'package:localsend_app/util/device_info_helper.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final serverProvider = StateNotifierProvider<ServerNotifier, ServerState?>((ref) => ServerNotifier());

class ServerNotifier extends StateNotifier<ServerState?> {
  ServerNotifier() : super(null);

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

    final deviceInfo = await getDeviceInfo();
    app.get('/localsend/v1/info', (Request request) {
      final dto = InfoDto(
        alias: alias,
        deviceModel: deviceInfo.deviceModel,
        deviceType: deviceInfo.deviceType,
      );
      return Response.ok(jsonEncode(dto.toJson()), headers: {'Content-Type': 'application/json'});
    });

    app.get('/user/<user>', (Request request, String user) {
      return Response.ok('hello $user');
    });

    print('Starting server...');
    ServerState? newServerState;
    try {
      newServerState = ServerState(
        httpServer: await serve(app, '0.0.0.0', port),
        alias: alias,
        port: port,
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
}
