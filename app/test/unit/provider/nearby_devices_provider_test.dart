import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/discovery_event.dart';
import 'package:mockito/mockito.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

class _SyncState extends Fake implements SyncState {}

void main() {
  /// A container whose discovery emits the given [events] and then ends.
  RefenaContainer createContainer(List<DiscoveryEvent> events) {
    return RefenaContainer(
      overrides: [
        persistenceProvider.overrideWithValue(MockPersistenceService()),
        parentIsolateProvider.overrideWithReducer(
          notifier: (_) => IsolateController(initialState: ParentIsolateState.initial(_SyncState())),
          reducer: {
            IsolateDiscoveryListenAction: (state) => (state, Stream<DiscoveryEvent>.fromIterable(events)),
          },
        ),
      ],
    );
  }

  test('Should register a confirmed device', () async {
    final device = _createDevice(fingerprint: '111', alias: 'Nice Banana');
    final ref = createContainer([DiscoveryDeviceEvent(device: device)]);

    await ref.redux(nearbyDevicesProvider).dispatchAsync(StartDiscoveryListener());

    expect(ref.read(nearbyDevicesProvider).devices, {'111': device});
    expect(ref.read(discoveryLoggerProvider).map((e) => e.log), ['[DISCOVER] Nice Banana (192.168.1.2, model: Pixel)']);
  });

  test('Should replace a device by its updated state', () async {
    final untested = _createDevice(fingerprint: '111', outbound: ChannelOutbound.untested);
    final failed = _createDevice(fingerprint: '111', outbound: ChannelOutbound.failed);
    final ref = createContainer([DiscoveryDeviceEvent(device: untested), DiscoveryDeviceEvent(device: failed)]);

    await ref.redux(nearbyDevicesProvider).dispatchAsync(StartDiscoveryListener());

    expect(ref.read(nearbyDevicesProvider).devices, {'111': failed});
  });

  test('Should only log an unreachable device', () async {
    final device = _createDevice(fingerprint: '222', alias: 'Shy Apple');
    final ref = createContainer([DiscoveryUnreachableEvent(device: device, error: 'connection refused')]);

    await ref.redux(nearbyDevicesProvider).dispatchAsync(StartDiscoveryListener());

    expect(ref.read(nearbyDevicesProvider).devices, isEmpty);
    expect(ref.read(nearbyDevicesProvider).allDevices, isEmpty);
    expect(ref.read(discoveryLoggerProvider).map((e) => e.log), ['[UNREACHABLE] Shy Apple (192.168.1.2:53317): connection refused']);
  });

  test('Should keep a confirmed device when it is reported unreachable afterwards', () async {
    final device = _createDevice(fingerprint: '111');
    final ref = createContainer([
      DiscoveryDeviceEvent(device: device),
      DiscoveryUnreachableEvent(
        device: _createDevice(fingerprint: '111', alias: 'Impostor'),
        error: 'timed out',
      ),
    ]);

    await ref.redux(nearbyDevicesProvider).dispatchAsync(StartDiscoveryListener());

    expect(ref.read(nearbyDevicesProvider).devices, {'111': device});
  });
}

Device _createDevice({
  required String fingerprint,
  String alias = 'Nice Banana',
  ChannelOutbound outbound = ChannelOutbound.reachable,
}) {
  return Device(
    signalingId: null,
    ip: '192.168.1.2',
    version: '2.1',
    port: 53317,
    https: true,
    fingerprint: fingerprint,
    alias: alias,
    deviceModel: 'Pixel',
    deviceType: DeviceType.mobile,
    download: false,
    channels: [HttpChannel(host: '192.168.1.2', port: 53317, https: true, outbound: outbound)],
  );
}
