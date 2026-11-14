// Runs against the real Rust receiver and the platform save-target channel.
// This test-only entry point is never imported by lib/main.dart.
@Timeout(Duration(minutes: 8))
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android;
import 'package:localsend_app/util/native/pick_directory_path.dart';
import 'package:localsend_isolates/rust/api/cancel.dart';
import 'package:localsend_isolates/rust/api/server.dart';
import 'package:localsend_isolates/src/task/server/file_saver.dart';
import 'package:localsend_isolates/util/file_hash.dart';
import 'package:localsend_isolates/util/rust_init.dart';
import 'package:path_provider/path_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('native nested transfers, failed destination, checksum retry and interrupted upload', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('Native transfer verification'))),
      ),
    );
    await initRustLib();
    final documents = await getApplicationDocumentsDirectory();
    final destination = await Directory('${documents.path}/transfer-check-${DateTime.now().microsecondsSinceEpoch}').create();
    final receiver = await _Receiver.start(destination);
    addTearDown(() async {
      await receiver.close();
      await destination.delete(recursive: true);
    });

    final content = <String, List<int>>{
      'Trip/day 1/photo.jpg': [1, 2, 3, 4],
      'Trip/day 2/photo.jpg': [4, 3, 2, 1],
      'Trip/भारत/报告.txt': utf8.encode('LocalSend folder verification — नमस्ते'),
      'Trip/empty.txt': [],
      'Trip/large.bin': List<int>.generate(2 * 1024 * 1024, (i) => i % 251),
      'blocked/nested.txt': utf8.encode('Retry only this failed file'),
    };
    final blocker = await File('${destination.path}/blocked').writeAsString('pre-existing blocker');
    final first = await receiver.prepare(content);
    for (final entry in content.entries) {
      final status = await receiver.upload(first, entry.key, entry.value);
      expect(status, entry.key.startsWith('blocked/') ? 500 : 200, reason: entry.key);
      final outcome = await receiver.outcome(first, entry.key);
      expect(outcome, entry.key.startsWith('blocked/') ? isNotNull : isNull, reason: entry.key);
    }
    expect(await blocker.readAsString(), 'pre-existing blocker');
    expect(await receiver.upload(first, 'blocked/nested.txt', content['blocked/nested.txt']!), 403);
    await blocker.delete();
    final retry = await receiver.prepare({'blocked/nested.txt': content['blocked/nested.txt']!});
    expect(await receiver.upload(retry, 'blocked/nested.txt', content['blocked/nested.txt']!), 200);
    expect(await receiver.outcome(retry, 'blocked/nested.txt'), isNull);
    for (final entry in content.entries) {
      final bytes = await File('${destination.path}/${entry.key}').readAsBytes();
      expect(sha256.convert(bytes), sha256.convert(entry.value), reason: entry.key);
    }
    final savedFiles = await destination.list(recursive: true).where((entity) => entity is File).toList();
    expect(savedFiles, hasLength(content.length), reason: 'Successful files must not be resent or numbered');

    // A rejected checksum must release its native write lease before reopening
    // the same path with the same protocol token.
    final checksumBytes = utf8.encode('verified checksum');
    final checksum = await receiver.prepare({'checksum.txt': checksumBytes});
    expect(await receiver.upload(checksum, 'checksum.txt', List.filled(checksumBytes.length, 0)), 422);
    expect(await receiver.outcome(checksum, 'checksum.txt'), isNotNull);
    receiver.resetOutcome(checksum, 'checksum.txt');
    expect(await receiver.upload(checksum, 'checksum.txt', checksumBytes), 200);
    expect(await receiver.outcome(checksum, 'checksum.txt'), isNull);
    expect(await File('${destination.path}/checksum.txt').readAsBytes(), checksumBytes);
    expect(await File('${destination.path}/checksum (2).txt').exists(), isFalse);

    // Repeat abort/recovery to expose coordination leases retained after a
    // request disappears while the native writer is active.
    for (var i = 0; i < 3; i++) {
      final name = 'interrupted-$i.bin';
      final bytes = List<int>.filled(4 * 1024 * 1024, 7);
      final interrupted = await receiver.prepare({name: bytes});
      await receiver.abort(interrupted, name, bytes.length);
      expect(await receiver.outcome(interrupted, name), isNotNull);
      final followupName = 'after-interruption-$i.txt';
      final followup = await receiver.prepare({
        followupName: [i],
      });
      expect(await receiver.upload(followup, followupName, [i]), 200);
      expect(await receiver.outcome(followup, followupName), isNull);
    }
    // ignore: avoid_print
    print('NATIVE_TRANSFER_CHECKS_PASSED: 6 nested fixtures; destination failure/resend; checksum reopening; 3 abort/recovery cycles');
  });
  if (Platform.isAndroid) {
    testWidgets('Android selected folder grant, nested save and whole-folder source listing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Center(child: Text('Select LocalSendQA in Downloads'))),
        ),
      );
      final documents = await getApplicationDocumentsDirectory();
      final savedGrant = File('${documents.path}/localsend-qa-saf-uri.txt');
      const reuse = bool.fromEnvironment('REUSE_SAF_TREE');
      final String tree;
      if (reuse) {
        tree = await savedGrant.readAsString();
      } else {
        final picked = await android.pickDirectoryPathAndroid();
        expect(picked, isNotNull);
        tree = picked!;
        await savedGrant.writeAsString(tree);
      }
      final receiver = await _Receiver.start(Directory(tree));
      addTearDown(receiver.close);
      final prefix = reuse ? 'after-relaunch' : 'selected-folder';
      final files = <String, List<int>>{
        '$prefix/nested/text.txt': utf8.encode('SAF nested file verification'),
        '$prefix/photo.jpg': [0xff, 0xd8, 1, 2, 3],
        '$prefix/empty.txt': [],
      };
      final session = await receiver.prepare(files);
      for (final file in files.entries) {
        expect(await receiver.upload(session, file.key, file.value), 200);
        expect(await receiver.outcome(session, file.key), isNull);
        final target = receiver.targets[receiver.key(session, file.key)]!;
        expect(target.displayPath, startsWith('content://'));
        expect(
          await calculateFileHash(path: target.displayPath, bytes: null, cancelToken: createCancellationToken()),
          sha256.convert(file.value).toString(),
          reason: file.key,
        );
      }
      if (!reuse) {
        final selected = await android.pickDirectoryAndroid();
        expect(selected, isNotNull);
        expect(selected!.files.any((file) => file.name.endsWith('/$prefix/nested/text.txt')), isTrue);
        expect(selected.files.any((file) => file.name.endsWith('/$prefix/photo.jpg')), isTrue);
      }
      // ignore: avoid_print
      print('ANDROID_SAF_CHECKS_PASSED: nested file hashes; image destination; folder source hierarchy; reuse=$reuse');
    });
  }
  if (Platform.isIOS) {
    testWidgets('iOS chosen destination and whole-folder picker use real native access', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Center(child: Text('Select LocalSendQA under On My iPhone / LocalSend'))),
        ),
      );
      final documents = await getApplicationDocumentsDirectory();
      final fixture = await Directory('${documents.path}/LocalSendQA').create(recursive: true);
      await Directory('${fixture.path}/source/nested').create(recursive: true);
      await File('${fixture.path}/source/nested/document.txt').writeAsString('Whole folder source fixture');
      final saved = File('${documents.path}/localsend-qa-ios-destination.txt');
      const reuse = bool.fromEnvironment('REUSE_IOS_FOLDER');
      final String chosen;
      if (reuse) {
        chosen = await saved.readAsString();
      } else {
        final picked = await pickDirectoryPath(forSaving: true, persist: true);
        expect(picked, isNotNull);
        chosen = picked!;
        expect(chosen.split('/').last, 'LocalSendQA');
        await saved.writeAsString(chosen);
      }
      final target = await prepareFileSaveTarget(
        destinationDirectory: chosen,
        cacheDirectory: documents.path,
        fileName: reuse ? 'received/after-relaunch.txt' : 'received/custom-folder.txt',
        saveToGallery: false,
        createdDirectories: {},
      );
      try {
        await File(target.path!).writeAsString('Saved into the chosen folder');
      } finally {
        await finishFileSaveTarget(target);
      }
      expect(await File(target.path!).readAsString(), 'Saved into the chosen folder');
      expect(target.path, contains('/LocalSendQA/received/'));
      if (!reuse) {
        final snapshot = await pickDirectoryPath();
        expect(snapshot, isNotNull);
        expect(snapshot, contains('/Library/Caches/localsend-folders/'));
        expect(await File('$snapshot/source/nested/document.txt').readAsString(), 'Whole folder source fixture');
        final selection = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
        await selection.dispatchAsync(AddDirectoryAction(snapshot!));
        expect(selection.state.any((file) => file.name == 'LocalSendQA/source/nested/document.txt'), isTrue);
      }
      // ignore: avoid_print
      print('IOS_FOLDER_PICKER_CHECKS_PASSED: chosen folder write; source snapshot and recursive selection; reuse=$reuse');
    });
  }
}

