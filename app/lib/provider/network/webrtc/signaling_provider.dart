import 'dart:async';
import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:common/constants.dart';
import 'package:common/model/device.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:localsend_app/constants/remote_config.dart';
import 'package:localsend_app/model/webrtc/ice_server_config.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/webrtc/webrtc_receiver.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/rust/api/crypto.dart' as crypto;
import 'package:localsend_app/rust/api/model.dart' as rust;
import 'package:localsend_app/rust/api/webrtc.dart' as rust_webrtc;
import 'package:refena_flutter/refena_flutter.dart';

part 'signaling_provider.mapper.dart';

@MappableClass()
class SignalingState with SignalingStateMappable {
  final bool enabled;
  final String? roomSecret;
  final List<String> signalingServers;
  final List<IceServerConfig> iceServers;
  final Map<String, rust_webrtc.LsSignalingConnection> connections;

  SignalingState({
    required this.enabled,
    required this.roomSecret,
    required this.signalingServers,
    required this.iceServers,
    required this.connections,
  });
}

final signalingProvider = ReduxProvider<SignalingService, SignalingState>((
  ref,
) {
  return SignalingService(persistence: ref.read(persistenceProvider));
});

class SignalingService extends ReduxNotifier<SignalingState> {
  final PersistenceService _persistence;

  SignalingService({required PersistenceService persistence}) : _persistence = persistence;

  @override
  SignalingState init() {
    return SignalingState(
      enabled: _persistence.isRemoteDiscoveryEnabled(),
      roomSecret: _persistence.getRemoteRoomSecret(),
      signalingServers: _persistence.getSignalingServers() ?? defaultSignalingServers,
      iceServers: buildIceServers(
        urls: _persistence.getStunServers() ?? defaultStunServers,
        turnUsername: _persistence.getTurnUsername(),
        turnCredential: _persistence.getTurnCredential(),
      ),
      connections: {},
    );
  }
}

class SetupSignalingConnection extends ReduxAction<SignalingService, SignalingState> with GlobalActions {
  @override
  SignalingState reduce() {
    if (!state.enabled || state.roomSecret == null || state.roomSecret!.isEmpty) {
      return state;
    }

    for (final signalingServer in state.signalingServers) {
      // ignore: discarded_futures
      global.dispatchAsync(
        _SetupSignalingConnection(
          signalingServer: signalingServer,
          roomSecret: state.roomSecret!,
        ),
      );
    }
    return state;
  }
}

/// Starts an endless running action.
class _SetupSignalingConnection extends AsyncGlobalAction {
  final String signalingServer;
  final String roomSecret;

  _SetupSignalingConnection({
    required this.signalingServer,
    required this.roomSecret,
  });

