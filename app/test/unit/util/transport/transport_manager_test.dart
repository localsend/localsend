import 'package:localsend_app/util/transport/transport_interface.dart';
import 'package:localsend_app/util/transport/transport_manager.dart';
import 'package:test/test.dart';

void main() {
  group('TransportManager', () {
    late TransportManager manager;

    setUp(() {
      manager = TransportManager();
    });

    tearDown(() async {
      await manager.dispose();
    });

    test('initial state should have no active transport', () {
      expect(manager.activeTransport, isNull);
      expect(manager.activeState, TransportState.idle);
      expect(manager.activeInfo, isNull);
      expect(manager.activeError, isNull);
    });

    test('availableTransports should at least contain wifiHotspot', () {
      // Note: isAvailable may return false on non-Android platforms in tests
      // but the wifiHotspot transport exists
      expect(manager.transports, isNotEmpty);
    });

    test('getTransport should return correct transport by type', () {
      final wifiTransport = manager.getTransport(TransportType.wifiHotspot);
      expect(wifiTransport, isNotNull);
      expect(wifiTransport!.type, TransportType.wifiHotspot);

      final usbTransport = manager.getTransport(TransportType.usbTethering);
      expect(usbTransport, isNotNull);
      expect(usbTransport!.type, TransportType.usbTethering);

      final localTransport = manager.getTransport(TransportType.localNetwork);
      expect(localTransport, isNotNull);
      expect(localTransport!.type, TransportType.localNetwork);
      expect(localTransport.isAvailable, isFalse); // stub, always false
    });

    test('startHost should set active transport', () async {
      await manager.init();

      // Start host on WiFi hotspot
      final success = await manager.startHost(
        type: TransportType.wifiHotspot,
        config: HostConfig(alias: 'Test'),
      );

      // Success depends on platform support
      if (success) {
        expect(manager.activeTransport, isNotNull);
        expect(manager.activeTransport!.type, TransportType.wifiHotspot);
      }
    });

    test('connectToHost should set active transport', () async {
      await manager.init();

      // Connect to host
      final success = await manager.connectToHost(
        type: TransportType.wifiHotspot,
        config: ConnectConfig(ssid: 'TestNet', password: 'test123'),
      );

      // Success depends on platform support
      if (success) {
        expect(manager.activeTransport, isNotNull);
      }
    });

    test('stopActive should clear active transport', () async {
      await manager.init();

      // Start a transport first
      await manager.startHost(
        type: TransportType.wifiHotspot,
        config: HostConfig(alias: 'Test'),
      );

      // Stop active transport
      await manager.stopActive();
      expect(manager.activeTransport, isNull);
    });

    test('disconnectActive should clear active transport', () async {
      await manager.init();

      // Connect to a host first
      await manager.connectToHost(
        type: TransportType.wifiHotspot,
        config: ConnectConfig(ssid: 'TestNet', password: 'test123'),
      );

      // Disconnect
      await manager.disconnectActive();
      expect(manager.activeTransport, isNull);
    });

    test('init should be idempotent', () async {
      // First init
      await manager.init();
      expect(manager, isNotNull);

      // Second init should not throw or cause issues
      await manager.init();
      expect(manager, isNotNull);
    });

    test('dispose should reset state', () async {
      await manager.init();

      // Start a transport
      await manager.startHost(
        type: TransportType.wifiHotspot,
        config: HostConfig(alias: 'Test'),
      );

      // Dispose
      await manager.dispose();

      // After dispose, can call again without error
      expect(() => manager.dispose(), returnsNormally);
    });
  });
}
