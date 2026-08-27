// Regression test for https://github.com/localsend/localsend/issues/3165
//
// "Send to -> LocalSend" starts a second process with the file paths as
// arguments. Only the internal `show` handover keeps that process from becoming
// a duplicate instance that then collides on port 53317.
//
// Two things made the handover fail:
//   * it was addressed with `peerProtocolVersion` ('1.0'), which builds the v1
//     path, while the server only serves `show` on the v2 path, and
//   * it presented no client certificate, while the server demands one whenever
//     the web pages are not served (`mandatory_client_auth` in
//     `packages/core/src/http/server/mod.rs`), so the TLS handshake was
//     rejected before the request was sent.
//
// The stub server below stands in for the running instance: a real one cannot
// be started in-process here, because the Rust TLS stack and the client's
// BoringSSL deadlock inside `flutter_tester`.
@Timeout(Duration(minutes: 1))
library;

import 'dart:convert';
import 'dart:io';

import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart' show ExternalLibrary;
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/model/stored_security_context.dart';
import 'package:localsend_isolates/rust/api/crypto.dart' hide SecurityContext;
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:localsend_isolates/util/show_instance.dart';

const _token = 'show-token-3165';

/// Cargo writes the library under a different name per platform.
File _findDylib() {
  final base = '${Directory.current.path}/../../target/debug';
  return [
    File('$base/librust_lib_localsend_app.dylib'),
    File('$base/librust_lib_localsend_app.so'),
    File('$base/rust_lib_localsend_app.dll'),
  ].firstWhere((f) => f.existsSync(), orElse: () => File('$base/librust_lib_localsend_app.dylib'));
}

/// What the stub server saw of a handover request.
class _Received {
  String? path;
  String? token;
  String? body;
  X509Certificate? clientCertificate;
}

void main() {
  late StoredSecurityContext identity;

  setUpAll(() async {
    final dylib = _findDylib();
    if (!dylib.existsSync()) {
      return;
    }
    await RustLib.init(externalLibrary: ExternalLibrary.open(dylib.path));
    final generated = await generateSecurityContext();
    identity = StoredSecurityContext(
      privateKey: generated.privateKey,
      publicKey: generated.publicKey,
      certificate: generated.certificate,
      certificateHash: generated.certificateHash,
    );
  });

  /// Serves the `show` endpoint like a running instance would, over TLS with
  /// client certificates requested, and answers with [statusCode].
  Future<(HttpServer, _Received)> startStub({int statusCode = 200}) async {
    final context = SecurityContext(withTrustedRoots: false)
      ..useCertificateChainBytes(utf8.encode(identity.certificate))
      ..usePrivateKeyBytes(utf8.encode(identity.privateKey))
      // The client presents this same self-signed identity.
      ..setTrustedCertificatesBytes(utf8.encode(identity.certificate));

    final server = await HttpServer.bindSecure(
      InternetAddress.loopbackIPv4,
      0,
      context,
      requestClientCertificate: true,
    );

    final received = _Received();
    server.listen((request) async {
      received
        ..path = request.uri.path
        ..token = request.uri.queryParameters['token']
        ..body = await utf8.decodeStream(request)
        ..clientCertificate = request.certificate;

      // Mirrors what the real server does: `show` exists on the v2 path only,
      // it is guarded by the token, and it is unreachable without a client
      // certificate (there the handshake itself is refused, which a Dart server
      // cannot express, so an unauthorized answer stands in for it).
      request.response.statusCode = switch (received) {
        _Received(clientCertificate: null) => HttpStatus.unauthorized,
        _Received(path: != '/api/localsend/v2/show') => HttpStatus.notFound,
        _Received(token: != _token) => HttpStatus.forbidden,
        _ => statusCode,
      };
      await request.response.close();
    });

    return (server, received);
  }

  test('hands the arguments to the running instance over TLS', () async {
    if (!_findDylib().existsSync()) {
      markTestSkipped('Rust dylib not built (cargo build -p rust_lib_localsend_app)');
      return;
    }
    final (server, received) = await startStub();
    addTearDown(() => server.close(force: true));

    const args = [r'C:\Users\Test\holiday.png'];
    final handedOver = await notifyRunningInstance(
      securityContext: identity,
      port: server.port,
      https: true,
      showToken: _token,
      args: args,
      connectionTimeout: const Duration(seconds: 10),
      responseTimeout: const Duration(seconds: 10),
    );

    expect(handedOver, isTrue, reason: 'the running instance accepted the handover');

    // Regression: '1.0' used to select the v1 path, which the server does not serve.
    expect(received.path, '/api/localsend/v2/show');
    expect(received.token, _token);
    expect(jsonDecode(received.body!), {'args': args});

    // Regression: without this the server rejects the handshake and the second
    // instance starts anyway, fighting over the port.
    expect(
      received.clientCertificate,
      isNotNull,
      reason: 'the device certificate must be presented, the server requires one',
    );
  });

  test('does not exit when the running instance rejects the request', () async {
    if (!_findDylib().existsSync()) {
      markTestSkipped('Rust dylib not built (cargo build -p rust_lib_localsend_app)');
      return;
    }
    final (server, _) = await startStub();
    addTearDown(() => server.close(force: true));

    final handedOver = await notifyRunningInstance(
      securityContext: identity,
      port: server.port,
      https: true,
      showToken: 'wrong-token',
      args: const [],
      connectionTimeout: const Duration(seconds: 10),
      responseTimeout: const Duration(seconds: 10),
    );

    expect(handedOver, isFalse);
  });

  test('reports no running instance when nothing listens', () async {
    if (!_findDylib().existsSync()) {
      markTestSkipped('Rust dylib not built (cargo build -p rust_lib_localsend_app)');
      return;
    }
    // Bind and immediately release a port so that nothing answers on it.
    final probe = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
    final closedPort = probe.port;
    await probe.close();

    final handedOver = await notifyRunningInstance(
      securityContext: identity,
      port: closedPort,
      https: true,
      showToken: _token,
      args: const [],
    );

    expect(handedOver, isFalse);
  });
}
