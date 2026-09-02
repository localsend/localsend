import 'dart:async';

import 'package:localsend_app/util/transport/local_network_transport.dart';
import 'package:localsend_app/util/transport/transport_interface.dart';
import 'package:localsend_app/util/transport/usb_tethering_transport.dart';
import 'package:localsend_app/util/transport/wifi_hotspot_transport.dart';
import 'package:logging/logging.dart';

final _logger = Logger('TransportManager');

/// Manages all available transport implementations.
///
/// Provides a unified interface to start/stop/switch between
/// different transport types (WiFi hotspot, USB tethering, etc.).
///
/// The TransportManager is used by PrpService to handle the
/// actual transport operations without knowing the specifics
/// of each transport implementation.
class TransportManager {
  final WifiHotspotTransport _wifiTransport = WifiHotspotTransport();
  final UsbTetheringTransport _usbTransport = UsbTetheringTransport();
  final LocalNetworkTransport _localNetworkTransport = LocalNetworkTransport();
  TransportInterface? _activeTransport;
  bool _initialized = false;

  // Aggregated streams
  final StreamController<PeerInfo> _peerController = StreamController<PeerInfo>.broadcast();
  final StreamController<TransportState> _stateController = StreamController<TransportState>.broadcast();

  /// All available transports.
  List<TransportInterface> get transports => [_wifiTransport, _usbTransport, _localNetworkTransport];

  /// The currently active transport, if any.
  TransportInterface? get activeTransport => _activeTransport;

  /// Stream of peers discovered across all transports.
  Stream<PeerInfo> get onPeerDiscovered => _peerController.stream;

  /// Stream of state changes from the active transport.
  Stream<TransportState> get onStateChanged => _stateController.stream;

  /// Initialize all transports.
  Future<void> init() async {
    if (_initialized) {
      _logger.warning('TransportManager already initialized, skipping');
      return;
    }
    _logger.info('Initializing transport manager');

    try {
      // Initialize USB tethering detection
      await _usbTransport.init();

      // Wire up WiFi transport events
      _wifiTransport.onPeerDiscovered.listen((peer) => _peerController.add(peer));
      _wifiTransport.onStateChanged.listen((state) {
        if (_activeTransport == _wifiTransport) {
          _stateController.add(state);
        }
      });

      // Wire up USB transport events
      _usbTransport.onPeerDiscovered.listen((peer) => _peerController.add(peer));
      _usbTransport.onStateChanged.listen((state) {
        if (_activeTransport == _usbTransport) {
          _stateController.add(state);
        }
      });

      // Wire up local network transport events (stub, not yet implemented)
      _localNetworkTransport.onPeerDiscovered.listen((peer) => _peerController.add(peer));
      _localNetworkTransport.onStateChanged.listen((state) {
        if (_activeTransport == _localNetworkTransport) {
          _stateController.add(state);
        }
      });

      _initialized = true;
      _logger.info('Transport manager initialized');
    } catch (e, st) {
      _logger.severe('Failed to initialize TransportManager', e, st);
      rethrow;
    }
  }

  /// Get a transport by type.
  TransportInterface? getTransport(TransportType type) {
    switch (type) {
      case TransportType.wifiHotspot:
        return _wifiTransport;
      case TransportType.usbTethering:
        return _usbTransport;
      case TransportType.localNetwork:
        return _localNetworkTransport;
    }
  }

  /// Start host mode on the given transport type.
  Future<bool> startHost({required TransportType type, required HostConfig config}) async {
    final transport = getTransport(type);
    if (transport == null) {
      _logger.warning('Transport $type not available');
      return false;
    }

    // Stop any active transport first
    if (_activeTransport != null && _activeTransport != transport) {
      await _activeTransport!.disconnect();
    }

    _activeTransport = transport;
    _logger.info('Starting host mode on $type');
    return transport.start(config: config);
  }

  /// Connect to a host via the given transport type.
  Future<bool> connectToHost({required TransportType type, required ConnectConfig config}) async {
    final transport = getTransport(type);
    if (transport == null) {
      _logger.warning('Transport $type not available');
      return false;
    }

    // Stop any active transport first
    if (_activeTransport != null && _activeTransport != transport) {
      await _activeTransport!.disconnect();
    }

    _activeTransport = transport;
    _logger.info('Connecting via $type');
    return transport.connect(config: config);
  }

  /// Stop the active transport.
  Future<void> stopActive() async {
    if (_activeTransport != null) {
      _logger.info('Stopping active transport: ${_activeTransport!.type}');
      await _activeTransport!.stop();
      _activeTransport = null;
    }
  }

  /// Disconnect the active transport.
  Future<void> disconnectActive() async {
    if (_activeTransport != null) {
      _logger.info('Disconnecting active transport: ${_activeTransport!.type}');
      await _activeTransport!.disconnect();
      _activeTransport = null;
    }
  }

  /// Get the current state of the active transport.
  TransportState get activeState => _activeTransport?.state ?? TransportState.idle;

  /// Get the current transport info of the active transport.
  TransportInfo? get activeInfo => _activeTransport?.transportInfo;

  /// Get the error message from the active transport.
  String? get activeError => _activeTransport?.errorMessage;

  /// List of available transport types on this device.
  List<TransportType> get availableTransports {
    final types = <TransportType>[];
    if (_wifiTransport.isAvailable) types.add(TransportType.wifiHotspot);
    if (_usbTransport.isAvailable) types.add(TransportType.usbTethering);
    if (_localNetworkTransport.isAvailable) types.add(TransportType.localNetwork);
    return types;
  }

  /// Clean up all resources.
  Future<void> dispose() async {
    if (!_initialized) return;
    await stopActive();
    await _wifiTransport.dispose();
    await _usbTransport.dispose();
    await _localNetworkTransport.dispose();
    await _peerController.close();
    await _stateController.close();
    _initialized = false;
  }
}
