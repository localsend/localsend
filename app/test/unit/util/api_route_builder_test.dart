import 'package:common/api_route_builder.dart';
import 'package:common/model/device.dart';
import 'package:test/test.dart';

void main() {
  group('ApiRoute server urls', () {
    test('register', () {
      expect(ApiRoute.register.v1, '/api/localsend/v1/register');
      expect(ApiRoute.register.v2, '/api/localsend/v2/register');
    });

    test('prepareUpload', () {
      expect(ApiRoute.prepareUpload.v1, '/api/localsend/v1/send-request');
      expect(ApiRoute.prepareUpload.v2, '/api/localsend/v2/prepare-upload');
    });
  });

  group('ApiRoute typed client urls', () {
    test('register', () {
      expect(ApiRoute.register.target(_target(version: '1.0', https: false)), 'http://0.0.0.0:8080/api/localsend/v1/register');
      expect(ApiRoute.register.target(_target(version: '1.0', https: true)), 'https://0.0.0.0:8080/api/localsend/v1/register');
      expect(ApiRoute.register.target(_target(version: '2.0', https: false)), 'http://0.0.0.0:8080/api/localsend/v2/register');
      expect(ApiRoute.register.target(_target(version: '2.0', https: true)), 'https://0.0.0.0:8080/api/localsend/v2/register');
    });

    test('prepareUpload', () {
      expect(ApiRoute.prepareUpload.target(_target(version: '1.0', https: false)), 'http://0.0.0.0:8080/api/localsend/v1/send-request');
      expect(ApiRoute.prepareUpload.target(_target(version: '1.0', https: true)), 'https://0.0.0.0:8080/api/localsend/v1/send-request');
      expect(ApiRoute.prepareUpload.target(_target(version: '2.0', https: false)), 'http://0.0.0.0:8080/api/localsend/v2/prepare-upload');
      expect(ApiRoute.prepareUpload.target(_target(version: '2.0', https: true)), 'https://0.0.0.0:8080/api/localsend/v2/prepare-upload');
    });
  });

  group('ApiRoute raw client urls', () {
    test('register', () {
      expect(ApiRoute.register.targetRaw('0.0.0.0', 8080, false, '1.0'), 'http://0.0.0.0:8080/api/localsend/v1/register');
      expect(ApiRoute.register.targetRaw('0.0.0.0', 8080, true, '1.0'), 'https://0.0.0.0:8080/api/localsend/v1/register');
      expect(ApiRoute.register.targetRaw('0.0.0.0', 8080, false, '2.0'), 'http://0.0.0.0:8080/api/localsend/v2/register');
      expect(ApiRoute.register.targetRaw('0.0.0.0', 8080, true, '2.0'), 'https://0.0.0.0:8080/api/localsend/v2/register');
    });
  });
}

Device _target({
  required String version,
  required bool https,
}) {
  return Device(
    signalingId: null,
    ip: '0.0.0.0',
    version: version,
    port: 8080,
    https: https,
    fingerprint: 'fingerprint',
    alias: 'alias',
    deviceModel: 'deviceModel',
    deviceType: DeviceType.desktop,
    download: false,
    discoveryMethods: {},
  );
}
