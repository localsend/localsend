import 'dart:ui' show SemanticsAction, SemanticsActionEvent, Tristate;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/widget/custom_icon_button.dart';

void main() {
  for (final enabled in [true, false]) {
    testWidgets('icon button exposes name, role and enabled state ($enabled)', (tester) async {
      var calls = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomIconButton(
              tooltip: 'Receive history',
              onPressed: enabled ? () => calls++ : null,
              child: const Icon(Icons.history),
            ),
          ),
        ),
      );
      final labeled = find.byType(TextButton);
      expect(labeled, findsOneWidget);
      final node = tester.getSemantics(labeled);
      final data = node.getSemanticsData();
      expect(data.tooltip, 'Receive history');
      expect(data.flagsCollection.isButton, isTrue);
      expect(data.flagsCollection.isEnabled, enabled ? Tristate.isTrue : Tristate.isFalse);
      expect(data.hasAction(SemanticsAction.tap), enabled);
      if (enabled) {
        tester.binding.performSemanticsAction(SemanticsActionEvent(type: SemanticsAction.tap, viewId: tester.view.viewId, nodeId: node.id));
        await tester.pump();
        expect(calls, 1);
      }
    });
  }
}
