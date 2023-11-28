import 'dart:async';
import 'dart:io';

import 'package:localsend_app/constants.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/provider/network/server/controller/receive_controller.dart';
import 'package:localsend_app/provider/network/server/controller/send_controller.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/alias_generator.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final _logger = Logger('Server');

/// This provider runs the server and provides the current server state.
/// It is a singleton provider, so only one server can be running at a time.
/// The server state is null if the server is not running.
/// The server can receive files (since v1) and send files (since v2).
final serverProvider = NotifierProvider<ServerService, ServerState?>((ref) {
  return ServerService();
});

class ServerService extends Notifier<ServerState?> {
  late final _serverUtils = ServerUtils(
    refFunc: () => ref,
    getState: () => state!,
    getStateOrNull: () => state,
    setState: (builder) => state = builder(state),
  );

  late final _receiveController = ReceiveController(_serverUtils);
  late final _sendController = SendController(_serverUtils);

  ServerService();

  @override
  ServerState? init() {
    return null;
  }

  /// Starts the server from user settings.
  Future<ServerState?> startServerFromSettings() async {
    final settings = ref.read(settingsProvider);
    return startServer(
      alias: settings.alias,
      port: settings.port,
      https: settings.https,
    );
  }

  /// Starts the server.
  Future<ServerState?> startServer({required String alias, required int port, required bool https}) async {
    if (state != null) {
      _logger.info('Server already running.');
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
    final fingerprint = ref.read(securityProvider).certificateHash;
    _receiveController.installRoutes(
      router: router,
      alias: alias,
      port: port,
      https: https,
      fingerprint: fingerprint,
      showToken: ref.read(settingsProvider).showToken,
    );
    _sendController.installRoutes(
      router: router,
      alias: alias,
      fingerprint: fingerprint,
    );

    _logger.info('Starting server...');
    ServerState? newServerState;

    if (https) {
      final securityContext = ref.read(securityProvider);
      newServerState = ServerState(
        httpServer: await _startServer(
          router: router,
          port: port,
          securityContext: SecurityContext()
            ..usePrivateKeyBytes(securityContext.privateKey.codeUnits)
            ..useCertificateChainBytes(securityContext.certificate.codeUnits),
        ),
        alias: alias,
        port: port,
        https: true,
        session: null,
        webSendState: null,
      );
      _logger.info('Server started. (Port: ${newServerState.port}, HTTPS only)');
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
        webSendState: null,
      );
      _logger.info('Server started. (Port: ${newServerState.port}, HTTP only)');
    }

    state = newServerState;
    return newServerState;
  }

  Future<void> stopServer() async {
    _logger.info('Stopping server...');
    await state?.httpServer.close(force: true);
    state = null;
    _logger.info('Server stopped.');
  }

  Future<ServerState?> restartServerFromSettings() async {
    await stopServer();
    return await startServerFromSettings();
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

  /// Updates the save to gallery setting for the current session.
  void setSessionSaveToGallery(bool saveToGallery) {
    _receiveController.setSessionSaveToGallery(saveToGallery);
  }

  /// In addition to [closeSession], this method also cancels incoming requests.
  void cancelSession() {
    _receiveController.cancelSession();
  }

  /// Clears the session.
  void closeSession() {
    _receiveController.closeSession();
  }

  /// Initializes the web send state.
  Future<void> initializeWebSend(List<CrossFile> files) async {
    await _sendController.initializeWebSend(files: files);
  }

  /// Accepts the web send request.
  void acceptWebSendRequest(String sessionId) {
    _sendController.acceptRequest(sessionId);
  }

  /// Declines the web send request.
  void declineWebSendRequest(String sessionId) {
    _sendController.declineRequest(sessionId);
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
    router.call,
    '0.0.0.0',
    port,
    securityContext: securityContext,
  );
}

// Below is a first prototype of mTLS (mutual TLS).
// Problem:
// - we cannot request client certificates while ignoring errors

// Future<HttpServer> _startServer({
//   required Router router,
//   required int port,
//   required SecurityContext? securityContext,
// }) async {
//   const address = '0.0.0.0';
//   final server = await (securityContext == null
//       ? HttpServer.bind(address, port)
//       : HttpServer.bindSecure(
//     address,
//     port,
//     securityContext,
//     requestClientCertificate: true,
//   ));
//
//   final stream = server.map((request) {
//     print('Request Cert: ${request.certificate?.pem}');
//     return request;
//   });
//
//   serveRequests(stream, router);
//   return server;
// }
