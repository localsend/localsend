import 'dart:async';
import 'dart:convert';

import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/state/settings_state.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/file_transfer_provider.dart';
import 'package:localsend_app/provider/http_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_isolates/isolate.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/rust/api/cancel.dart';
import 'package:localsend_isolates/rust/api/http.dart';
import 'package:localsend_isolates/rust/api/model.dart' show PrepareUploadRequestDto, PrepareUploadResponseDto, ProtocolType;
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:mockito/mockito.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

class _SyncState extends Fake implements SyncState {}

class _Settings extends Fake implements SettingsState {
  @override
  bool get createChecksums => false;
}

class _TestSettingsService extends SettingsService {
  _TestSettingsService(super.persistence);

  @override
  SettingsState init() => _Settings();
}

class _CancellationToken extends Fake implements RsCancellationToken {
  @override
  void cancel() {}
}

class _RustLibApi extends Fake implements RustLibApi {
  @override
  RsCancellationToken crateApiCancelCreateCancellationToken() => _CancellationToken();
}

/// A client whose prepare-upload request is answered by the test.
class _HttpClient extends Fake implements RsHttpClient {
  final prepareUploadResponse = Completer<PrepareUploadResult>();
  final prepareUploadCalled = Completer<void>();
  final canceledSessions = <String>[];
  PrepareUploadRequestDto? payload;

  @override
  Future<PrepareUploadResult> prepareUpload({
    required ProtocolType protocol,
    required String ip,
    required int port,
    required PrepareUploadRequestDto payload,
    String? publicKey,
    String? pin,
    required RsCancellationToken cancelToken,
  }) {
    this.payload = payload;
    prepareUploadCalled.complete();
    return prepareUploadResponse.future;
  }

  @override
  Future<void> cancel({required ProtocolType protocol, required String ip, required int port, required String sessionId}) async {
    canceledSessions.add(sessionId);
  }
}

class _HttpClientCollection extends Fake implements HttpClientCollection {
  final RsHttpClient client;

  _HttpClientCollection(this.client);

  @override
  RsHttpClient pinnedTo(String fingerprint) => client;
}

void main() {
  setUpAll(() {
    RustLib.initMock(api: _RustLibApi());
  });

  test('Should cancel the remote session when the prepare-upload response arrives after a local cancel', () async {
    final client = _HttpClient();
    final ref = RefenaContainer(
      overrides: [
        persistenceProvider.overrideWithValue(MockPersistenceService()),
        settingsProvider.overrideWithNotifier((ref) => _TestSettingsService(MockPersistenceService())),
        httpProvider.overrideWithBuilder((_) => _HttpClientCollection(client)),
        deviceFullInfoProvider.overrideWithBuilder((_) => _createDevice(fingerprint: 'self')),
        parentIsolateProvider.overrideWithReducer(
          notifier: (_) => IsolateController(initialState: ParentIsolateState.initial(_SyncState())),
          reducer: {
            IsolateDiscoveryReportOutboundAction: null,
          },
        ),
      ],
    );

    final session = ref
        .notifier(sendProvider)
        .startSession(
          target: _createDevice(fingerprint: 'target'),
          files: [
            const CrossFile(
              name: 'a.txt',
              fileType: FileType.text,
              size: 1,
              thumbnail: null,
              asset: null,
              path: null,
              bytes: [97],
              lastModified: null,
              lastAccessed: null,
            ),
          ],
          background: true,
        );

    await client.prepareUploadCalled.future;
    final sessionId = ref.read(sendProvider).keys.single;

    ref.notifier(sendProvider).cancelSession(sessionId);
    // The receiver had already answered.
    client.prepareUploadResponse.complete(
      const PrepareUploadResult(
        statusCode: 200,
        response: PrepareUploadResponseDto(sessionId: 'remote-session', files: {'file-id': 'token'}),
      ),
    );
    await session;

    expect(ref.read(sendProvider), isEmpty);
    expect(ref.read(fileTransferProvider).getData(), isEmpty);
    expect(client.canceledSessions, ['remote-session']);
  });

  for (final text in ['Hello, 你好 👋', 'a' * 16384, 'a' * 105000, '中' * 6000]) {
    final bytes = utf8.encode(text);
    test('inline preview is bounded without losing ${bytes.length} bytes of text', () async {
      final client = _HttpClient();
      final ref = RefenaContainer(
        overrides: [
          settingsProvider.overrideWithNotifier((ref) => _TestSettingsService(MockPersistenceService())),
          httpProvider.overrideWithBuilder((_) => _HttpClientCollection(client)),
          deviceFullInfoProvider.overrideWithBuilder((_) => _createDevice(fingerprint: 'self')),
          parentIsolateProvider.overrideWithReducer(
            notifier: (_) => IsolateController(initialState: ParentIsolateState.initial(_SyncState())),
            reducer: {IsolateDiscoveryReportOutboundAction: null},
          ),
        ],
      );
      addTearDown(ref.disposeContainer);
      final session = ref
          .notifier(sendProvider)
          .startSession(
            target: _createDevice(fingerprint: 'target'),
            files: [
              CrossFile(
                name: 'message.txt',
                fileType: FileType.text,
                size: bytes.length,
                thumbnail: null,
                asset: null,
                path: null,
                bytes: bytes,
                lastModified: null,
                lastAccessed: null,
              ),
            ],
            background: true,
          );
      await client.prepareUploadCalled.future;
      final sessionId = ref.read(sendProvider).keys.single;
      final sendingFile = ref.read(sendProvider)[sessionId]!.files.values.single;
      expect(client.payload!.files.values.single.preview, bytes.length <= 16384 ? text : isNull);
      expect(sendingFile.bytes, bytes);
      expect(sendingFile.file.size, bytes.length);

      ref.notifier(sendProvider).cancelSession(sessionId);
      client.prepareUploadResponse.complete(
        const PrepareUploadResult(
          statusCode: 200,
          response: PrepareUploadResponseDto(sessionId: 'remote', files: {}),
        ),
      );
      await session;
    });
  }
}

Device _createDevice({required String fingerprint}) {
  return Device(
    signalingId: null,
    ip: '192.168.1.2',
    version: '2.1',
    port: 53317,
    https: true,
    fingerprint: fingerprint,
    alias: 'Nice Banana',
    deviceModel: 'Pixel',
    deviceType: DeviceType.mobile,
    download: false,
    channels: [HttpChannel(host: '192.168.1.2', port: 53317, https: true)],
  );
}
