import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/pages/receive_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // https://github.com/localsend/localsend/issues/3476
  //
  // Accepting an incoming transfer required clicking a button every time. The
  // bindings live in receivePageShortcuts, which is the map the page actually
  // installs, so this test drives the real thing rather than a copy.

  testWidgets('Enter and numpadEnter accept, Escape declines', (tester) async {
    final log = <String>[];

    await tester.pumpWidget(
      MaterialApp(
        home: Shortcuts(
          shortcuts: receivePageShortcuts,
          child: Actions(
            actions: {
              AcceptTransferIntent: CallbackAction<AcceptTransferIntent>(onInvoke: (_) async => log.add('accept')),
              DeclineTransferIntent: CallbackAction<DeclineTransferIntent>(onInvoke: (_) async => log.add('decline')),
            },
            child: Focus(
              autofocus: true,
              child: const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(log, ['accept']);

    await tester.sendKeyEvent(LogicalKeyboardKey.numpadEnter);
    await tester.pump();
    expect(log, ['accept', 'accept']);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pump();
    expect(log, ['accept', 'accept', 'decline']);
  });

  testWidgets('an unmodified letter does not trigger anything', (tester) async {
    final log = <String>[];

    await tester.pumpWidget(
      MaterialApp(
        home: Shortcuts(
          shortcuts: receivePageShortcuts,
          child: Actions(
            actions: {
              AcceptTransferIntent: CallbackAction<AcceptTransferIntent>(onInvoke: (_) async => log.add('accept')),
              DeclineTransferIntent: CallbackAction<DeclineTransferIntent>(onInvoke: (_) async => log.add('decline')),
            },
            child: Focus(
              autofocus: true,
              child: const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.keyA);
    await tester.pump();
    expect(log, isEmpty);
  });

  test('every activator maps to the intended intent', () {
    expect(
      receivePageShortcuts.values.whereType<AcceptTransferIntent>().length,
      2,
      reason: 'Enter and numpadEnter both accept',
    );
    expect(
      receivePageShortcuts.values.whereType<DeclineTransferIntent>().length,
      1,
      reason: 'Escape declines',
    );
  });
}
