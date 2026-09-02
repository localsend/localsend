import 'dart:async';

import 'package:logging/logging.dart';

import 'package:localsend_app/util/transport/transport_interface.dart';

final _logger = Logger('LocalNetworkTransport');

/// Stub implementation for [TransportType.localNetwork].
///
/// Local network transport (direct IP-based discovery and transfer without
/// hotspot relay) is not yet implemented. This stub ensures the app
/// handles attempts to use this transport gracefully.
///
/// Returns [false] for [isAvailable] and logs a warning for all operations.
class LocalNetworkTransport implements TransportInterface {
  static const _notImplemented = 'LocalNetworkTransport is not yet implemented';

  TransportState _state = TransportState.idle;

  final StreamController<PeerInfo> _peerController = StreamController<PeerInfo>.broadcast();
  final StreamController<TransportState> _stateController = StreamController<TransportState>.broadcast();

  @override
  TransportType get type => TransportType.localNetwork;

  @override
  TransportState get state => _state;

  @override
  TransportInfo? get transportInfo => null;

  @override
  String? get errorMessage => _notImplemented;

  @override
  bool get isAvailable {
    _logger.warning('$_notImplemented: isAvailable always returns false');
    return false;
  }

  @override
  Stream<PeerInfo> get onPeerDiscovered => _peerController.stream;

  @override
  Stream<TransportState> get onStateChanged => _stateController.stream;

  @override
  Future<bool> start({required HostConfig config}) async {
    _logger.warning('$_notImplemented: start() is not supported');
    _state = TransportState.error;
    _stateController.add(TransportState.error);
    return false;
  }

  @override
  Future<void> stop() async {
    _logger.warning('$_notImplemented: stop() is not supported');
    _state = TransportState.disconnected;
  }

  @override
  Future<bool> connect({required ConnectConfig config}) async {
    _logger.warning('$_notImplemented: connect() is not supported');
    _state = TransportState.error;
    _stateController.add(TransportState.error);
    return false;
  }

  @override
  Future<void> disconnect() async {
    _logger.warning('$_notImplemented: disconnect() is not supported');
    _state = TransportState.disconnected;
  }

  @override
  Future<void> dispose() async {
    await _peerController.close();
    await _stateController.close();
  }
}
