import 'dart:async';

import 'package:flutter/services.dart';
import 'package:localsend_app/util/transport/transport_interface.dart';
import 'package:logging/logging.dart';

final _logger = Logger('UsbTetheringTransport');

/// USB tethering transport implementation.
///
/// Detects and manages USB tethering connections for peer-to-peer relay.
/// When a device is connected via USB cable and has USB tethering enabled,
/// both devices can communicate over the USB network interface.
///
/// Platform support:
/// - Android: Uses `ConnectivityManager` with `TRANSPORT_USB` (API 21+)
/// - Others: Platform-specific USB networking APIs (planned)
class UsbTetheringTransport implements TransportInterface {
  static const _channel = MethodChannel(
    'org.localsend.localsend_app/usb_tethering',
  );
  static const _eventChannel = EventChannel(
    'org.localsend.localsend_app/usb_tethering_events',
  );

  TransportState _state = TransportState.idle;
  TransportInfo? _transportInfo;
  String? _errorMessage;
  bool _available = false;
  bool _disposed = false;
  StreamSubscription<dynamic>? _nativeEventSub;

  final StreamController<PeerInfo> _peerController = StreamController<PeerInfo>.broadcast();
  final StreamController<TransportState> _stateController = StreamController<TransportState>.broadcast();

  @override
  TransportType get type => TransportType.usbTethering;

  @override
  TransportState get state => _state;

  @override
  TransportInfo? get transportInfo => _transportInfo;

  @override
  String? get errorMessage => _errorMessage;

  @override
  bool get isAvailable => _available;

  @override
  Stream<PeerInfo> get onPeerDiscovered => _peerController.stream;

  @override
  Stream<TransportState> get onStateChanged => _stateController.stream;

  /// Initialize USB tethering detection.
  /// Call this once to check if USB tethering is available on this device.
  Future<void> init() async {
    try {
      final result = await invokeChannel<bool>(
        _channel,
        'isUsbTetheringAvailable',
      );
      _available = result ?? false;
      _logger.info('USB tethering available: $_available');
    } catch (e) {
      _available = false;
      _logger.info('USB tethering not available on this platform');
    }
  }

  @override
  Future<bool> start({required HostConfig config}) async {
    _logger.info('Starting USB tethering mode');
    _setState(TransportState.connecting);
    _ensureNativeEvents();

    try {
      final result = await invokeChannel<Map>(_channel, 'startUsbTethering');
      if (result == null) {
        _setError('Failed to start USB tethering: null response');
        return false;
      }

      final active = result['active'] as bool? ?? false;
      if (active) {
        _transportInfo = TransportInfo(
          type: TransportType.usbTethering,
          networkName: result['interfaceName'] as String?,
          isRunning: true,
          metadata: {'ipAddress': result['ipAddress'] as String? ?? ''},
        );
        _setState(TransportState.connected);
        _logger.info('USB tethering active');
        return true;
      } else {
        _setError('USB tethering not available or permission denied');
        return false;
      }
    } catch (e) {
      _setError('Failed to start USB tethering: $e');
      return false;
    }
  }

  @override
  Future<void> stop() async {
    _logger.info('Stopping USB tethering');
    try {
      await invokeChannel(_channel, 'stopUsbTethering');
    } catch (e) {
      _logger.warning('Error stopping USB tethering: $e');
    }
    _transportInfo = null;
    _errorMessage = null;
    _setState(TransportState.disconnected);
  }

  @override
  Future<bool> connect({required ConnectConfig config}) async {
    // USB tethering "connect" means detecting the existing USB network
    // and binding to it, rather than initiating a connection.
    _logger.info('Connecting via USB tethering');
    _setState(TransportState.connecting);
    _ensureNativeEvents();

    try {
      final result = await invokeChannel<Map>(_channel, 'connectUsbTethering', {
        'interfaceName': config.ssid,
      });

      final connected = result?['connected'] == true;
      if (connected) {
        _transportInfo = TransportInfo(
          type: TransportType.usbTethering,
          networkName: result?['interfaceName'] as String?,
          isRunning: true,
          metadata: {'ipAddress': result?['ipAddress'] as String? ?? ''},
        );
        _setState(TransportState.connected);
        _logger.info('Connected via USB tethering');
        return true;
      } else {
        _setError('Failed to connect via USB tethering');
        return false;
      }
    } catch (e) {
      _setError('USB tethering connection error: $e');
      return false;
    }
  }

  @override
  Future<void> disconnect() async {
    _logger.info('Disconnecting USB tethering');
    try {
      await invokeChannel(_channel, 'disconnectUsbTethering');
    } catch (e) {
      _logger.warning('Error disconnecting USB tethering: $e');
    }
    _transportInfo = null;
    _errorMessage = null;
    _setState(TransportState.disconnected);
  }

  /// Check if USB tethering is currently active.
  Future<bool> isTetheringActive() async {
    try {
      final result = await invokeChannel<bool>(
        _channel,
        'isUsbTetheringActive',
      );
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Listen for USB tethering state changes.
  Future<void> startListening() async {
    _ensureNativeEvents();
    try {
      await invokeChannel(_channel, 'listenUsbTetheringChanges');
    } catch (e) {
      _logger.warning('Failed to start USB tethering listener: $e');
    }
  }

  @override
  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    try {
      await stop();
    } catch (e) {
      _logger.warning('Error stopping during dispose: $e');
    }
    final sub = _nativeEventSub;
    _nativeEventSub = null;
    if (sub != null) {
      try {
        // EventChannel's onCancel touches the binary messenger; in binding-less
        // unit tests cancel() completes with an error — swallow it.
        await sub.cancel();
      } catch (e) {
        _logger.warning('Error cancelling USB event subscription: $e');
      }
    }
    await _peerController.close();
    await _stateController.close();
  }

  // ============================================================
  //  Native event stream (tethering network lost, etc.)
  // ============================================================

  /// Subscribe to native-side events lazily, and only when a binding exists —
  /// unit tests without one never subscribe.
  void _ensureNativeEvents() {
    if (_disposed || _nativeEventSub != null || !channelBindingAvailable) return;
    try {
      _nativeEventSub = _eventChannel.receiveBroadcastStream().listen(
        (event) {
          if (event is Map && event['event'] == 'usbTetheringChanged') {
            final active = event['active'] == true;
            _logger.info('Native event: USB tethering active=$active');
            if (!active && _state == TransportState.connected) {
              _transportInfo = null;
              _setState(TransportState.disconnected);
            }
          }
        },
        onError: (Object e) {
          _logger.warning('USB tethering event stream error: $e');
        },
      );
    } catch (e) {
      _logger.warning('Failed to listen to USB tethering events: $e');
    }
  }

  // ============================================================
  //  Internal helpers
  // ============================================================

  void _setState(TransportState newState) {
    if (_disposed) return;
    _state = newState;
    _stateController.add(newState);
  }

  void _setError(String message) {
    if (_disposed) return;
    _errorMessage = message;
    _state = TransportState.error;
    _stateController.add(TransportState.error);
    _logger.severe(message);
  }
}
