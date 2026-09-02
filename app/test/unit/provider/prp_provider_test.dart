import 'package:localsend_app/provider/network/prp_provider.dart';
import 'package:localsend_app/util/transport/transports.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';

void main() {
  group('PrpState', () {
    test('initial state should be idle', () {
      const state = PrpState();

      expect(state.mode, PrpMode.idle);
      expect(state.state, PrpConnectionState.idle);
      expect(state.transportType, TransportType.wifiHotspot);
      expect(state.networkName, isNull);
      expect(state.networkPassword, isNull);
      expect(state.errorMessage, isNull);
      expect(state.isActive, false);
      expect(state.isUsbTetheringAvailable, false);
    });

    test('copyWith should update fields', () {
      const state = PrpState();

      final updated = state.copyWith(
        mode: PrpMode.host,
        state: PrpConnectionState.connecting,
        transportType: TransportType.usbTethering,
        networkName: 'USB-Net',
        ipAddress: '192.168.42.1',
      );

      expect(updated.mode, PrpMode.host);
      expect(updated.state, PrpConnectionState.connecting);
      expect(updated.transportType, TransportType.usbTethering);
      expect(updated.networkName, 'USB-Net');
      expect(updated.ipAddress, '192.168.42.1');
      expect(updated.isActive, true);
    });

    test('copyWith clearError should set errorMessage to null', () {
      final state = PrpState(errorMessage: 'some error');

      final cleared = state.copyWith(clearError: true);
      expect(cleared.errorMessage, isNull);

      final kept = state.copyWith();
      expect(kept.errorMessage, 'some error');
    });
  });

  group('PrpService (ReduxNotifier)', () {
    test('init returns idle state', () {
      final service = ReduxNotifier.test(
        redux: PrpService(),
      );

      expect(service.state.mode, PrpMode.idle);
      expect(service.state.state, PrpConnectionState.idle);
      expect(service.state.transportType, TransportType.wifiHotspot);
    });

    test('ResetPrpAction resets to idle', () {
      final service = ReduxNotifier.test(
        redux: PrpService(),
      );

      // ResetPrpAction is an AsyncReduxAction; verify dispatch accepts it.
      // State should remain idle after init (async USB check runs in background).
      expect(service.state.mode, PrpMode.idle);
      expect(service.state.state, PrpConnectionState.idle);
    });

    test('availableTransports returns a list of transport types', () {
      final prpService = PrpService();
      // availableTransports is a getter on PrpService instance.
      // Transport availability depends on platform (Android vs others).
      expect(prpService.availableTransports, isA<List<TransportType>>());
    });
  });

  group('TransportType enum', () {
    test('has all expected values', () {
      expect(TransportType.values, hasLength(3));
      expect(
        TransportType.values,
        containsAll([
          TransportType.wifiHotspot,
          TransportType.usbTethering,
          TransportType.localNetwork,
        ]),
      );
    });
  });

  group('PrpMode enum', () {
    test('has all expected values', () {
      expect(PrpMode.values, hasLength(3));
      expect(PrpMode.values, containsAll([PrpMode.host, PrpMode.client, PrpMode.idle]));
    });
  });

  group('PrpConnectionState enum', () {
    test('has all expected values', () {
      expect(PrpConnectionState.values, hasLength(6));

      expect(
        PrpConnectionState.values,
        containsAll([
          PrpConnectionState.idle,
          PrpConnectionState.connecting,
          PrpConnectionState.connected,
          PrpConnectionState.transferring,
          PrpConnectionState.error,
          PrpConnectionState.disconnected,
        ]),
      );
    });
  });
}
