import 'dart:async';
import 'dart:io';

import 'package:common/constants.dart';
import 'package:common/isolate.dart';
import 'package:common/model/dto/multicast_dto.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/provider/network/server/controller/receive_controller.dart';
import 'package:localsend_app/provider/network/server/controller/send_controller.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/alias_generator.dart';
import 'package:localsend_app/util/simple_server.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('Server');

/// This provider runs the server and provides the current server state.
/// It is a singleton provider, so only one server can be running at a time.
/// The server state is null if the server is not running.
/// The server can receive files (since v1) and send files (since v2).
final serverProvider = NotifierProvider<ServerService, ServerState?>(
  (ref) {
    return ServerService();
  },
  onChanged: (_, next, ref) {
    final settings = ref.read(settingsProvider);
    final syncState = ref.read(parentIsolateProvider).syncState;
    final syncStatePrev = (syncState.alias, syncState.port, syncState.protocol, syncState.serverRunning, syncState.download);
    final syncStateNext = (
      next?.alias ?? settings.alias,
      next?.port ?? settings.port,
      (next?.https ?? settings.https) ? ProtocolType.https : ProtocolType.http,
      next != null,
      next?.webSendState != null,
    );

    if (syncStatePrev == syncStateNext) {
      return;
    }

    ref
        .redux(parentIsolateProvider)
        .dispatch(
          IsolateSyncServerStateAction(
            alias: syncStateNext.$1,
            port: syncStateNext.$2,
            protocol: syncStateNext.$3,
            serverRunning: syncStateNext.$4,
            download: syncStateNext.$5,
          ),
        );
  },
);

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
  Future<ServerState?> startServer({
    required String alias,
    required int port,
    required bool https,
  }) async {
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

    final router = SimpleServerRouteBuilder();
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

    final HttpServer httpServer;
    if (https) {
      final securityContext = ref.read(securityProvider);
      httpServer = await HttpServer.bindSecure(
        '0.0.0.0',
        port,
        SecurityContext()
          ..usePrivateKeyBytes(securityContext.privateKey.codeUnits)
          ..useCertificateChainBytes(securityContext.certificate.codeUnits),
      );
      _logger.info('Server started. (Port: $port, HTTPS only)');
    } else {
      httpServer = await HttpServer.bind(
        '0.0.0.0',
        port,
      );
      _logger.info('Server started. (Port: $port, HTTP only)');
    }

    final server = SimpleServer.start(server: httpServer, routes: router);

    final newServerState = ServerState(
      httpServer: server,
      alias: alias,
      port: port,
      https: https,
      session: null,
      webSendState: null,
      pinAttempts: {},
    );

    state = newServerState;
    return newServerState;
  }

  Future<void> stopServer() async {
    _logger.info('Stopping server...');
    await state?.httpServer.close();
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

  /// Updates the web send pin.
  void setWebSendPin(String? pin) {
    state = state?.copyWith(
      webSendState: state?.webSendState?.copyWith(
        pin: pin,
      ),
    );
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
