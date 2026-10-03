import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:refena_flutter/refena_flutter.dart';

import '../mocks.mocks.dart';

void main() {
  const file = FileDto(
    id: 'file-id',
    fileName: 'test.txt',
    size: 4,
    fileType: FileType.text,
    hash: null,
    preview: null,
    metadata: null,
  );

  Future<List<String>> pumpReceivePage(WidgetTester tester) async {
    final events = <String>[];
    final vm = ViewProvider(
      (ref) => ReceivePageVm(
        status: SessionStatus.waiting,
        sender: Device.empty,
        showSenderInfo: false,
        files: const [file],
        message: null,
        onAccept: () => events.add('accept'),
        onDecline: () => events.add('decline'),
        onClose: () {},
      ),
    );
    final scope = RefenaScope(
      overrides: [persistenceProvider.overrideWithValue(_TestPersistenceService())],
      child: MaterialApp(
        initialRoute: '/receive',
        routes: {
          '/': (_) => const Scaffold(body: Text('Home')),
          '/receive': (_) => ReceivePage(vm),
        },
      ),
    );
    scope.notifier(selectedReceivingFilesProvider).setFiles(const [file]);
    await tester.pumpWidget(scope);
    await tester.pump();
    return events;
  }

  testWidgets('accepts a pending file request with Enter', (tester) async {
    final events = await pumpReceivePage(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();

    expect(events, ['accept']);
  });

  testWidgets('declines a pending file request with Escape', (tester) async {
    final events = await pumpReceivePage(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();

    expect(events, ['decline']);
    expect(find.text('Home'), findsOneWidget);
  });
}

class _TestPersistenceService extends MockPersistenceService {
  @override
  bool getAlwaysOnTop() => false;
}
