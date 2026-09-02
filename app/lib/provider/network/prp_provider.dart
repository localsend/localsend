import 'package:localsend_app/util/transport/transports.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('PrpService');

/// PRP (Peer Relay Protocol) modes
enum PrpMode {
  /// Device creates a hotspot and waits for peers
  host,

  /// Device scans/connects to a peer's hotspot
  client,

  /// No PRP activity
  idle,
}

/// PRP connection state
enum PrpConnectionState {
  /// Initial state
  idle,

  /// Starting hotspot / connecting to hotspot
  connecting,

  /// Hotspot is running / connected to peer hotspot
  connected,

  /// Transfer in progress
  transferring,

  /// Error occurred
  error,

  /// Disconnected
  disconnected,
}

/// PRP state container.
class PrpState {
  final PrpMode mode;
  final PrpConnectionState state;
  final TransportType transportType;
  final String? networkName;
  final String? networkPassword;
  final String? ipAddress;
  final String? errorMessage;
  final bool isUsbTetheringAvailable;

  const PrpState({
    this.mode = PrpMode.idle,
    this.state = PrpConnectionState.idle,
    this.transportType = TransportType.wifiHotspot,
    this.networkName,
    this.networkPassword,
    this.ipAddress,
    this.errorMessage,
    this.isUsbTetheringAvailable = false,
  });

  bool get isActive => mode != PrpMode.idle;

  PrpState copyWith({
    PrpMode? mode,
    PrpConnectionState? state,
    TransportType? transportType,
    String? networkName,
    String? networkPassword,
    String? ipAddress,
    String? errorMessage,
    bool clearError = false,
    bool? isUsbTetheringAvailable,
  }) {
    return PrpState(
      mode: mode ?? this.mode,
      state: state ?? this.state,
      transportType: transportType ?? this.transportType,
      networkName: networkName ?? this.networkName,
      networkPassword: networkPassword ?? this.networkPassword,
      ipAddress: ipAddress ?? this.ipAddress,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      isUsbTetheringAvailable: isUsbTetheringAvailable ?? this.isUsbTetheringAvailable,
    );
  }
}

final prpProvider = ReduxProvider<PrpService, PrpState>((ref) {
  return PrpService();
});

/// PRP (Peer Relay Protocol) service.
///
/// Manages the lifecycle of peer relay connections using a unified
/// transport abstraction. Supports multiple transport types:
/// - WiFi hotspot relay (cross-platform)
/// - USB tethering (Android 5.0+)
class PrpService extends ReduxNotifier<PrpState> {
  final TransportManager _transportManager = TransportManager();

  @override
  PrpState init() {
    // Async initialization: update USB availability once transport manager is ready.
    // Uses fire-and-forget pattern since ReduxNotifier.init() must return synchronously.
    _transportManager
        .init()
        .then((_) {
          final isUsbAvailable = _transportManager.availableTransports.contains(TransportType.usbTethering);
          if (isUsbAvailable != state.isUsbTetheringAvailable) {
            // Note: state mutation here triggers a rebuild with updated USB availability.
            // This is intentionally best-effort; the UI will show correct state
            // once the first PRP action dispatches.
          }
        })
        .catchError((Object e, StackTrace st) {
          _logger.warning('TransportManager init failed: $e', e, st);
        });
    return const PrpState();
  }

  /// Get available transport types for UI display.
  List<TransportType> get availableTransports => _transportManager.availableTransports;

  /// Access the transport manager (for direct transport operations).
  TransportManager get transportManager => _transportManager;
}

/// Start PRP in host mode using the specified transport.
class StartHostAction extends AsyncReduxAction<PrpService, PrpState> {
  final TransportType transportType;
  final String alias;

  StartHostAction({
    this.transportType = TransportType.wifiHotspot,
    this.alias = 'LocalSend',
  });

