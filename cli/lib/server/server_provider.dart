import 'dart:async';
import 'dart:io';

import 'package:cli/server/model/cross_file.dart';
import 'package:cli/server/model/server_state.dart';
import 'package:cli/server/controller/receive_controller.dart';
import 'package:cli/server/controller/send_controller.dart';
import 'package:cli/server/security_service.dart';
import 'package:cli/server/server_utils.dart';
import 'package:common/common.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';


ServerService serverService = ServerService();

class ServerService {
  ServerState? state;
  late final _serverUtils = ServerUtils(
    getState: () => state!,
    getStateOrNull: () => state,
    setState: (builder) => state = builder(state),
  );

  late final _receiveController = ReceiveController(_serverUtils);
  late final _sendController = SendController(_serverUtils);

  ServerService();



  /// Starts the server from user settings.
  Future<ServerState?> startServerFromSettings() async {
    return startServer(
      alias: defaultAlias,
      port: defaultPort,
      https: defaultHttps,
      context: generateSecurityContext(),
    );
  }

  /// Starts the server.
  Future<ServerState?> startServer({
    required String alias,
    required int port,
    required bool https,
    required StoredSecurityContext context,
  }) async {
    if (state != null) {
      print('Server already running.');
      return null;
    }
    alias = alias.trim();
    port = defaultPort;
    final router = Router();
    final fingerprint = context.certificateHash;
    _receiveController.installRoutes(
      router: router,
      alias: alias,
      port: port,
      https: https,
      fingerprint: fingerprint,
      showToken: 'ref.read(settingsProvider).showToken',
    );
    _sendController.installRoutes(
      router: router,
      alias: alias,
      fingerprint: fingerprint,
    );

    print('Starting server...');
    ServerState? newServerState;

    if (https) {
      newServerState = ServerState(
        httpServer: await _startServer(
          router: router,
          port: port,
          securityContext: SecurityContext()
            ..usePrivateKeyBytes(context.privateKey.codeUnits)
            ..useCertificateChainBytes(context.certificate.codeUnits),
        ),
        alias: alias,
        port: port,
        https: true,
        session: null,
        webSendState: null,
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
        webSendState: null,
      );
      print('Server started. (Port: ${newServerState.port}, HTTP only)');
    }

    state = newServerState;
    return newServerState;
  }

  Future<void> stopServer() async {
    print('Stopping server...');
    await state?.httpServer.close(force: true);
    state = null;
    print('Server stopped.');
  }

  Future<ServerState?> restartServerFromSettings() async {
    await stopServer();
    return await startServerFromSettings();
  }

  Future<ServerState?> restartServer(
      {required String alias,
      required int port,
      required bool https,
      required}) async {
    await stopServer();
    return await startServer(
      alias: alias,
      port: port,
      https: https,
      context: generateSecurityContext(),
    );
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

  /// Updates the auto accept setting for web send.
  void setWebSendAutoAccept(bool autoAccept) {
    state = state?.copyWith(
      webSendState: state?.webSendState?.copyWith(
        autoAccept: autoAccept,
      ),
    );
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
