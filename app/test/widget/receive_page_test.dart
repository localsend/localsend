import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/receive_page.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:refena_flutter/addons.dart';
import 'package:refena_flutter/refena_flutter.dart';

import '../mocks.mocks.dart';

void main() {
  const file = FileDto(id: 'file', fileName: 'test.txt', size: 1, fileType: FileType.text, hash: null, preview: null, metadata: null);
  Future<void> pumpRequest(WidgetTester tester, {required VoidCallback onAccept, VoidCallback? onDecline, bool selected = true}) async {
    final container = RefenaContainer(overrides: [persistenceProvider.overrideWithValue(_PersistenceService())]);
    if (selected) {
      container.notifier(selectedReceivingFilesProvider).setFiles([file]);
    }
    final vm = ViewProvider(
      (ref) => ReceivePageVm(
        status: SessionStatus.waiting,
        sender: Device.empty,
        showSenderInfo: false,
        files: const [file],
        message: null,
        onAccept: onAccept,
        onDecline: onDecline ?? () {},
        onClose: () {},
      ),
    );
    await tester.pumpWidget(
      RefenaScope.withContainer(
        container: container,
        child: TranslationProvider(
          child: MaterialApp(navigatorKey: container.read(navigationProvider).key, home: ReceivePage(vm)),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  for (final key in [LogicalKeyboardKey.enter, LogicalKeyboardKey.numpadEnter, LogicalKeyboardKey.select]) {
    testWidgets('${key.keyLabel} accepts the initially focused request once', (tester) async {
      var accepted = 0;
      await pumpRequest(tester, onAccept: () => accepted++);
      await tester.sendKeyEvent(key);
      await tester.pump();
      expect(accepted, 1);
    });
  }

  testWidgets('TV OK does not accept when no files are selected', (tester) async {
    var accepted = 0;
    await pumpRequest(tester, onAccept: () => accepted++, selected: false);
    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pump();
    expect(accepted, 0);
  });

  testWidgets('TV OK activates the focused Decline button instead of accepting', (tester) async {
    var accepted = 0;
    var declined = 0;
    await pumpRequest(tester, onAccept: () => accepted++, onDecline: () => declined++);
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    expect(Focus.of(tester.element(find.text(t.general.decline))).hasPrimaryFocus, isTrue);
    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await tester.pumpAndSettle();
    expect(accepted, 0);
    expect(declined, 1);
  });
}

class _PersistenceService extends MockPersistenceService {
  @override
  bool getAlwaysOnTop() => false;
}