class _Session {
  final String id;
  final Map<String, String> tokens;
  _Session(this.id, this.tokens);
}

class _Receiver {
  final Directory directory;
  final RsHttpServer server;
  final HttpClient client = HttpClient();
  final targets = <String, FileSaveTarget>{};
  final outcomes = <String, Completer<Object?>>{};
  final started = <String, Completer<void>>{};
  late final StreamSubscription<RsServerEvent> subscription;
  static const port = 40973;

  _Receiver(this.directory, this.server);

  static Future<_Receiver> start(Directory directory) async {
    final server = await startServer(
      port: port,
      alias: 'Native test receiver',
      version: '2.2',
      fingerprint: 'receiver-fixture',
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
    );
    final receiver = _Receiver(directory, server);
    receiver.subscription = server.listen().listen((event) {
      switch (event) {
        case RsServerEvent_PrepareUpload(:final files):
          unawaited(server.respondPrepareUpload(acceptedFileIds: files.keys.toList()));
        case RsServerEvent_FileUpload(:final sessionId, :final fileId, :final file):
          unawaited(receiver.receive(sessionId, fileId, file.size.toInt()));
        default:
          break;
      }
    });
    return receiver;
  }

  String key(_Session session, String name) => '${session.id}:$name';

  Future<void> receive(String sessionId, String fileId, int size) async {
    final id = '$sessionId:$fileId';
    final result = outcomes.putIfAbsent(id, Completer<Object?>.new);
    FileSaveTarget? target;
    Object? failure;
    try {
      final previous = targets[id];
      target = previous == null
          ? await prepareFileSaveTarget(
              destinationDirectory: directory.path,
              cacheDirectory: directory.path,
              fileName: fileId,
              saveToGallery: false,
              createdDirectories: {},
              androidSdkInt: Platform.isAndroid ? 35 : null,
            )
          : await reopenFileSaveTarget(previous);
      targets[id] = target;
      started.putIfAbsent(id, Completer<void>.new).complete();
      await server
          .respondFileUpload(
            sessionId: sessionId,
            fileId: fileId,
            path: target.path,
            fileDescriptor: target.fileDescriptor,
            fileSize: BigInt.from(size),
          )
          .drain<void>();
    } catch (error) {
      failure = error;
      if (target == null) await server.failFileUpload(sessionId: sessionId, fileId: fileId);
    } finally {
      if (target != null) await finishFileSaveTarget(target);
      result.complete(failure);
    }
  }

