// Loads the real Rust library, as cancel_session_repro_test.dart does.
// Build it with `cargo build -p rust_lib_localsend_app` from the repo root.
@Timeout(Duration(minutes: 2))
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart' show ExternalLibrary;
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/rust/api/server.dart';
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:localsend_isolates/src/task/server/file_saver.dart';
import 'package:localsend_isolates/util/future_queue.dart';

void main() {
  final libraryName = Platform.isMacOS
      ? 'librust_lib_localsend_app.dylib'
      : Platform.isWindows
      ? 'rust_lib_localsend_app.dll'
      : 'librust_lib_localsend_app.so';
  final dylib = File('${Directory.current.path}/../../target/debug/$libraryName');
  final nativeAvailable = dylib.existsSync();
  final skip = nativeAvailable ? false : 'Rust dylib not built (cargo build -p rust_lib_localsend_app)';

  setUpAll(() async {
    if (nativeAvailable) {
      await RustLib.init(externalLibrary: ExternalLibrary.open(dylib.path));
    }
  });

  test('same-name targets prepared before writing have distinct paths', () async {
    final directory = await Directory.systemTemp.createTemp('name_collision_targets');
    addTearDown(() => directory.delete(recursive: true));
    final createdDirectories = <String>{};
    final reservedPaths = <String>{};
    final targets = await Future.wait([
      for (var i = 0; i < 2; i++)
        prepareFileSaveTarget(
          destinationDirectory: directory.path,
          cacheDirectory: directory.path,
          fileName: 'Frame.bin',
          saveToGallery: false,
          createdDirectories: createdDirectories,
          reservedPaths: reservedPaths,
        ),
    ]);

    // Neither caller has started its Rust writer yet.
    expect(await directory.list().length, 0);
    expect(targets[0].path, isNot(targets[1].path), reason: 'Two distinct incoming files must not share a save target');
  }, skip: skip);

  test('two same-name uploads preserve both contents after HTTP success', () async {
    final directory = await Directory.systemTemp.createTemp('name_collision_http');
    addTearDown(() => directory.delete(recursive: true));
    final socket = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
    final port = socket.port;
    await socket.close();
    final server = await startServer(
      port: port,
      tls: null,
      alias: 'Receiver',
      version: '2.2',
      deviceModel: 'Test',
      deviceType: null,
      fingerprint: 'RECEIVER-FINGERPRINT',
      pin: null,
      verifyChecksums: true,
      web: const WebParams(
        mode: WebMode.disabled(),
        i18N: WebI18n(
          waiting: '',
          enterPin: '',
          invalidPin: '',
          tooManyAttempts: '',
          rejected: '',
          uploadRejected: '',
          busy: '',
          files: '',
          fileName: '',
          size: '',
          dropHint: '',
        ),
        pages: WebPages(),
      ),
      showToken: null,
    );
    final client = HttpClient();

    const size = 1024;
    const names = {'first': 'Frame.bin', 'second': 'Frame.bin'};
    const hashes = {
      'first': '6ab72eeb9e77b07540897e0c8d6d23ec8eef0f8c3a47e1b3f4e93443d9536bed',
      'second': '9b6ce55f379e9771551de6939556a7e6b949814ae27c2f5cfd5dbeb378ce7c2a',
    };
    final payloads = {'first': List<int>.filled(size, 65), 'second': List<int>.filled(size, 66)};
    final targets = <String, FileSaveTarget>{};
    final queues = <String, FutureQueue>{};
    final createdDirectories = <String>{};
    final reservedPaths = <String>{};
    final bothPrepared = Completer<void>();
    final bothFinished = Completer<void>();
    final uploadErrors = <Object>[];
    String? acceptedSessionId;
    var finished = 0;

    // Mirrors the production per-file-ID queues and target map. The barrier
    // controls scheduling only: it delays the FRB responses until both real
    // target allocations finish, before either Rust writer creates its file.
    final subscription = server.listen().listen((event) {
      switch (event) {
        case RsServerEvent_PrepareUpload(:final sessionId, :final files):
          acceptedSessionId = sessionId;
          unawaited(server.respondPrepareUpload(acceptedFileIds: files.keys.toList()));
        case RsServerEvent_FileUpload(:final sessionId, :final fileId, :final file):
          final queue = queues.putIfAbsent(fileId, () => FutureQueue());
          queue.add(() async {
            try {
              expect(sessionId, acceptedSessionId);
              final previous = targets[fileId];
              final target = previous != null
                  ? await reopenFileSaveTarget(previous)
                  : await prepareFileSaveTarget(
                      destinationDirectory: directory.path,
                      cacheDirectory: directory.path,
                      fileName: names[fileId]!,
                      saveToGallery: false,
                      createdDirectories: createdDirectories,
                      reservedPaths: reservedPaths,
                    );
              targets[fileId] = target;
              if (targets.length == names.length) {
                bothPrepared.complete();
              }
              await bothPrepared.future;
              await server
                  .respondFileUpload(
                    sessionId: sessionId,
                    fileId: fileId,
                    path: target.path,
                    fileDescriptor: target.fileDescriptor,
                    fileSize: file.size,
                  )
                  .drain<void>();
            } catch (error) {
              uploadErrors.add(error);
              await server.failFileUpload(sessionId: sessionId, fileId: fileId);
            } finally {
              if (++finished == names.length) {
                bothFinished.complete();
              }
            }
          });
        default:
          break;
      }
    });
    addTearDown(() async {
      client.close(force: true);
      await server.stop();
      // The native event channel stays alive with its opaque server handle.
      unawaited(subscription.cancel());
    });

    final prepare = await client.postUrl(Uri.parse('http://127.0.0.1:$port/api/localsend/v2/prepare-upload'));
    prepare.headers.contentType = ContentType.json;
    prepare.write(
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
          for (final entry in names.entries)
            entry.key: {
              'id': entry.key,
              'fileName': entry.value,
              'size': size,
              'fileType': 'application/octet-stream',
              'sha256': hashes[entry.key],
            },
        },
      }),
    );
    final prepareResponse = await prepare.close();
    final prepareBody = await utf8.decodeStream(prepareResponse);
    expect(prepareResponse.statusCode, 200, reason: prepareBody);
    final accepted = jsonDecode(prepareBody) as Map<String, dynamic>;
    final sessionId = accepted['sessionId'] as String;
    final tokens = (accepted['files'] as Map<String, dynamic>).cast<String, String>();

    Future<int> upload(String fileId) async {
      final request = await client.postUrl(
        Uri.parse(
          'http://127.0.0.1:$port/api/localsend/v2/upload?sessionId=$sessionId&fileId=$fileId&token=${tokens[fileId]}',
        ),
      );
      request.headers.contentLength = size;
      request.add(payloads[fileId]!);
      final response = await request.close();
      await response.drain<void>();
      return response.statusCode;
    }

    final statuses = await Future.wait(names.keys.map(upload)).timeout(const Duration(seconds: 15));
    await bothFinished.future.timeout(const Duration(seconds: 5));
    final files = await directory.list().where((entry) => entry is File).cast<File>().toList();
    final contents = await Future.wait(files.map((file) => file.readAsBytes()));
    expect(statuses, everyElement(200));
    expect(uploadErrors, isEmpty);
    expect(files, hasLength(2), reason: 'Both successful uploads must remain on disk');
    for (final payload in payloads.values) {
      expect(contents, contains(orderedEquals(payload)), reason: 'Each incoming payload must remain intact');
    }
  }, skip: skip);
}
