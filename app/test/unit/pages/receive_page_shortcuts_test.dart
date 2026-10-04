import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/pages/receive_page.dart';

/// Mirrors the tree the receive page builds around its accept/decline buttons:
/// `Shortcuts` > `Actions` > `Focus` > `Row`, using the page's own shortcut map
/// and key handler.
Widget _buttonRow({
  required void Function(String action) log,
  required FocusNode rowNode,
  bool autofocus = true,
  FocusNode? declineNode,
  FocusNode? acceptNode,
}) {
  return Shortcuts(
    shortcuts: receivePageShortcuts,
    child: Actions(
      actions: {
        DeclineTransferIntent: CallbackAction<DeclineTransferIntent>(onInvoke: (_) async => log('decline')),
      },
      child: Focus(
        focusNode: rowNode,
        autofocus: autofocus,
        onKeyEvent: (node, event) => acceptOnEnterKey(node, event, onAccept: () => log('accept')),
        child: Row(
          children: [
            ElevatedButton(
              focusNode: declineNode,
              onPressed: () => log('decline'),
              child: const Text('decline'),
            ),
            ElevatedButton(
              focusNode: acceptNode,
              onPressed: () => log('accept'),
              child: const Text('accept'),
            ),
          ],
        ),
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // https://github.com/localsend/localsend/issues/3476
  //
  // Accepting an incoming transfer required clicking a button every time. The
  // bindings live in receivePageShortcuts, which is the map the page actually
  // installs, so this test drives the real thing rather than a copy.
  //
  // The MaterialApp around it matters just as much: it installs the default
  // Shortcuts that turn Enter into an ActivateIntent, which is what activates a
  // focused button. Shortcut resolution is by distance from the focused node, so
  // the page's own Enter binding used to swallow Enter before the focused
  // Decline button ever saw it and accept the transfer instead.

  testWidgets('Enter and numpadEnter accept, Escape declines', (tester) async {
    final log = <String>[];
    final rowNode = FocusNode(debugLabel: 'row');
    addTearDown(rowNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _buttonRow(log: log.add, rowNode: rowNode),
        ),
      ),
    );

    expect(FocusManager.instance.primaryFocus, rowNode);

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

  testWidgets('Enter declines while the decline button has focus', (tester) async {
    final log = <String>[];
    final rowNode = FocusNode(debugLabel: 'row');
    final declineNode = FocusNode(debugLabel: 'decline');
    addTearDown(rowNode.dispose);
    addTearDown(declineNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _buttonRow(log: log.add, rowNode: rowNode, declineNode: declineNode),
        ),
      ),
    );

    declineNode.requestFocus();
    await tester.pump();
    expect(FocusManager.instance.primaryFocus, declineNode);

    // Must not be intercepted by the page's own Enter handler: the focused
    // button is what the user asked to activate.
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(log, ['decline']);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pump();
    expect(log, ['decline', 'decline']);
  });

  testWidgets('Enter accepts while the accept button has focus', (tester) async {
    final log = <String>[];
    final rowNode = FocusNode(debugLabel: 'row');
    final acceptNode = FocusNode(debugLabel: 'accept');
    addTearDown(rowNode.dispose);
    addTearDown(acceptNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _buttonRow(log: log.add, rowNode: rowNode, acceptNode: acceptNode),
        ),
      ),
    );

    acceptNode.requestFocus();
    await tester.pump();
    expect(FocusManager.instance.primaryFocus, acceptNode);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(log, ['accept']);
  });

  testWidgets('Enter does nothing while nothing is focused', (tester) async {
    final log = <String>[];
    final rowNode = FocusNode(debugLabel: 'row');
    addTearDown(rowNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _buttonRow(log: log.add, rowNode: rowNode, autofocus: false),
        ),
      ),
    );

    expect(FocusManager.instance.primaryFocus, isNot(same(rowNode)));
    expect(rowNode.hasFocus, isFalse);

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(log, isEmpty);
  });

  testWidgets('Enter does nothing while focus is outside the button row', (tester) async {
    final log = <String>[];
    final rowNode = FocusNode(debugLabel: 'row');
    addTearDown(rowNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              const TextField(autofocus: true),
              _buttonRow(log: log.add, rowNode: rowNode, autofocus: false),
            ],
          ),
        ),
      ),
    );

    await tester.pump();
    expect(find.byType(TextField), findsOneWidget);
    expect(rowNode.hasFocus, isFalse);
    expect(FocusManager.instance.primaryFocus, isNot(same(rowNode)));

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(log, isEmpty);
  });

  testWidgets('an unmodified letter does not trigger anything', (tester) async {
    final log = <String>[];
    final rowNode = FocusNode(debugLabel: 'row');
    addTearDown(rowNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _buttonRow(log: log.add, rowNode: rowNode),
        ),
      ),
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.keyA);
    await tester.pump();
    expect(log, isEmpty);
  });

  test('every activator maps to the intended intent', () {
    expect(receivePageShortcuts, {
      const SingleActivator(LogicalKeyboardKey.escape): isA<DeclineTransferIntent>(),
    });
    expect(
      receivePageShortcuts.values.whereType<AcceptTransferIntent>(),
      isEmpty,
      reason: 'Enter must not be a Shortcuts activator, it would win over the focused button',
    );
  });
}
