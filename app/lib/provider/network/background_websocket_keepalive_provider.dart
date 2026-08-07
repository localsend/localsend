import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('WebSocketKeepalive');

const _pingInterval = Duration(minutes: 3);
const _maxBackoff = Duration(minutes: 5);

final backgroundWebSocketKeepaliveProvider = ReduxProvider<WebSocketKeepaliveService, bool>((ref) {
  return WebSocketKeepaliveService(ref.read(persistenceProvider));
});

class WebSocketKeepaliveService extends ReduxNotifier<bool> {
  final PersistenceService _persistence;

  WebSocketKeepaliveService(this._persistence);

  @override
  bool init() => false;
}

class StartKeepaliveAction extends ReduxAction<WebSocketKeepaliveService, bool> {
  @override
  bool reduce() {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return false;
    }

    if (!notifier._persistence.getBackgroundKeepaliveWebSocketEnabled()) {
      return false;
    }

    final url = notifier._persistence.getBackgroundKeepaliveWebSocketUrl();
    if (url.isEmpty) {
      return false;
    }

    _KeepaliveLoop.instance.start(url);
    return true;
  }
}

class StopKeepaliveAction extends ReduxAction<WebSocketKeepaliveService, bool> {
  @override
  bool reduce() {
    _KeepaliveLoop.instance.stop();
    return false;
  }
}

class _KeepaliveLoop {
  _KeepaliveLoop._();
  static final instance = _KeepaliveLoop._();

  WebSocket? _socket;
  Timer? _pingTimer;
  Timer? _reconnectTimer;
  String? _url;
  int _attempts = 0;
  bool _running = false;

  void start(String url) {
    _running = true;
    _url = url;
    _attempts = 0;
    _connect();
  }

  void stop() {
    _running = false;
    _pingTimer?.cancel();
    _pingTimer = null;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _socket?.close().ignore();
    _socket = null;
  }

  void _connect() async {
    if (!_running) return;

    final url = _url;
    if (url == null) return;

    try {
      _socket = await WebSocket.connect(url).timeout(const Duration(seconds: 10));
      _attempts = 0;
      _logger.info('WebSocket keepalive connected to $url');

      _pingTimer?.cancel();
      _pingTimer = Timer.periodic(_pingInterval, (_) {
        try {
          _socket?.add('ping');
        } catch (_) {
          _scheduleReconnect();
        }
      });

      _socket!.listen(
        (_) {},
        onDone: () => _scheduleReconnect(),
        onError: (_) => _scheduleReconnect(),
        cancelOnError: true,
      );
    } catch (e) {
      _logger.fine('WebSocket keepalive connect failed: $e');
      _scheduleReconnect();
    }
  }

  void _scheduleReconnect() {
    if (!_running) return;

    _pingTimer?.cancel();
    _pingTimer = null;
    _socket = null;

    _attempts++;
    final delay = Duration(seconds: min(pow(2, _attempts).toInt(), _maxBackoff.inSeconds));
    _logger.fine('WebSocket keepalive reconnecting in ${delay.inSeconds}s');

    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(delay, _connect);
  }
}
