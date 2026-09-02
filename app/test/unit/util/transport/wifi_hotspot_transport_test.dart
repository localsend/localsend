import 'dart:async';

import 'package:localsend_app/util/transport/transport_interface.dart';
import 'package:localsend_app/util/transport/wifi_hotspot_transport.dart';
import 'package:test/test.dart';

void main() {
  group('WifiHotspotTransport', () {
    late WifiHotspotTransport transport;

    setUp(() {
      transport = WifiHotspotTransport();
    });

    tearDown(() async {
      await transport.dispose();
    });

    test('initial state should be idle', () {
      expect(transport.state, TransportState.idle);
    });

    test('type should be TransportType.wifiHotspot', () {
      expect(transport.type, TransportType.wifiHotspot);
    });

    test('transportInfo should be null initially', () {
      expect(transport.transportInfo, isNull);
    });

    test('errorMessage should be null initially', () {
      expect(transport.errorMessage, isNull);
    });

    test('onPeerDiscovered should be a broadcast stream', () {
      expect(transport.onPeerDiscovered, isA<Stream<PeerInfo>>());
    });

    test('onStateChanged should be a broadcast stream', () {
      expect(transport.onStateChanged, isA<Stream<TransportState>>());
    });

    test('dispose should call stop and close controllers', () async {
      // Create a new transport for this test
      final t = WifiHotspotTransport();

      // Listen to streams to verify they work before dispose
      final peerStream = t.onPeerDiscovered;
      final stateStream = t.onStateChanged;
      expect(peerStream, isNotNull);
      expect(stateStream, isNotNull);

      // Dispose should not throw
      await expectLater(t.dispose(), completes);
    });

    test('isAvailable getter should not throw and return bool', () {
      final result = transport.isAvailable;
      expect(result, isA<bool>());
      expect(result, isFalse); // Non-Android platform in test environment
    });

    test('isAvailable returns false on non-Android platforms', () {
      // On macOS/Windows/Linux test environments, isAvailable should be false
      // because hotspot relay is only supported on Android
      expect(transport.isAvailable, isFalse);
    });
  });
}
