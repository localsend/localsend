import 'dart:async';

import 'package:common/constants.dart';
import 'package:common/model/device.dart';
import 'package:common/model/device_info_result.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/rust/api/webrtc.dart';
import 'package:refena_flutter/refena_flutter.dart';

part 'signaling_provider.mapper.dart';

@MappableClass()
class SignalingState with SignalingStateMappable {
  final List<String> signalingServers;
  final List<String> stunServers;
  final Map<String, LsSignalingConnection> connections;

  SignalingState({
    required this.signalingServers,
    required this.stunServers,
    required this.connections,
  });
}

final signalingProvider = ReduxProvider<SignalingService, SignalingState>((ref) {
  return SignalingService(
    persistence: ref.read(persistenceProvider),
    nearbyDevices: ref.notifier(nearbyDevicesProvider),
    settings: ref.notifier(settingsProvider),
    deviceInfo: ref.accessor(deviceInfoProvider),
    security: ref.notifier(securityProvider),
  );
});

class SignalingService extends ReduxNotifier<SignalingState> {
  final PersistenceService _persistence;
  final NearbyDevicesService _nearbyDevices;
  final SettingsService _settings;
  final StateAccessor<DeviceInfoResult> _deviceInfo;
  final SecurityService _security;

  SignalingService({
    required PersistenceService persistence,
    required NearbyDevicesService nearbyDevices,
    required SettingsService settings,
    required StateAccessor<DeviceInfoResult> deviceInfo,
    required SecurityService security,
  })  : _persistence = persistence,
        _nearbyDevices = nearbyDevices,
        _settings = settings,
        _deviceInfo = deviceInfo,
        _security = security;

  @override
  SignalingState init() {
    return SignalingState(
      signalingServers: _persistence.getSignalingServers() ?? ['wss://public.localsend.org/v1/ws'],
      stunServers: _persistence.getStunServers() ?? ['stun:stun.localsend.org:5349'],
      connections: {},
    );
  }
}

class SetupSignalingConnection extends ReduxAction<SignalingService, SignalingState> {
  @override
  SignalingState reduce() {
    for (final signalingServer in state.signalingServers) {
      // ignore: discarded_futures
      dispatchAsync(_SetupSignalingConnection(signalingServer: signalingServer));
    }
    return state;
  }
}

/// Starts an endless running action.
class _SetupSignalingConnection extends AsyncReduxAction<SignalingService, SignalingState> {
  final String signalingServer;

  _SetupSignalingConnection({required this.signalingServer});

  @override
  Future<SignalingState> reduce() async {
    LsSignalingConnection? connection;
    final stream = connect(
      uri: 'wss://public.localsend.org/v1/ws',
      info: ClientInfoWithoutId(
        alias: notifier._settings.state.alias,
        version: protocolVersion,
        deviceModel: notifier._deviceInfo.state.deviceModel,
        deviceType: notifier._deviceInfo.state.deviceType.toPeerDeviceType(),
        fingerprint: notifier._security.state.certificateHash,
      ),
      onConnection: (c) {
        connection = c;

        dispatch(_SetConnectionAction(
          signalingServer: signalingServer,
          connection: c,
        ));
      },
    );

    try {
      await for (final message in stream) {
        switch (message) {
          case WsServerMessage_Hello():
            for (final d in message.peers) {
              external(notifier._nearbyDevices).dispatch(RegisterSignalingDeviceAction(
                d.toDevice(signalingServer),
              ));
            }
            break;
          case WsServerMessage_Joined():
            external(notifier._nearbyDevices).dispatch(RegisterSignalingDeviceAction(
              message.peer.toDevice(signalingServer),
            ));
            break;
          case WsServerMessage_Left():
            external(notifier._nearbyDevices).dispatch(UnregisterSignalingDeviceAction(
              message.peerId.uuid,
            ));
            break;
          case WsServerMessage_Offer():
          case WsServerMessage_Answer():
          case WsServerMessage_Error():
        }
      }
    } finally {
      dispatch(_RemoveConnectionAction(signalingServer: signalingServer));
    }

    return state;
  }
}

class _SetConnectionAction extends ReduxAction<SignalingService, SignalingState> {
  final String signalingServer;
  final LsSignalingConnection connection;

  _SetConnectionAction({
    required this.signalingServer,
    required this.connection,
  });

  @override
  SignalingState reduce() {
    return state.copyWith(
      connections: {
        ...state.connections,
        signalingServer: connection,
      },
    );
  }
}

class _RemoveConnectionAction extends ReduxAction<SignalingService, SignalingState> {
  final String signalingServer;

  _RemoveConnectionAction({required this.signalingServer});

  @override
  SignalingState reduce() {
    return state.copyWith(
      connections: {
        for (final entry in state.connections.entries)
          if (entry.key != signalingServer) entry.key: entry.value,
      },
    );
  }
}

extension on ClientInfo {
  Device toDevice(String signalingServer) {
    return Device(
      signalingId: id.uuid,
      ip: null,
      version: version,
      port: -1,
      https: false,
      fingerprint: fingerprint,
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType?.toDeviceType() ?? DeviceType.desktop,
      download: false,
      discoveryMethods: {
        SignalingDiscovery(
          signalingServer: signalingServer,
        ),
      },
    );
  }
}

extension on PeerDeviceType {
  DeviceType toDeviceType() {
    return switch (this) {
      PeerDeviceType.mobile => DeviceType.mobile,
      PeerDeviceType.desktop => DeviceType.desktop,
      PeerDeviceType.web => DeviceType.web,
      PeerDeviceType.headless => DeviceType.headless,
      PeerDeviceType.server => DeviceType.server,
    };
  }
}

extension on DeviceType {
  PeerDeviceType toPeerDeviceType() {
    return switch (this) {
      DeviceType.mobile => PeerDeviceType.mobile,
      DeviceType.desktop => PeerDeviceType.desktop,
      DeviceType.web => PeerDeviceType.web,
      DeviceType.headless => PeerDeviceType.headless,
      DeviceType.server => PeerDeviceType.server,
    };
  }
}
