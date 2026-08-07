// Regression test: the receiver cancels the session mid-transfer (the sender
// aborts its in-flight uploads), then the sender starts a new session.
//
// The aborted uploads used to fail `respond_file_upload` with a returned
// `Err`, which flutter_rust_bridge discards as an uncaught async error. That
// killed the server isolate, leaving the Rust server without a Dart listener,
// so every following prepare-upload request was answered with 500.
//
// Loads the real Rust dylib and replicates the event loop of
// `server_isolate.dart` without isolates. Skipped when the dylib is missing;
// build it with `cargo build -p rust_lib_localsend_app` from the repo root.
@Timeout(Duration(minutes: 2))
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart' show ExternalLibrary;
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/rust/api/server.dart';
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:localsend_isolates/util/future_queue.dart';

const _port = 40901;

class _ReceiveSession {
  final String sessionId;
  final Set<String> acceptedIds;
  final Map<String, FutureQueue> uploads = {};

  _ReceiveSession(this.sessionId, this.acceptedIds);
}

void main() {
  test('new session works after receiver-side cancel during transfer', () async {
    final dylib = File('${Directory.current.path}/../../target/debug/librust_lib_localsend_app.dylib');
    if (!dylib.existsSync()) {
      markTestSkipped('Rust dylib not built (cargo build -p rust_lib_localsend_app)');
      return;
    }
    await RustLib.init(externalLibrary: ExternalLibrary.open(dylib.path));

    final tempDir = await Directory.systemTemp.createTemp('cancel_repro');

    final server = await startServer(
      port: _port,
      tls: null,
      alias: 'Receiver',
      version: '2.2',
      deviceModel: 'Test',
      deviceType: null,
      fingerprint: 'RECEIVER-FINGERPRINT',
      pin: null,
      verifyChecksums: true,
      web: null,
      showToken: null,
    );

    _ReceiveSession? session;
    final uploadErrors = <Object>[];
    var receiverCancelled = false;

    // Set when the receiver cancels; the "sender" reacts by aborting everything.
    final senderAbort = Completer<void>();
    void triggerReceiverCancel(String sessionId) {
      if (receiverCancelled) return;
      receiverCancelled = true;
      session = null;
      unawaited(server.cancelSession(sessionId: sessionId));
      senderAbort.complete();
    }

    // Mirrors the event loop in server_isolate.dart.
    final eventLoop = () async {
      await for (final event in server.listen()) {
        switch (event) {
          case RsServerEvent_PrepareUpload(:final sessionId, :final files):
            session = null;
            // The app answers via a separate task; a microtask gap is enough here.
            unawaited(
              Future(() async {
                session = _ReceiveSession(sessionId, files.keys.toSet());
                await server.respondPrepareUpload(acceptedFileIds: files.keys.toList());
              }),
            );
          case RsServerEvent_FileUpload(:final sessionId, :final fileId, :final file):
            final s = session;
            if (s == null || s.sessionId != sessionId || !s.acceptedIds.contains(fileId)) {
              // Same as server_isolate.dart: reject by cancelling.
              unawaited(server.cancelSession(sessionId: sessionId));
              break;
            }
            final queue = s.uploads.putIfAbsent(fileId, () => FutureQueue());
            queue.add(() async {
              try {
                final progressStream = server.respondFileUpload(
                  sessionId: sessionId,
                  fileId: fileId,
                  path: '${tempDir.path}/$fileId',
                  fileDescriptor: null,
                  fileSize: file.size,
                );
                await for (final progress in progressStream) {
                  if (progress > 0.2) {
                    // Receiver-side cancel mid-transfer (HttpServerCancelSessionTask).
                    triggerReceiverCancel(sessionId);
                  }
                }
              } catch (e) {
                // Mirrors _handleFileUpload: the failure surfaces on the
                // progress stream and the file is marked as failed.
                uploadErrors.add(e);
              }
            });
          default:
            break;
        }
      }
    }();

    // --- Sender side (plain HTTP) ---
    final client = HttpClient();

    Future<(int, String)> prepareUpload(List<String> fileIds, {required int size}) async {
      final req = await client.postUrl(Uri.parse('http://127.0.0.1:$_port/api/localsend/v2/prepare-upload'));
      req.headers.contentType = ContentType.json;
      req.write(
        jsonEncode({
          'info': {
            'alias': 'Sender',
            'version': '2.2',
            'fingerprint': 'SENDER-FINGERPRINT',
            'port': 1,
            'protocol': 'http',
            'download': false,
          },
          'files': {
            for (final id in fileIds)
              id: {
                'id': id,
                'fileName': '$id.bin',
                'size': size,
                'fileType': 'application/octet-stream',
              },
          },
        }),
      );
      final res = await req.close();
      final body = await utf8.decodeStream(res);
      return (res.statusCode, body);
    }

    // Uploads with pauses between chunks; aborts the request when
    // [senderAbort] completes (like the sender's cancellation token).
    Future<int> upload(String sessionId, String fileId, String token, int size, {bool abortable = false}) async {
      final req = await client.postUrl(
        Uri.parse('http://127.0.0.1:$_port/api/localsend/v2/upload?sessionId=$sessionId&fileId=$fileId&token=$token'),
      );
      req.headers.contentLength = size;
      var aborted = false;
      if (abortable) {
        unawaited(
          senderAbort.future.then((_) {
            aborted = true;
            req.abort();
          }),
        );
      }
      try {
        const chunk = 64 * 1024;
        var sent = 0;
        while (sent < size && !aborted) {
          final n = (size - sent).clamp(0, chunk);
          req.add(List.filled(n, 7));
          await req.flush();
          sent += n;
          if (abortable) {
            await Future<void>.delayed(const Duration(milliseconds: 20));
          }
        }
        final res = await req.close();
        await res.drain<void>();
        return res.statusCode;
      } catch (_) {
        // Aborted by the "cancellation token".
        return -1;
      }
    }

    // Session A: several files, 2 uploaded in parallel like the upload isolate,
    // cancelled by the receiver mid-transfer; the sender then aborts everything.
    const size = 4 * 1024 * 1024;
    final fileIds = List.generate(4, (i) => 'file-a$i');
    final (statusA, bodyA) = await prepareUpload(fileIds, size: size);
    expect(statusA, 200);
    final resA = jsonDecode(bodyA) as Map<String, dynamic>;
    final sessionA = resA['sessionId'] as String;
    final tokensA = (resA['files'] as Map<String, dynamic>).cast<String, String>();

    final pending = [...fileIds];
    Future<void> worker() async {
      while (pending.isNotEmpty && !senderAbort.isCompleted) {
        final id = pending.removeAt(0);
        await upload(sessionA, id, tokensA[id]!, size, abortable: true);
      }
    }

    await Future.wait([worker(), worker()]);
    expect(receiverCancelled, true, reason: 'the transfer should have been cancelled mid-flight');

    // Give in-flight events time to settle.
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // The aborted uploads must fail via the progress stream
    // (not as uncaught async errors, which would kill the server isolate).
    expect(uploadErrors, isNotEmpty);

    // Session B: this returned 500 before the fix.
    final (statusB, bodyB) = await prepareUpload(['file-b'], size: 1024).timeout(
      const Duration(seconds: 10),
      onTimeout: () => (-1, 'timed out'),
    );
    expect(statusB, 200, reason: 'prepare-upload after cancel responded: $bodyB');

    final resB = jsonDecode(bodyB) as Map<String, dynamic>;
    final sessionB = resB['sessionId'] as String;
    final tokenB = (resB['files'] as Map<String, dynamic>)['file-b'] as String;
    final uploadStatusB = await upload(sessionB, 'file-b', tokenB, 1024);
    expect(uploadStatusB, 200);

    client.close(force: true);
    await server.stop();
    // The event stream does not close on stop (the server handle keeps the
    // event channel alive), matching the app which never awaits it either.
    unawaited(eventLoop);
    await tempDir.delete(recursive: true);
  });
}
