// Opt-in test against the real Rust library and generated FRB codecs.
// Build with `cargo build -p rust_lib_localsend_app` at the repository root.
// Set LOCALSEND_NATIVE_TESTS=1 and FRB_DART_LOAD_EXTERNAL_LIBRARY_NATIVE_LIB_DIR
// to the absolute target/debug directory before running this file.
// CI builds the library and enables these tests in a separate step.
import 'dart:async';
import 'dart:io';

import 'package:localsend_app/util/prepare_upload_fallback.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/rust/api/cancel.dart' as rust_cancel;
import 'package:localsend_isolates/rust/api/crypto.dart' as rust_crypto;
import 'package:localsend_isolates/rust/api/http.dart' as rust_http;
import 'package:localsend_isolates/rust/api/model.dart' as rust_model;
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:test/test.dart';

void main() {
  group(
    'real native prepare-upload fallback',
    () {
      late rust_crypto.SecurityContext identity;
      late rust_http.RsHttpClient client;
      late rust_model.PrepareUploadRequestDto payload;

      setUpAll(() async {
        await RustLib.init();
        identity = await rust_crypto.generateSecurityContext();
        client = rust_http.createClient(
          privateKey: identity.privateKey,
          cert: identity.certificate,
          version: rust_http.LsHttpClientVersion.v2,
          expectedFingerprint: identity.certificateHash,
        );
        payload = rust_model.PrepareUploadRequestDto(
          info: rust_model.RegisterDto(
            alias: 'native-fallback-test',
            version: '2.2',
            token: identity.certificateHash,
            port: 53317,
            protocol: rust_model.ProtocolType.http,
            hasWebInterface: false,
          ),
          files: {},
        );
      });

      tearDownAll(RustLib.dispose);

      Future<rust_http.PrepareUploadResult> prepare(HttpChannel channel) => client.prepareUpload(
        protocol: rust_model.ProtocolType.http,
        ip: channel.host,
        port: channel.port,
        payload: payload,
        cancelToken: rust_cancel.createCancellationToken(),
      );

      Future<HttpServer> peer(int status, void Function() onRequest) async {
        final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
        addTearDown(() => server.close(force: true));
        server.listen((request) async {
          onRequest();
          await request.drain<void>();
          request.response.statusCode = status;
          await request.response.close();
        });
        return server;
      }

      test('real connection failure crosses FRB as Unreachable and selects the next endpoint', () async {
        final closedPort = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
        addTearDown(closedPort.close);
        var received = 0;
        final receiver = await peer(HttpStatus.noContent, () => received++);
        final unreachable = HttpChannel(host: '127.0.0.1', port: closedPort.port, https: false);
        final reachable = HttpChannel(host: '127.0.0.1', port: receiver.port, https: false);
        await closedPort.close();
        final attempts = <HttpChannel>[];
        final failures = <Object>[];
        final result = await prepareUploadWithFallback(
          channels: [unreachable, reachable],
          startIndex: 0,
          isActive: () => true,
          onAttempt: (_) {},
          attempt: (channel) async {
            attempts.add(channel);
            try {
              return await prepare(channel);
            } catch (error) {
              failures.add(error);
              rethrow;
            }
          },
        );
        expect(failures, [isA<rust_http.RsHttpClientError_Unreachable>()]);
        expect(attempts, [unreachable, reachable]);
        expect(result.channel, reachable);
        expect(result.response.statusCode, HttpStatus.noContent);
        expect(received, 1);
      });

      test('a real rejection does not dispatch prepare-upload to another endpoint', () async {
        var rejectedRequests = 0;
        var alternateRequests = 0;
        final rejected = await peer(HttpStatus.forbidden, () => rejectedRequests++);
        final alternate = await peer(HttpStatus.noContent, () => alternateRequests++);
        await expectLater(
          prepareUploadWithFallback(
            channels: [
              HttpChannel(host: '127.0.0.1', port: rejected.port, https: false),
              HttpChannel(host: '127.0.0.1', port: alternate.port, https: false),
            ],
            startIndex: 0,
            isActive: () => true,
            onAttempt: (_) {},
            attempt: prepare,
          ),
          throwsA(isA<rust_http.RsHttpClientError_StatusCode>().having((error) => error.status, 'status', HttpStatus.forbidden)),
        );
        expect(rejectedRequests, 1);
        expect(alternateRequests, 0);
      });

      test('native cancel total timeout bounds a peer that connects but never replies', () async {
        final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
        final received = Completer<void>();
        final sockets = <Socket>[];
        addTearDown(() async {
          for (final socket in sockets) {
            socket.destroy();
          }
          await server.close();
        });
        server.listen((socket) {
          sockets.add(socket);
          socket.listen((_) {
            if (!received.isCompleted) received.complete();
          });
        });
        final bounded = rust_http.createClient(
          privateKey: identity.privateKey,
          cert: identity.certificate,
          version: rust_http.LsHttpClientVersion.v2,
          expectedFingerprint: identity.certificateHash,
          timeoutMs: 300,
        );
        final cancellation = bounded.cancel(
          protocol: rust_model.ProtocolType.http,
          ip: '127.0.0.1',
          port: server.port,
          sessionId: 'test-session',
        );
        final checked = expectLater(cancellation.timeout(const Duration(seconds: 5)), throwsA(isA<rust_http.RsHttpClientError_Reqwest>()));
        await received.future.timeout(const Duration(seconds: 5));
        await checked;
      });
    },
    skip: Platform.environment['LOCALSEND_NATIVE_TESTS'] != '1'
        ? 'Requires the compiled Rust library; see the instructions at the top of this file.'
        : false,
  );
}