  @override
  Future<void> reduce() async {
    final settings = ref.read(settingsProvider);
    final deviceInfo = ref.read(deviceInfoProvider);

    // TODO: Use persistent key
    final key = await crypto.generateKeyPair();
    if (kDebugMode) {
      print('private key: ${key.privateKey}');
    }

    rust_webrtc.LsSignalingConnection? connection;
    final stream = rust_webrtc.connect(
      uri: _signalingUriWithRoom(signalingServer, roomSecret),
      info: rust_webrtc.ProposingClientInfo(
        alias: settings.alias,
        version: protocolVersion,
        deviceModel: deviceInfo.deviceModel,
        deviceType: deviceInfo.deviceType.toRustDeviceType(),
      ),
      privateKey: key.privateKey,
      onConnection: (c) {
        connection = c;

        ref
            .redux(signalingProvider)
            .dispatch(
              _SetConnectionAction(
                signalingServer: signalingServer,
                connection: c,
              ),
            );
      },
    );

    try {
      await for (final message in stream) {
        switch (message) {
          case rust_webrtc.WsServerMessage_Hello():
            for (final d in message.peers) {
              ref
                  .redux(nearbyDevicesProvider)
                  .dispatch(
                    RegisterSignalingDeviceAction(d.toDevice(signalingServer)),
                  );
            }
            break;
          case rust_webrtc.WsServerMessage_Join(peer: final peer):
          case rust_webrtc.WsServerMessage_Update(peer: final peer):
            ref
                .redux(nearbyDevicesProvider)
                .dispatch(
                  RegisterSignalingDeviceAction(peer.toDevice(signalingServer)),
                );
            break;
          case rust_webrtc.WsServerMessage_Left():
            ref.redux(nearbyDevicesProvider).dispatch(UnregisterSignalingDeviceAction(message.peerId.uuid));
            break;
          case rust_webrtc.WsServerMessage_Offer():
            final provider = ReduxProvider<WebRTCReceiveService, WebRTCReceiveState>((ref) {
              final settings = ref.read(settingsProvider);
              final iceServers = buildCurrentIceServers(
                fallbackUrls: ref.read(signalingProvider).iceServers.expand((server) => server.urls).toList(),
                currentUrls: ref.notifier(settingsProvider).getStunServers(),
                turnUsername: settings.turnUsername,
                turnCredential: settings.turnCredential,
              );

              return WebRTCReceiveService(
                ref: ref,
                signalingServer: signalingServer,
                iceServers: iceServers,
                connection: connection!,
                offer: message.field0,
                settings: ref.read(settingsProvider),
                favorites: ref.read(favoritesProvider),
                key: ref.read(securityProvider),
              );
            });

            await ref.redux(provider).dispatchAsync(AcceptOfferAction());
            break;
          case rust_webrtc.WsServerMessage_Answer():
          case rust_webrtc.WsServerMessage_Error():
        }
      }
    } finally {
      ref.redux(signalingProvider).dispatch(_RemoveConnectionAction(signalingServer: signalingServer));
    }

    return state;
  }
}

String _signalingUriWithRoom(String signalingServer, String roomSecret) {
  final room = CryptoUtils.getHash(
    Uint8List.fromList(utf8.encode(roomSecret)),
    algorithmName: 'SHA-256',
  ).toLowerCase();
  final uri = Uri.parse(signalingServer);
  return uri.replace(queryParameters: {...uri.queryParameters, 'room': room}).toString();
}

class _SetConnectionAction extends ReduxAction<SignalingService, SignalingState> {
  final String signalingServer;
  final rust_webrtc.LsSignalingConnection connection;

  _SetConnectionAction({
    required this.signalingServer,
    required this.connection,
  });

  @override
  SignalingState reduce() {
    return state.copyWith(
      connections: {...state.connections, signalingServer: connection},
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

extension ClientInfoExt on rust_webrtc.ClientInfo {
  Device toDevice(String signalingServer) {
    return Device(
      signalingId: id.uuid,
      ip: null,
      version: version,
      port: -1,
      https: false,
      fingerprint: token,
      alias: alias,
      deviceModel: deviceModel,
      deviceType: deviceType?.toDeviceType() ?? DeviceType.desktop,
      download: false,
      discoveryMethods: {SignalingDiscovery(signalingServer: signalingServer)},
    );
  }
}

extension on rust.DeviceType {
  DeviceType toDeviceType() {
    return switch (this) {
      rust.DeviceType.mobile => DeviceType.mobile,
      rust.DeviceType.desktop => DeviceType.desktop,
      rust.DeviceType.web => DeviceType.web,
      rust.DeviceType.headless => DeviceType.headless,
      rust.DeviceType.server => DeviceType.server,
    };
  }
}

extension on DeviceType {
  rust.DeviceType toRustDeviceType() {
    return switch (this) {
      DeviceType.mobile => rust.DeviceType.mobile,
      DeviceType.desktop => rust.DeviceType.desktop,
      DeviceType.web => rust.DeviceType.web,
      DeviceType.headless => rust.DeviceType.headless,
      DeviceType.server => rust.DeviceType.server,
    };
  }
}
