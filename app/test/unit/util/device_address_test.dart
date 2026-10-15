import 'package:localsend_app/util/device_address.dart';
import 'package:test/test.dart';

void main() {
  test('uses the default port when omitted', () {
    expect(parseDeviceAddress(' 192.168.1.20 ', defaultPort: 60000), (host: '192.168.1.20', port: 60000));
    expect(parseDeviceAddress('device.local', defaultPort: 60000), (host: 'device.local', port: 60000));
  });

  test('splits an explicit port', () {
    expect(parseDeviceAddress('192.168.1.20:53318', defaultPort: 60000), (host: '192.168.1.20', port: 53318));
    expect(parseDeviceAddress('device.local:53318', defaultPort: 60000), (host: 'device.local', port: 53318));
    expect(parseDeviceAddress('device.local:0', defaultPort: 60000), (host: 'device.local', port: 0));
    expect(parseDeviceAddress('device.local:65535', defaultPort: 60000), (host: 'device.local', port: 65535));
  });

  test('handles IPv6 brackets and preserves bare addresses and scopes', () {
    expect(parseDeviceAddress('2001:db8::1:8080', defaultPort: 60000), (host: '2001:db8::1:8080', port: 60000));
    expect(parseDeviceAddress('[2001:db8::1]', defaultPort: 60000), (host: '2001:db8::1', port: 60000));
    expect(parseDeviceAddress('[2001:db8::1]:53318', defaultPort: 60000), (host: '2001:db8::1', port: 53318));
    expect(parseDeviceAddress('fe80::1%3', defaultPort: 60000), (host: 'fe80::1%3', port: 60000));
    expect(parseDeviceAddress('[fe80::1%253]:53318', defaultPort: 60000), (host: 'fe80::1%253', port: 53318));
  });

  test('leaves invalid input for the request layer to handle', () {
    expect(parseDeviceAddress('', defaultPort: 60000), (host: '', port: 60000));
    expect(parseDeviceAddress('192.168.1.999', defaultPort: 60000), (host: '192.168.1.999', port: 60000));
    expect(parseDeviceAddress('device.local:abc', defaultPort: 60000), (host: 'device.local:abc', port: 60000));
    expect(parseDeviceAddress('device.local:65536', defaultPort: 60000), (host: 'device.local:65536', port: 60000));
    expect(parseDeviceAddress('device.local:53318/path', defaultPort: 60000), (host: 'device.local:53318/path', port: 60000));
  });
}
