import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/provider/fingerprint_provider.dart';
import 'package:localsend_app/provider/network/server/controller/receive_controller.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/alias_generator.dart';
import 'package:localsend_app/util/security_helper.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

/// This provider runs the server and provides the current server state.
/// It is a singleton provider, so only one server can be running at a time.
/// The server state is null if the server is not running.
/// The server can receive files (since v1) and send files (since v2).
final serverProvider = NotifierProvider<ServerNotifier, ServerState?>(() {
  return ServerNotifier();
});

class ServerNotifier extends Notifier<ServerState?> {
  late final _serverUtils = ServerUtils(
    refFunc: () => ref,
    getState: () => state!,
    getStateOrNull: () => state,
    setState: (builder) => state = builder(state),
  );

  late final _receiveController = ReceiveController(_serverUtils);

  ServerNotifier();

  @override
  ServerState? build() {
    return null;
  }

  Future<ServerState?> startServer({required String alias, required int port, required bool https}) async {
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
    _receiveController.installRoutes(
      router: router,
      alias: alias,
      port: port,
      https: https,
      fingerprint: ref.read(fingerprintProvider),
      showToken: ref.read(settingsProvider.select((s) => s.showToken)),
    );

    print('Starting server...');
    ServerState? newServerState;

    if (https) {
      final securityContextResult = generateSecurityContext();
      newServerState = ServerState(
        httpServer: await _startServer(
          router: router,
          port: port,
          securityContext: SecurityContext()
            ..usePrivateKeyBytes(securityContextResult.privateKey.codeUnits)
            ..useCertificateChainBytes(securityContextResult.certificate.codeUnits),
        ),
        alias: alias,
        port: port,
        https: true,
        session: null,
      );
      print('Server started. (Port: ${newServerState.port}, HTTPS only)');
    } else {
      newServerState = ServerState(
        httpServer: await _startServer(
          router: router,
          port: port,
          securityContext: null,
        ),
        alias: alias,
        port: port,
        https: false,
        session: null,
      );
      print('Server started. (Port: ${newServerState.port}, HTTP only)');
    }

    state = newServerState;
    return newServerState;
  }

  Future<void> stopServer() async {
    await state?.httpServer.close(force: true);
    state = null;
    print('Server stopped.');
  }

  Future<ServerState?> restartServer({required String alias, required int port, required bool https}) async {
    await stopServer();
    return await startServer(alias: alias, port: port, https: https);
  }

  void acceptFileRequest(Map<String, String> fileNameMap) {
    _receiveController.acceptFileRequest(fileNameMap);
  }

  void declineFileRequest() {
    _receiveController.declineFileRequest();
  }

  /// Updates the destination directory for the current session.
  void setSessionDestinationDir(String destinationDirectory) {
    _receiveController.setSessionDestinationDir(destinationDirectory);
  }

  /// In addition to [closeSession], this method also cancels incoming requests.
  void cancelSession() {
    _receiveController.cancelSession();
  }

  /// Clears the session.
  void closeSession() {
    _receiveController.closeSession();
  }
}

/// Starts the (actual) server.
/// This binds the server to the given [port] and returns the [HttpServer] instance.
Future<HttpServer> _startServer({
  required Router router,
  required int port,
  required SecurityContext? securityContext,
}) async {
  return serve(
    router,
    '0.0.0.0',
    port,
    securityContext: securityContext,
  );
}
