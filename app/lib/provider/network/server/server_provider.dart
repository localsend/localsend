import 'dart:async';

import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/state/send/web/web_send_state.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/provider/network/server/controller/receive_controller.dart';
import 'package:localsend_app/provider/network/server/controller/send_controller.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/alias_generator.dart';
import 'package:localsend_isolates/constants.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/dto/multicast_dto.dart';
import 'package:localsend_isolates/rust/api/server.dart' show WebSendI18n, WebSendParams;
import 'package:localsend_isolates/util/rust.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('Server');

/// This provider runs the server and provides the current server state.
/// It is a singleton provider, so only one server can be running at a time.
/// The server state is null if the server is not running.
/// The server can receive files (since v1) and send files (since v2).
///
/// The HTTP server itself runs in Rust (inside the server isolate); this
/// provider starts it, listens to its events and holds the resulting state.
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

  StreamSubscription<HttpServerEvent>? _subscription;

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
  /// Passing a [webSendState] additionally serves the web send (download) API.
  Future<ServerState?> startServer({
    required String alias,
    required int port,
    required bool https,
    WebSendState? webSendState,
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

    _logger.info('Starting server...');

    // The server isolate derives its configuration from the sync state,
    // so it must be published before the start task.
    _syncServerState(alias: alias, port: port, https: https, serverRunning: true, download: webSendState != null);

    final settings = ref.read(settingsProvider);
    final events = ref
        .redux(parentIsolateProvider)
        .dispatchTakeResult(
          IsolateHttpServerStartAction(
            pin: settings.receivePin,
            webSend: webSendState != null
                ? WebSendParams(
                    files: {
                      for (final entry in webSendState.files.entries) entry.key: entry.value.file.toRust(),
                    },
                    pin: webSendState.pin,
                    i18N: WebSendI18n(
                      waiting: t.web.waiting,
                      enterPin: t.web.enterPin,
                      invalidPin: t.web.invalidPin,
                      tooManyAttempts: t.web.tooManyAttempts,
                      rejected: t.web.rejected,
                      files: t.web.files,
                      fileName: t.web.fileName,
                      size: t.web.size,
                    ),
                  )
                : null,
            showToken: settings.showToken,
          ),
        );

    final started = Completer<void>();
    final subscription = events.listen(
      (event) {
        if (event is HttpServerStartedEvent) {
          if (!started.isCompleted) {
            started.complete();
          }
          return;
        }
        _handleEvent(event);
      },
      onError: (Object error) {
        if (!started.isCompleted) {
          started.completeError(error);
        } else {
          _logger.severe('HTTP server error: $error');
        }
      },
    );

    try {
      await started.future;
    } catch (e) {
      await subscription.cancel();
      _syncServerState(alias: alias, port: port, https: https, serverRunning: false, download: false);
      _logger.warning('Failed to start server', e);
      rethrow;
    }

    _subscription = subscription;

    final newServerState = ServerState(
      alias: alias,
      port: port,
      https: https,
      session: null,
      webSendState: webSendState,
    );

    state = newServerState;
    _logger.info('Server started. (Port: $port, ${https ? 'HTTPS' : 'HTTP'} only)');
    return newServerState;
  }

  Future<void> stopServer() async {
    _logger.info('Stopping server...');
    await _subscription?.cancel();
    _subscription = null;
    await ref.redux(parentIsolateProvider).dispatchAsync(IsolateHttpServerStopAction());
    state = null;
    _logger.info('Server stopped.');
  }

  Future<ServerState?> restartServerFromSettings() async {
    await stopServer();
    return await startServerFromSettings();
  }

  Future<ServerState?> restartServer({required String alias, required int port, required bool https, WebSendState? webSendState}) async {
    await stopServer();
    return await startServer(alias: alias, port: port, https: https, webSendState: webSendState);
  }

  Future<void> acceptFileRequest(Map<String, String> fileNameMap) async {
    await _receiveController.acceptFileRequest(fileNameMap);
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

  /// Restarts the server with web send (the download API) enabled for [files].
  /// The auto accept setting and the pin of a previous web send state are kept.
  Future<void> restartServerWithWebSend({
    required String alias,
    required int port,
    required bool https,
    required List<CrossFile> files,
  }) async {
    final webSendState = await _sendController.buildWebSendState(files: files);
    await restartServer(alias: alias, port: port, https: https, webSendState: webSendState);
  }

  /// Updates the web send pin.
  /// The pin is enforced by the Rust server, so the server is restarted.
  Future<void> setWebSendPin(String? pin) async {
    final current = state;
    final webSendState = current?.webSendState;
    if (current == null || webSendState == null || webSendState.pin == pin) {
      return;
    }

    await restartServer(
      alias: current.alias,
      port: current.port,
      https: current.https,
      webSendState: webSendState.copyWith(sessions: {}, pin: pin),
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

  void _handleEvent(HttpServerEvent event) {
    switch (event) {
      case HttpServerStartedEvent():
        break;
      case HttpServerRegisterEvent():
        // ignore: discarded_futures
        _receiveController.onRegister(event);
      case HttpServerPrepareUploadEvent():
        // ignore: discarded_futures
        _receiveController.onPrepareUpload(event);
      case HttpServerFileUploadEvent():
        // ignore: discarded_futures
        _receiveController.onFileUpload(event);
      case HttpServerFileUploadProgressEvent():
      case HttpServerFileUploadResultEvent():
        // emitted on the stream of the file upload target task, not here
        break;
      case HttpServerSessionEndEvent():
        _receiveController.onSessionEnd(event);
      case HttpServerPrepareUploadAbortedEvent():
        _receiveController.onPrepareUploadAborted(event);
      case HttpServerCancelReceivedEvent():
        _receiveController.onCancelReceived(event);
      case HttpServerShowEvent():
        _receiveController.onShow(event);
      case HttpServerWebPrepareDownloadEvent():
        _sendController.onPrepareDownload(event);
      case HttpServerWebFileDownloadEvent():
        // ignore: discarded_futures
        _sendController.onFileDownload(event);
    }
  }

  void _syncServerState({
    required String alias,
    required int port,
    required bool https,
    required bool serverRunning,
    required bool download,
  }) {
    ref
        .redux(parentIsolateProvider)
        .dispatch(
          IsolateSyncServerStateAction(
            alias: alias,
            port: port,
            protocol: https ? ProtocolType.https : ProtocolType.http,
            serverRunning: serverRunning,
            download: download,
          ),
        );
  }
}
