import 'dart:async';

import 'package:localsend_app/util/transport/wifi_hotspot_transport_web.dart'
    if (dart.library.io) 'package:localsend_app/util/transport/wifi_hotspot_transport_io.dart';

import 'package:flutter/services.dart';
import 'package:localsend_app/util/transport/transport_interface.dart';
import 'package:logging/logging.dart';

final _logger = Logger('WifiHotspotTransport');

/// WiFi hotspot transport implementation.
///
/// Uses the platform's native hotspot API (MethodChannel) to create
/// or connect to a WiFi hotspot for peer-to-peer relay.
///
/// Currently supports Android via [HotspotRelayPlugin].
/// Cross-platform support planned per TransportInterface contract.
class WifiHotspotTransport implements TransportInterface {
  static const _channel = MethodChannel('org.localsend.localsend_app/hotspot_relay');

  TransportState _state = TransportState.idle;
  TransportInfo? _transportInfo;
  String? _errorMessage;

  final StreamController<PeerInfo> _peerController = StreamController<PeerInfo>.broadcast();
  final StreamController<TransportState> _stateController = StreamController<TransportState>.broadcast();

  @override
  TransportType get type => TransportType.wifiHotspot;

  @override
  TransportState get state => _state;

  @override
  TransportInfo? get transportInfo => _transportInfo;

  @override
  String? get errorMessage => _errorMessage;

  @override
  bool get isAvailable {
    try {
      return isAndroidPlatform; // Currently only Android supports hotspot relay
    } catch (e) {
      _logger.warning('Platform check failed in isAvailable: $e');
      return false;
    }
  }

  @override
  Stream<PeerInfo> get onPeerDiscovered => _peerController.stream;

  @override
  Stream<TransportState> get onStateChanged => _stateController.stream;

  @override
  Future<bool> start({required HostConfig config}) async {
    _logger.info('Starting WiFi hotspot (SSID: ${config.ssid ?? "auto"})');
    _setState(TransportState.connecting);

    try {
      final result = await _channel.invokeMethod<Map>('startHotspot');
      if (result == null) {
        _setError('Failed to start hotspot: null response');
        return false;
      }

      final ssid = result['ssid'] as String? ?? '';
      final password = result['password'] as String? ?? '';
      final isRunning = result['isRunning'] as bool? ?? false;

      _transportInfo = TransportInfo(
        type: TransportType.wifiHotspot,
        networkName: ssid,
        password: password,
        isRunning: isRunning,
      );

      _setState(TransportState.connected);
      _logger.info('Hotspot started: $ssid');
      return true;
    } catch (e) {
      _setError('Failed to start hotspot: $e');
      return false;
    }
  }

  @override
  Future<void> stop() async {
    _logger.info('Stopping WiFi hotspot');
    try {
      await _channel.invokeMethod('stopHotspot');
    } catch (e) {
      _logger.warning('Error stopping hotspot: $e');
    }
    _transportInfo = null;
    _errorMessage = null;
    _setState(TransportState.disconnected);
  }

  @override
  Future<bool> connect({required ConnectConfig config}) async {
    _logger.info('Connecting to WiFi hotspot: ${config.ssid}');
    _setState(TransportState.connecting);

    try {
      final result = await _channel.invokeMethod<Map>('connectToWifi', {
        'ssid': config.ssid,
        'password': config.password,
      });

      final connected = result?['connected'] == true;
      if (connected) {
        _transportInfo = TransportInfo(
          type: TransportType.wifiHotspot,
          networkName: config.ssid,
          password: config.password,
          isRunning: true,
        );
        _setState(TransportState.connected);
        _logger.info('Connected to: ${config.ssid}');
        return true;
      } else {
        _setError('Failed to connect to hotspot');
        return false;
      }
    } catch (e) {
      _setError('Connection error: $e');
      return false;
    }
  }

  @override
  Future<void> disconnect() async {
    _logger.info('Disconnecting from WiFi hotspot');
    try {
      await _channel.invokeMethod('disconnectWifi');
    } catch (e) {
      _logger.warning('Error disconnecting: $e');
    }
    _transportInfo = null;
    _errorMessage = null;
    _setState(TransportState.disconnected);
  }

  /// Check if currently connected to a hotspot network (no-internet WiFi).
  Future<bool> isConnectedToHotspot() async {
    try {
      final result = await _channel.invokeMethod<bool>('isConnectedToHotspot');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Get current hotspot info.
  Future<TransportInfo> getCurrentInfo() async {
    try {
      final result = await _channel.invokeMethod<Map>('getHotspotInfo');
      if (result != null) {
        return TransportInfo(
          type: TransportType.wifiHotspot,
          networkName: result['ssid'] as String? ?? '',
          password: result['password'] as String? ?? '',
          isRunning: result['isRunning'] as bool? ?? false,
        );
      }
    } catch (e) {
      _logger.warning('Failed to get hotspot info: $e');
    }
    return const TransportInfo(type: TransportType.wifiHotspot);
  }

  @override
  Future<void> dispose() async {
    await stop();
    await _peerController.close();
    await _stateController.close();
  }

  // ============================================================
  //  Internal helpers
  // ============================================================

  void _setState(TransportState newState) {
    _state = newState;
    _stateController.add(newState);
  }

  void _setError(String message) {
    _errorMessage = message;
    _state = TransportState.error;
    _stateController.add(TransportState.error);
    _logger.severe(message);
  }
}
