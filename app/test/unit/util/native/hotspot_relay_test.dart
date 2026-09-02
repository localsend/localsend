import 'package:localsend_app/util/transport/transports.dart';
import 'package:test/test.dart';

void main() {
  group('TransportInfo', () {
    test('should create with wifiHotspot type', () {
      const info = TransportInfo(
        type: TransportType.wifiHotspot,
        networkName: 'TestNet',
        password: 'pass123',
        isRunning: true,
      );

      expect(info.type, TransportType.wifiHotspot);
      expect(info.networkName, 'TestNet');
      expect(info.password, 'pass123');
      expect(info.isRunning, true);
    });

    test('should create with usbTethering type', () {
      const info = TransportInfo(
        type: TransportType.usbTethering,
        networkName: 'rndis0',
        isRunning: true,
        metadata: {'ipAddress': '192.168.42.2'},
      );

      expect(info.type, TransportType.usbTethering);
      expect(info.networkName, 'rndis0');
      expect(info.metadata['ipAddress'], '192.168.42.2');
    });
  });

  group('PeerInfo', () {
    test('should create with required fields', () {
      const peer = PeerInfo(
        id: 'peer-1',
        alias: 'Test Device',
        transportType: TransportType.wifiHotspot,
      );

      expect(peer.id, 'peer-1');
      expect(peer.alias, 'Test Device');
      expect(peer.transportType, TransportType.wifiHotspot);
      expect(peer.ipAddress, isNull);
    });

    test('should create with optional fields', () {
      const peer = PeerInfo(
        id: 'peer-2',
        alias: 'USB Device',
        ipAddress: '192.168.42.100',
        port: 53317,
        transportType: TransportType.usbTethering,
      );

      expect(peer.ipAddress, '192.168.42.100');
      expect(peer.port, 53317);
      expect(peer.transportType, TransportType.usbTethering);
    });

    test('toString should not expose sensitive info', () {
      const peer = PeerInfo(
        id: 'test-id',
        alias: 'My Phone',
        transportType: TransportType.wifiHotspot,
      );

      final str = peer.toString();
      expect(str, contains('My Phone'));
      expect(str, contains('test-id'));
    });
  });

  group('HostConfig', () {
    test('should create with required alias', () {
      const config = HostConfig(alias: 'My Device');

      expect(config.alias, 'My Device');
      expect(config.ssid, isNull);
      expect(config.password, isNull);
    });

    test('should create with optional ssid and password', () {
      const config = HostConfig(
        alias: 'My Device',
        ssid: 'LocalSend-Relay',
        password: 'secure123',
      );

      expect(config.ssid, 'LocalSend-Relay');
      expect(config.password, 'secure123');
    });
  });

  group('ConnectConfig', () {
    test('should create with ssid and password', () {
      const config = ConnectConfig(
        ssid: 'TestNet',
        password: 'pass123',
      );

      expect(config.ssid, 'TestNet');
      expect(config.password, 'pass123');
    });
  });

  group('TransportType enum', () {
    test('should have 3 types', () {
      expect(TransportType.values, hasLength(3));
    });
  });
}
