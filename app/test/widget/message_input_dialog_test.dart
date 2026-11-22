import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/widget/dialogs/message_input_dialog.dart';

void main() {
  testWidgets('can submit a message with large text and the keyboard open', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(375, 667);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetViewInsets);

    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(3)),
          child: child!,
        ),
        home: const Scaffold(),
      ),
    );
    final result = showDialog<String>(
      context: tester.element(find.byType(Scaffold)),
      builder: (_) => const MessageInputDialog(),
    );
    await tester.pumpAndSettle();
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    final field = find.byType(TextFormField);
    await tester.ensureVisible(field);
    await tester.tap(field);
    await tester.enterText(field, 'Hello from LocalSend');
    await tester.pumpAndSettle();
    final confirm = find.widgetWithText(ElevatedButton, t.general.confirm);
    expect(confirm.hitTestable(), findsOneWidget);
    await tester.tap(confirm);
    await tester.pumpAndSettle();
    expect(await result, 'Hello from LocalSend');
  });
}
