import 'package:common/model/device.dart';
import 'package:common/model/dto/file_dto.dart';
import 'package:common/model/file_status.dart';
import 'package:common/model/file_type.dart';
import 'package:common/model/session_status.dart';
import 'package:localsend_app/model/state/send/send_session_state.dart';
import 'package:localsend_app/model/state/send/sending_file.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:test/test.dart';

/// Regression tests for the variable shadowing fix in send_provider.dart (#2899).
///
/// The original bug: after a successful prepareUpload, the remote session ID
/// from the response was assigned to a new local variable `sessionId` that
/// shadowed the existing local session ID. This caused `updateSession` to look
/// up the session using the remote ID (which did not exist in the state map),
/// so `remoteSessionId` was never stored. Subsequent upload and cancel requests
/// then sent a null session ID, producing 400/500 errors on the receiver.
void main() {
  group('SendSessionState updateSession - remoteSessionId regression', () {
    late Map<String, SendSessionState> sessionMap;
    late String localSessionId;
    late SendSessionState initialSession;

    setUp(() {
      localSessionId = 'local-session-uuid-1234';
      initialSession = SendSessionState(
        sessionId: localSessionId,
        remoteSessionId: null,
        background: false,
        status: SessionStatus.waiting,
        target: _createDevice(),
        files: {
          'file-1': _createSendingFile('file-1'),
        },
        startTime: null,
        endTime: null,
        sendingTasks: [],
        errorMessage: null,
      );

      sessionMap = <String, SendSessionState>{};
      sessionMap = sessionMap.updateSession(
        sessionId: localSessionId,
        state: (_) => initialSession,
      );
    });

    test('session is stored and retrievable by local sessionId', () {
      expect(sessionMap[localSessionId], isNotNull);
      expect(sessionMap[localSessionId]!.sessionId, localSessionId);
      expect(sessionMap[localSessionId]!.remoteSessionId, isNull);
    });

    test(
      'remoteSessionId is correctly stored after prepare-upload success '
      'using local sessionId as the lookup key',
      () {
        // Simulate the fixed code path (line 245-251 of send_provider.dart):
        //   final remoteSessionId = response.response!.sessionId;
        //   state = state.updateSession(
        //     sessionId: sessionId,  // <-- local session ID
        //     state: (s) => s?.copyWith(remoteSessionId: remoteSessionId),
        //   );
        const remoteSessionId = 'remote-session-from-receiver-5678';

        sessionMap = sessionMap.updateSession(
          sessionId: localSessionId, // correctly uses LOCAL session ID as key
          state: (s) => s?.copyWith(
            remoteSessionId: remoteSessionId,
          ),
        );

        // Verify session is still accessible by local ID
        expect(sessionMap[localSessionId], isNotNull);
        // Verify remoteSessionId is correctly stored
        expect(
          sessionMap[localSessionId]!.remoteSessionId,
          remoteSessionId,
        );
        // Verify local sessionId remains unchanged
        expect(
          sessionMap[localSessionId]!.sessionId,
          localSessionId,
        );
      },
    );

    test(
      'using remote session ID as lookup key fails to update state '
      '(reproduces the original shadowing bug)',
      () {
        // This test demonstrates what happened BEFORE the fix:
        // The shadowed variable would use the remote ID as the map key,
        // which doesn't exist, so updateSession returns the old state unchanged.
        const remoteSessionId = 'remote-session-from-receiver-5678';

        final updatedMap = sessionMap.updateSession(
          sessionId: remoteSessionId, // BUG: using remote ID as key
          state: (s) => s?.copyWith(
            remoteSessionId: remoteSessionId,
          ),
        );

        // The session under remoteSessionId doesn't exist, so callback
        // receives null, returns null, and state is unchanged.
        expect(updatedMap[remoteSessionId], isNull);
        // The original session still has null remoteSessionId
        expect(updatedMap[localSessionId]!.remoteSessionId, isNull);
      },
    );

    test(
      'remoteSessionId is available for subsequent upload requests',
      () {
        const remoteSessionId = 'remote-session-from-receiver-5678';

        // Step 1: Store remoteSessionId (the fix)
        sessionMap = sessionMap.updateSession(
          sessionId: localSessionId,
          state: (s) => s?.copyWith(
            remoteSessionId: remoteSessionId,
          ),
        );

        // Step 2: Simulate reading remoteSessionId for upload
        // (mirrors sendFile method at line 403)
        final storedRemoteSessionId =
            sessionMap[localSessionId]!.remoteSessionId;

        expect(storedRemoteSessionId, isNotNull);
        expect(storedRemoteSessionId, remoteSessionId);
      },
    );

    test(
      'remoteSessionId is available for cancel requests',
      () {
        const remoteSessionId = 'remote-session-from-receiver-5678';

        // Step 1: Store remoteSessionId
        sessionMap = sessionMap.updateSession(
          sessionId: localSessionId,
          state: (s) => s?.copyWith(
            remoteSessionId: remoteSessionId,
          ),
        );

        // Step 2: Simulate cancelSession reading remoteSessionId
        // (mirrors cancelSession method at line 513)
        final sessionState = sessionMap[localSessionId];
        expect(sessionState, isNotNull);

        final cancelRemoteId = sessionState!.remoteSessionId;
        expect(cancelRemoteId, isNotNull);
        expect(cancelRemoteId, remoteSessionId);
      },
    );

    test(
      'updateSession preserves other session fields when updating remoteSessionId',
      () {
        const remoteSessionId = 'remote-session-from-receiver-5678';

        sessionMap = sessionMap.updateSession(
          sessionId: localSessionId,
          state: (s) => s?.copyWith(
            remoteSessionId: remoteSessionId,
          ),
        );

        final session = sessionMap[localSessionId]!;
        // Ensure other fields remain intact
        expect(session.status, SessionStatus.waiting);
        expect(session.background, false);
        expect(session.target, _createDevice());
        expect(session.files.length, 1);
        expect(session.files.containsKey('file-1'), true);
        expect(session.startTime, isNull);
        expect(session.endTime, isNull);
        expect(session.errorMessage, isNull);
      },
    );
  });
}

Device _createDevice() {
  return const Device(
    signalingId: null,
    ip: '192.168.1.100',
    version: '2.0',
    port: 53317,
    https: true,
    fingerprint: 'test-fingerprint',
    alias: 'Test Device',
    deviceModel: 'Test Model',
    deviceType: DeviceType.desktop,
    download: false,
    discoveryMethods: {},
  );
}

SendingFile _createSendingFile(String id) {
  return SendingFile(
    file: FileDto(
      id: id,
      fileName: 'test.txt',
      size: 1024,
      fileType: FileType.text,
      hash: null,
      preview: null,
      metadata: null,
    ),
    status: FileStatus.queue,
    token: null,
    thumbnail: null,
    asset: null,
    path: '/tmp/test.txt',
    bytes: null,
    errorMessage: null,
  );
}