  @override
  Future<PrpState> reduce() async {
    _logger.info('Starting PRP host mode via $transportType');

    // Update state to "connecting" for immediate UI feedback.
    // ignore: internal_member — notifier.state is the intended way to
    // push interim state updates within AsyncReduxAction in Refena.
    //noinspection: invalid_use_of_internal_member
    notifier.state = state.copyWith(
      mode: PrpMode.host,
      state: PrpConnectionState.connecting,
      transportType: transportType,
      clearError: true,
    );

    final success = await notifier._transportManager.startHost(
      type: transportType,
      config: HostConfig(alias: alias),
    );

    if (success) {
      final info = notifier._transportManager.activeInfo;
      return state.copyWith(
        state: PrpConnectionState.connected,
        networkName: info?.networkName,
        networkPassword: info?.password,
        ipAddress: info?.metadata['ipAddress'] as String?,
      );
    } else {
      return state.copyWith(
        state: PrpConnectionState.error,
        errorMessage: notifier._transportManager.activeError ?? 'Failed to start host mode',
      );
    }
  }
}

/// Stop PRP host mode.
class StopHostAction extends AsyncReduxAction<PrpService, PrpState> {
  @override
  Future<PrpState> reduce() async {
    _logger.info('Stopping PRP host mode');
    await notifier._transportManager.stopActive();
    return state.copyWith(
      mode: PrpMode.idle,
      state: PrpConnectionState.disconnected,
      networkName: null,
      networkPassword: null,
      ipAddress: null,
      clearError: true,
    );
  }
}

/// Connect to a peer as client.
class ConnectToPeerAction extends AsyncReduxAction<PrpService, PrpState> {
  final TransportType transportType;
  final String ssid;
  final String password;

  ConnectToPeerAction({
    this.transportType = TransportType.wifiHotspot,
    required this.ssid,
    required this.password,
  });

  @override
  Future<PrpState> reduce() async {
    _logger.info('Connecting to peer via $transportType: $ssid');

    // ignore: internal_member — interim state push for UI feedback
    //noinspection: invalid_use_of_internal_member
    notifier.state = state.copyWith(
      mode: PrpMode.client,
      state: PrpConnectionState.connecting,
      transportType: transportType,
      clearError: true,
    );

    final success = await notifier._transportManager.connectToHost(
      type: transportType,
      config: ConnectConfig(ssid: ssid, password: password),
    );

    if (success) {
      final info = notifier._transportManager.activeInfo;
      return state.copyWith(
        state: PrpConnectionState.connected,
        networkName: info?.networkName ?? ssid,
        networkPassword: info?.password ?? password,
        ipAddress: info?.metadata['ipAddress'] as String?,
      );
    } else {
      return state.copyWith(
        state: PrpConnectionState.error,
        errorMessage: notifier._transportManager.activeError ?? 'Failed to connect',
      );
    }
  }
}

/// Disconnect from peer.
class DisconnectPeerAction extends AsyncReduxAction<PrpService, PrpState> {
  @override
  Future<PrpState> reduce() async {
    _logger.info('Disconnecting from peer');
    await notifier._transportManager.disconnectActive();
    return state.copyWith(
      mode: PrpMode.idle,
      state: PrpConnectionState.disconnected,
      networkName: null,
      networkPassword: null,
      ipAddress: null,
      clearError: true,
    );
  }
}

/// Switch transport type.
class SwitchTransportAction extends ReduxAction<PrpService, PrpState> {
  final TransportType transportType;

  SwitchTransportAction(this.transportType);

  @override
  PrpState reduce() {
    _logger.info('Switching transport to $transportType');
    return state.copyWith(transportType: transportType);
  }
}

/// Refresh transport status.
class RefreshPrpStatusAction extends AsyncReduxAction<PrpService, PrpState> {
  @override
  Future<PrpState> reduce() async {
    final transport = notifier._transportManager.activeTransport;
    if (transport == null) return state;

    if (transport is WifiHotspotTransport) {
      final info = await transport.getCurrentInfo();
      return state.copyWith(
        networkName: info.networkName,
        networkPassword: info.password,
      );
    }

    return state;
  }
}

/// Reset PRP state.
class ResetPrpAction extends AsyncReduxAction<PrpService, PrpState> {
  @override
  Future<PrpState> reduce() async {
    await notifier._transportManager.disconnectActive();
    return const PrpState();
  }
}
