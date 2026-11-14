import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/state/send/send_session_state.dart';
import 'package:localsend_app/model/state/send/sending_file.dart';
import 'package:localsend_app/provider/file_transfer_provider.dart';
import 'package:localsend_app/provider/http_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_app/util/native/channel/android_channel.dart' as android;
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_status.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:localsend_isolates/rust/api/http.dart';
import 'package:localsend_isolates/rust/api/model.dart' as rust;
import 'package:localsend_isolates/src/task/server/file_saver.dart';
import 'package:localsend_isolates/util/rust.dart';
import 'package:refena_flutter/refena_flutter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('retry selects only failures and preserves folder names, sources and metadata', () {
    final session = _session(SessionStatus.finishedWithErrors);
    final transfers = FileTransferNotifier()
      ..setStatuses(
        sessionId: 'session',
        statuses: {
          'failed': FileStatus.failed,
          'saved': FileStatus.finished,
          'skipped': FileStatus.skipped,
        },
      );
    final files = failedFilesForRetry(session, transfers);
    expect(files.map((f) => f.name), ['Trip/day 1/photo.jpg']);
    expect(files.single.path, 'content://provider/document/opaque-17');
    expect(files.single.lastModified, '2026-01-01T00:00:00Z');
    expect(files.single.bytes, [1, 2]);
  });

  for (final status in [SessionStatus.sending, SessionStatus.waiting, SessionStatus.finished, SessionStatus.canceledByReceiver]) {
    test('does not retry a $status session', () {
      final transfers = FileTransferNotifier()..setStatus(sessionId: 'session', fileId: 'failed', status: FileStatus.failed);
      expect(failedFilesForRetry(_session(status), transfers), isEmpty);
    });
  }

  test('does not retry untracked or successful files', () {
    expect(failedFilesForRetry(_session(SessionStatus.finishedWithErrors), FileTransferNotifier()), isEmpty);
  });

  test('generic receiver 500 explains recovery while meaningful server errors remain', () {
    expect(
      const RsHttpClientError.statusCode(status: 500, message: 'Status code: 500 Internal Server Error').humanErrorMessage,
      contains('receiving device'),
    );
    expect(const RsHttpClientError.statusCode(status: 500, message: 'Disk full').humanErrorMessage, '[500] Disk full');
    expect(const RsHttpClientError.statusCode(status: 403, message: 'Invalid token').humanErrorMessage, '[403] Invalid token');
  });

  test('Android directory selection uses native relative names with opaque document IDs', () async {
    final service = ReduxNotifier.test(redux: SelectedSendingFilesNotifier());
    final result = android.PickDirectoryResult(
      directoryUri: 'content://provider/tree/opaque-root',
      files: [
        android.FileInfo(name: 'Holiday/day 1/photo.jpg', size: 2, uri: 'content://provider/document/17', lastModified: null),
        android.FileInfo(name: 'Holiday/day 2/photo.jpg', size: 2, uri: 'content://provider/document/23', lastModified: null),
      ],
    );
    await service.dispatchAsync(AddAndroidDirectoryAction(result));
    expect(service.state.map((f) => f.name), ['Holiday/day 1/photo.jpg', 'Holiday/day 2/photo.jpg']);
    await service.dispatchAsync(AddAndroidDirectoryAction(result));
    expect(service.state, hasLength(2));
  });

  test('iOS retries reopen the same coordinated target and release its new lease', () async {
    const channel = MethodChannel('ios-delegate-channel');
    final calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      if (call.method == 'prepareReceivedFile') return {'path': '/chosen/sub/file.txt', 'id': 'new-lease'};
      return null;
    });
    addTearDown(() => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null));
    final target = await reopenFileSaveTarget(
      FileSaveTarget(
        path: '/chosen/sub/file.txt',
        displayPath: '/chosen/sub/file.txt',
        fileDescriptor: null,
        iosWriteId: 'old-lease',
      ),
    );
    expect(calls.single.arguments, {'directory': '/chosen/sub', 'name': 'file.txt', 'overwrite': true});
    expect(target.path, '/chosen/sub/file.txt');
    await finishFileSaveTarget(target);
    expect(calls.last.arguments, {'id': 'new-lease'});
  });

  test('retry awaits cancellation and ignores a duplicate tap', () async {
    final (container, notifier, client) = _retryHarness();
    addTearDown(container.disposeContainer);
    final first = notifier.retryFailedFiles('session', isCurrent: () => true);
    await notifier.retryFailedFiles('session', isCurrent: () => true);
    expect(client.cancelCalls, 1);
    expect(notifier.prepared, isEmpty);
    client.cancelled.complete();
    await first;
    expect(notifier.prepared.single.single.name, 'Trip/day 1/photo.jpg');
    expect(notifier.replaced, 'session');
  });

  test('leaving the result while cancellation waits prevents a replacement', () async {
    final (container, notifier, client) = _retryHarness();
    addTearDown(container.disposeContainer);
    var current = true;
    final pending = notifier.retryFailedFiles('session', isCurrent: () => current);
    current = false;
    client.cancelled.complete();
    await pending;
    expect(notifier.prepared, isEmpty);
  });

  test('closing the original session during cancellation does not resurrect it', () async {
    final (container, notifier, client) = _retryHarness();
    addTearDown(container.disposeContainer);
    final pending = notifier.retryFailedFiles('session', isCurrent: () => true);
    notifier.closeSession('session');
    client.cancelled.complete();
    await pending;
    expect(notifier.prepared, isEmpty);
    expect(container.read(sendProvider), isEmpty);
  });

  test('cancellation failure preserves the original result and permits another retry', () async {
    final (container, notifier, client) = _retryHarness();
    addTearDown(container.disposeContainer);
    final pending = notifier.retryFailedFiles('session', isCurrent: () => true);
    final failure = expectLater(pending, throwsStateError);
    client.cancelled.completeError(StateError('receiver unavailable'));
    await failure;
    expect(notifier.prepared, isEmpty);
    expect(container.read(sendProvider)['session']!.status, SessionStatus.finishedWithErrors);
    client.cancelled = Completer<void>()..complete();
    await notifier.retryFailedFiles('session', isCurrent: () => true);
    expect(client.cancelCalls, 2);
    expect(notifier.prepared, hasLength(1));
  });
}

