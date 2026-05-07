import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/model/webrtc/ice_server_config.dart';

void main() {
  group('buildIceServers', () {
    test('keeps stun servers without credentials', () {
      final result = buildIceServers(
        urls: ['stun:stun.example.com:3478'],
        turnUsername: 'user',
        turnCredential: 'secret',
      );

      expect(result, [
        const IceServerConfig(
          urls: ['stun:stun.example.com:3478'],
          username: null,
          credential: null,
        ),
      ]);
    });

    test('adds credentials to turn servers', () {
      final result = buildIceServers(
        urls: ['turn:turn.example.com:3478?transport=udp'],
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

    test('adds credentials to turns servers', () {
      final result = buildIceServers(
        urls: ['turns:turn.example.com:5349?transport=tcp'],
        turnUsername: 'user',
        turnCredential: 'secret',
      );

      expect(result, [
        const IceServerConfig(
          urls: ['turns:turn.example.com:5349?transport=tcp'],
          username: 'user',
          credential: 'secret',
        ),
      ]);
    });

    test('omits credentials when username or credential is empty', () {
      final result = buildIceServers(
        urls: ['turn:turn.example.com:3478?transport=udp'],
        turnUsername: 'user',
        turnCredential: '',
      );

      expect(result.single.username, isNull);
      expect(result.single.credential, isNull);
    });

    test('drops empty urls', () {
      final result = buildIceServers(
        urls: ['', '  ', 'stun:stun.example.com:3478'],
        turnUsername: null,
        turnCredential: null,
      );

      expect(result.length, 1);
      expect(result.single.urls, ['stun:stun.example.com:3478']);
    });
  });
}
