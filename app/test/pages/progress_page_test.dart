import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/provider/file_transfer_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_status.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:refena_flutter/addons.dart';
import 'package:refena_flutter/refena_flutter.dart';

import '../mocks.mocks.dart';

void main() {
  Future<_TestServerService> pumpFinishedProgressPage(WidgetTester tester) async {
    const sessionId = 'session-id';
    const file = FileDto(
      id: 'file-id',
      fileName: 'test.txt',
      size: 4,
      fileType: FileType.text,
      hash: null,
      preview: null,
      metadata: null,
    );
    final server = _TestServerService(
      ServerState(
        alias: 'Receiver',
        port: 53317,
        https: false,
        session: const ReceiveSessionState(
          sessionId: sessionId,
          status: SessionStatus.finished,
          sender: Device.empty,
          senderAlias: 'Sender',
          files: {
            'file-id': ReceivingFile(
              file: file,
              token: 'token',
              desiredName: 'test.txt',
              path: '/tmp/test.txt',
              savedToGallery: false,
              errorMessage: null,
            ),
          },
          startTime: 1,
          endTime: 2,
          destinationDirectory: '/tmp',
          cacheDirectory: '/tmp',
          saveToGallery: false,
          createdDirectories: {},
        ),
        web: null,
      ),
    );
    final scope = RefenaScope(
      overrides: [
        persistenceProvider.overrideWithValue(_TestPersistenceService()),
        serverProvider.overrideWithNotifier((ref) => server),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          navigatorKey: context.read(navigationProvider).key,
          theme: ThemeData(inputDecorationTheme: const InputDecorationTheme(fillColor: Colors.grey)),
          initialRoute: '/progress',
          routes: {
            '/': (_) => const Scaffold(body: Text('Home')),
            '/progress': (_) => const ProgressPage(showAppBar: false, closeSessionOnClose: true, sessionId: sessionId),
          },
        ),
      ),
    );
    scope.notifier(fileTransferProvider).setStatus(sessionId: sessionId, fileId: file.id, status: FileStatus.finished);
    await tester.pumpWidget(scope);
    await tester.pump();
    return server;
  }

  testWidgets('closes a finished receive session with Enter', (tester) async {
    final server = await pumpFinishedProgressPage(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();

    expect(server.closeCount, 1);
    expect(find.text('Home'), findsOneWidget);
  });

  testWidgets('does not close a finished receive session with modified Enter', (tester) async {
    final server = await pumpFinishedProgressPage(tester);

    for (final modifier in [
      LogicalKeyboardKey.controlLeft,
      LogicalKeyboardKey.shiftLeft,
      LogicalKeyboardKey.altLeft,
      LogicalKeyboardKey.metaLeft,
    ]) {
      await tester.sendKeyDownEvent(modifier);
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.sendKeyUpEvent(modifier);
      await tester.pump();

      expect(server.closeCount, 0, reason: '$modifier should not trigger Done');
      expect(find.byType(ProgressPage), findsOneWidget);
    }
  });
}

class _TestPersistenceService extends MockPersistenceService {
  @override
  bool getAlwaysOnTop() => false;
}

class _TestServerService extends ServerService {
  final ServerState initialState;
  int closeCount = 0;

  _TestServerService(this.initialState);

  @override
  ServerState init() => initialState;

  @override
  void closeSession() {
    closeCount++;
  }
}