SendSessionState _session(SessionStatus status) => SendSessionState(
  sessionId: 'session',
  remoteSessionId: 'expired',
  background: false,
  status: status,
  target: const Device(
    signalingId: null,
    ip: '127.0.0.1',
    version: '2.1',
    port: 53317,
    https: true,
    fingerprint: 'test',
    alias: 'Receiver',
    deviceModel: null,
    deviceType: DeviceType.mobile,
    download: false,
    channels: [],
  ),
  files: {
    for (final id in ['failed', 'saved', 'skipped'])
      id: SendingFile(
        file: FileDto(
          id: id,
          fileName: 'Trip/day 1/photo.jpg',
          size: 2,
          fileType: FileType.image,
          hash: null,
          preview: null,
          metadata: FileMetadata(lastModified: '2026-01-01T00:00:00Z', lastAccessed: null),
        ),
        token: 'expired',
        thumbnail: null,
        asset: null,
        path: 'content://provider/document/opaque-17',
        bytes: [1, 2],
        errorMessage: 'connection lost',
      ),
  },
  hashedFileCount: 3,
  startTime: null,
  endTime: null,
  sendingTasks: [],
  errorMessage: null,
);

class _CancelClient extends Fake implements RsHttpClient {
  Completer<void> cancelled = Completer<void>();
  int cancelCalls = 0;

  @override
  Future<void> cancel({required rust.ProtocolType protocol, required String ip, required int port, required String sessionId}) {
    expect(sessionId, 'expired');
    cancelCalls++;
    return cancelled.future;
  }
}

class _TestClients extends HttpClientCollection {
  final RsHttpClient client;
  _TestClients(this.client) : super(privateKey: '', certificate: '', discovery: client);
  @override
  RsHttpClient pinnedTo(String fingerprint) => client;
}

class _RetryNotifier extends SendNotifier {
  final prepared = <List<CrossFile>>[];
  String? replaced;
  @override
  Map<String, SendSessionState> init() => {'session': _session(SessionStatus.finishedWithErrors)};
  @override
  Future<void> startSession({required Device target, required List<CrossFile> files, required bool background, String? replacesSessionId}) async {
    prepared.add(files);
    replaced = replacesSessionId;
  }
}

(RefenaContainer, _RetryNotifier, _CancelClient) _retryHarness() {
  final notifier = _RetryNotifier();
  final client = _CancelClient();
  final container = RefenaContainer(
    overrides: [
      sendProvider.overrideWithNotifier((ref) => notifier),
      httpProvider.overrideWithBuilder((ref) => _TestClients(client)),
    ],
  );
  container.notifier(sendProvider);
  container
      .notifier(fileTransferProvider)
      .setStatuses(
        sessionId: 'session',
        statuses: {
          'failed': FileStatus.failed,
          'saved': FileStatus.finished,
          'skipped': FileStatus.skipped,
        },
      );
  return (container, notifier, client);
}
