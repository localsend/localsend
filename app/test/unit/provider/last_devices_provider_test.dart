import 'package:localsend_app/provider/last_devices.provider.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';

void main() {
  test('Should add a device', () {
    final service = ReduxNotifier.test(
      redux: LastDevicesService(),
    );

    expect(service.state, []);

    final device = _createDevice('123.123');
    service.dispatch(AddLastDeviceAction(device));

    expect(service.state, [device]);
  });

  test('Should remove the 5th device', () {
    final service = ReduxNotifier.test(
      redux: LastDevicesService(),
    );

    service.dispatch(AddLastDeviceAction(_createDevice('1')));
    service.dispatch(AddLastDeviceAction(_createDevice('2')));
    service.dispatch(AddLastDeviceAction(_createDevice('3')));
    service.dispatch(AddLastDeviceAction(_createDevice('4')));
    service.dispatch(AddLastDeviceAction(_createDevice('5')));

    expect(service.state.length, 5);
    expect(service.state, [
      _createDevice('5'),
      _createDevice('4'),
      _createDevice('3'),
      _createDevice('2'),
      _createDevice('1'),
    ]);

    service.dispatch(AddLastDeviceAction(_createDevice('6')));

    expect(service.state.length, 5);
    expect(service.state, [
      _createDevice('6'),
      _createDevice('5'),
      _createDevice('4'),
      _createDevice('3'),
      _createDevice('2'), // 5th device removed
    ]);
  });

  test('Should replace a renamed endpoint before limiting recent devices', () {
    final devices = [
      _createDevice('192.168.1.6'),
      _createDevice('192.168.1.5'),
      _createDevice('192.168.1.4'),
      _createDevice('192.168.1.3'),
      _createDevice('192.168.1.2'),
    ];
    final service = ReduxNotifier.test(
      redux: LastDevicesService(),
      initialState: devices,
    );
    final renamedDevice = devices[2].copyWith(alias: 'Work laptop');

    service.dispatch(AddLastDeviceAction(renamedDevice));

    expect(service.state, [
      renamedDevice,
      devices[0],
      devices[1],
      devices[3],
      devices[4],
    ]);
  });

  test('Should keep different ports at the same IP', () {
    final device = _createDevice('192.168.1.2');
    final otherPort = device.copyWith(port: 456);
    final service = ReduxNotifier.test(
      redux: LastDevicesService(),
      initialState: [device],
    );

    service.dispatch(AddLastDeviceAction(otherPort));

    expect(service.state, [otherPort, device]);
  });
}

Device _createDevice(String ip) {
  return Device(
    signalingId: null,
    ip: ip,
    version: '1',
    port: 123,
    https: true,
    fingerprint: '123',
    alias: 'A',
    deviceModel: 'A',
    deviceType: DeviceType.mobile,
    download: false,
    channels: [],
  );
}
