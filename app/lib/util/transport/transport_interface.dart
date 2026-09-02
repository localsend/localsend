import 'dart:async';

/// Supported transport types for peer-to-peer relay.
enum TransportType {
  /// WiFi hotspot relay (device creates or connects to a WiFi network)
  wifiHotspot,

  /// USB tethering (device shares connectivity via USB cable)
  usbTethering,

  /// Local network (direct LAN discovery — used as fallback)
  localNetwork,
}

/// Transport connection state.
enum TransportState {
  /// Transport is available but not active
  idle,

  /// Transport is starting / connecting
  connecting,

  /// Transport is active and ready for data transfer
  connected,

  /// Transport encountered an error
  error,

  /// Transport was disconnected
  disconnected,
}

/// Peer device information discovered via a transport.
class PeerInfo {
  final String id;
  final String alias;
  final String? ipAddress;
  final int? port;
  final TransportType transportType;
  final Map<String, dynamic> metadata;

  const PeerInfo({
    required this.id,
    required this.alias,
    this.ipAddress,
    this.port,
    required this.transportType,
    this.metadata = const {},
  });

  @override
  String toString() => 'PeerInfo(id: $id, alias: $alias, ip: $ipAddress, via: $transportType)';
}

/// Configuration for starting a transport in host mode.
class HostConfig {
  /// Display name for this host/device
  final String alias;

  /// Optional custom SSID (WiFi hotspot only)
  final String? ssid;

  /// Optional custom password
  final String? password;

  const HostConfig({
    required this.alias,
    this.ssid,
    this.password,
  });
}

/// Configuration for connecting to a host.
class ConnectConfig {
  /// Host SSID or network identifier
  final String ssid;

  /// Password or authentication token
  final String password;

  const ConnectConfig({
    required this.ssid,
    required this.password,
  });
}

/// Transport connection information (returned after successful start/connect).
class TransportInfo {
  final TransportType type;
  final String? networkName;
  final String? password;
  final bool isRunning;
  final Map<String, dynamic> metadata;

  const TransportInfo({
    required this.type,
    this.networkName,
    this.password,
    this.isRunning = false,
    this.metadata = const {},
  });
}

/// Abstract interface for all transport implementations.
///
/// Each transport type (WiFi hotspot, USB tethering, etc.) provides
/// a concrete implementation of this interface. The PrpService manages
/// multiple transports through this unified API.
abstract class TransportInterface {
  /// The type of this transport.
  TransportType get type;

  /// Current state of this transport.
  TransportState get state;

  /// Current connection info (non-null when state is connected).
  TransportInfo? get transportInfo;

  /// Error message if state is [TransportState.error].
  String? get errorMessage;

  /// Whether this transport is currently usable on this platform.
  /// Returns false if the platform doesn't support this transport type.
  bool get isAvailable;

  /// Stream of peers discovered via this transport.
  Stream<PeerInfo> get onPeerDiscovered;

  /// Stream of transport state changes.
  Stream<TransportState> get onStateChanged;

  /// Start this transport in host mode.
  ///
  /// For WiFi hotspot: starts a local-only hotspot.
  /// For USB tethering: starts USB network sharing.
  /// Returns true if started successfully.
  Future<bool> start({required HostConfig config});

  /// Stop host mode.
  Future<void> stop();

  /// Connect to a host's network as a client.
  ///
  /// For WiFi hotspot: connects to the specified SSID.
  /// For USB tethering: connects via USB network interface.
  /// Returns true if connected successfully.
  Future<bool> connect({required ConnectConfig config});

  /// Disconnect from the host's network.
  Future<void> disconnect();

  /// Clean up all resources held by this transport.
  Future<void> dispose();
}
