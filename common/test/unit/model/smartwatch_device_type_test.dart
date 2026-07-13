import 'package:common/model/device.dart';
import 'package:common/model/dto/info_register_dto.dart';
import 'package:common/model/dto/multicast_dto.dart';
import 'package:common/model/dto/register_dto.dart';
import 'package:test/test.dart';

void main() {
  group('smartwatch DeviceType protocol', () {
    test('serializes to wire value smartwatch', () {
      expect(DeviceType.smartwatch.toValue(), 'smartwatch');
    });

    test('deserializes from wire value smartwatch', () {
      expect(DeviceTypeMapper.fromValue('smartwatch'), DeviceType.smartwatch);
    });

    test('is included in DeviceType.values for settings and persistence', () {
      expect(DeviceType.values, contains(DeviceType.smartwatch));
      expect(DeviceType.smartwatch.name, 'smartwatch');
      expect(DeviceType.smartwatch.index, 5);
    });
  });

  group('MulticastDto smartwatch', () {
    test('parses smartwatch from JSON', () {
      final parsed = MulticastDto.fromJson({
        'alias': 'Galaxy Watch',
        'version': '2.0',
        'deviceModel': 'Samsung',
        'deviceType': 'smartwatch',
        'fingerprint': 'fp-1',
        'port': 53317,
        'protocol': 'https',
        'download': false,
        'announce': true,
      });

      expect(parsed.deviceType, DeviceType.smartwatch);
    });

    test('serializes smartwatch to JSON', () {
      const dto = MulticastDto(
        alias: 'Galaxy Watch',
        version: '2.0',
        deviceModel: 'Samsung',
        deviceType: DeviceType.smartwatch,
        fingerprint: 'fp-1',
        port: 53317,
        protocol: ProtocolType.https,
        download: false,
        announcement: null,
        announce: true,
      );

      expect(dto.toJson()['deviceType'], 'smartwatch');
    });

    test('converts to Device with smartwatch type', () {
      const dto = MulticastDto(
        alias: 'Galaxy Watch',
        version: '2.0',
        deviceModel: 'Samsung',
        deviceType: DeviceType.smartwatch,
        fingerprint: 'fp-1',
        port: 53317,
        protocol: ProtocolType.https,
        download: false,
        announcement: null,
        announce: true,
      );

      final device = dto.toDevice('192.168.1.10', 53317, true);
      expect(device.deviceType, DeviceType.smartwatch);
      expect(device.alias, 'Galaxy Watch');
    });
  });

  group('RegisterDto smartwatch', () {
    test('round-trips smartwatch through JSON', () {
      const dto = RegisterDto(
        alias: 'Pixel Watch',
        version: '2.0',
        deviceModel: 'Google',
        deviceType: DeviceType.smartwatch,
        fingerprint: 'fp-2',
        port: 53317,
        protocol: ProtocolType.https,
        download: false,
      );

      final json = dto.toJson();
      expect(json['deviceType'], 'smartwatch');

      final parsed = RegisterDto.fromJson(json);
      expect(parsed.deviceType, DeviceType.smartwatch);
    });

    test('converts to Device with smartwatch type', () {
      const dto = RegisterDto(
        alias: 'Pixel Watch',
        version: '2.0',
        deviceModel: 'Google',
        deviceType: DeviceType.smartwatch,
        fingerprint: 'fp-2',
        port: 53317,
        protocol: ProtocolType.https,
        download: false,
      );

      final device = dto.toDevice('10.0.0.5', 53317, true, const HttpDiscovery(ip: '10.0.0.5'));
      expect(device.deviceType, DeviceType.smartwatch);
    });
  });

  group('InfoRegisterDto smartwatch', () {
    test('parses smartwatch from JSON', () {
      final parsed = InfoRegisterDto.fromJson({
        'alias': 'Apple Watch',
        'version': '2.0',
        'deviceModel': 'Apple',
        'deviceType': 'smartwatch',
        'fingerprint': 'fp-3',
        'port': 53317,
        'protocol': 'https',
        'download': false,
      });

      expect(parsed.deviceType, DeviceType.smartwatch);
    });
  });
}