  Future<_Session> prepare(Map<String, List<int>> files) async {
    final request = await client.postUrl(Uri.parse('http://127.0.0.1:$port/api/localsend/v2/prepare-upload'));
    request.headers.contentType = ContentType.json;
    request.write(
      jsonEncode({
        'info': {'alias': 'Native test sender', 'version': '2.2', 'fingerprint': 'sender-fixture', 'port': 1, 'protocol': 'http', 'download': false},
        'files': {
          for (final file in files.entries)
            file.key: {
              'id': file.key,
              'fileName': file.key,
              'size': file.value.length,
              'fileType': 'application/octet-stream',
              'sha256': sha256.convert(file.value).toString(),
            },
        },
      }),
    );
    final response = await request.close().timeout(const Duration(seconds: 20));
    final body = await utf8.decodeStream(response);
    expect(response.statusCode, 200, reason: body);
    final data = jsonDecode(body) as Map<String, dynamic>;
    final session = _Session(data['sessionId'] as String, (data['files'] as Map).cast<String, String>());
    for (final name in files.keys) {
      outcomes[key(session, name)] = Completer<Object?>();
      started[key(session, name)] = Completer<void>();
    }
    return session;
  }

  Future<HttpClientRequest> request(_Session session, String name, int size) async {
    final uri = Uri.http('127.0.0.1:$port', '/api/localsend/v2/upload', {'sessionId': session.id, 'fileId': name, 'token': session.tokens[name]!});
    final request = await client.postUrl(uri);
    request.headers.contentLength = size;
    return request;
  }

  Future<int> upload(_Session session, String name, List<int> bytes) async {
    final upload = await request(session, name, bytes.length);
    upload.add(bytes);
    final response = await upload.close().timeout(const Duration(seconds: 30));
    await response.drain<void>();
    return response.statusCode;
  }

  Future<void> abort(_Session session, String name, int size) async {
    final upload = await request(session, name, size);
    upload.add(List.filled(64 * 1024, 7));
    await upload.flush();
    await started[key(session, name)]!.future.timeout(const Duration(seconds: 15));
    upload.abort();
    try {
      await upload.close();
    } catch (_) {
      /* expected aborted request */
    }
  }

  Future<Object?> outcome(_Session session, String name) => outcomes[key(session, name)]!.future.timeout(const Duration(seconds: 20));
  void resetOutcome(_Session session, String name) {
    outcomes[key(session, name)] = Completer<Object?>();
    started[key(session, name)] = Completer<void>();
  }

  Future<void> close() async {
    client.close(force: true);
    await server.stop();
    // The Rust server handle keeps its event channel alive after stop. FRB
    // cancellation waits for that channel; do not block test teardown on it.
    unawaited(subscription.cancel());
  }
}
