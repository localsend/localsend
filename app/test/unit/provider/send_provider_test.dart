import 'package:common/model/device.dart';
import 'package:localsend_app/model/webrtc/ice_server_config.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('findTargetSignalingServer', () {
    test('returns the signaling server for a signaling device', () {
      final device = _createDevice(
        ip: null,
        discoveryMethods: {
          SignalingDiscovery(signalingServer: 'wss://example.com/ws'),
        },
      );

      expect(findTargetSignalingServer(device), 'wss://example.com/ws');
    });

    test('returns null when the device has no signaling discovery', () {
      final device = _createDevice(
        ip: '192.168.1.10',
        discoveryMethods: {const HttpDiscovery(ip: '192.168.1.10')},
      );

      expect(findTargetSignalingServer(device), isNull);
    });
  });

  group('buildCurrentIceServers', () {
    test('uses the latest urls and turn credentials from settings', () {
      final result = buildCurrentIceServers(
        fallbackUrls: ['stun:old.example.com:3478'],
        currentUrls: ['turn:turn.example.com:3478?transport=udp'],
        turnUsername: 'user',
        turnCredential: 'secret',
      );

      expect(result, [
        const IceServerConfig(
          urls: ['turn:turn.example.com:3478?transport=udp'],
          username: 'user',
          credential: 'secret',
        ),
      ]);
    });
  });
}

Device _createDevice({
  required String? ip,
  required Set<DiscoveryMethod> discoveryMethods,
}) {
  return Device(
    signalingId: '00000000-0000-4000-8000-000000000001',
    ip: ip,
    version: '1',
    port: 53317,
    https: false,
    fingerprint: 'fingerprint',
    alias: 'Device',
    deviceModel: null,
    deviceType: DeviceType.desktop,
    download: false,
    discoveryMethods: discoveryMethods,
  );
}
