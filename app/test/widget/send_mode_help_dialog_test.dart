import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/widget/dialogs/send_mode_help_dialog.dart';

void main() {
  for (final scenario in [
    (name: 'small landscape', size: const Size(568, 320), scale: 1.0, scrolls: true),
    (name: 'enlarged landscape text', size: const Size(844, 390), scale: 1.3, scrolls: true),
    (name: 'normal portrait', size: const Size(390, 844), scale: 1.0, scrolls: false),
  ]) {
    testWidgets('send mode help is reachable with ${scenario.name}', (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = scenario.size;
      tester.platformDispatcher.textScaleFactorTestValue = scenario.scale;
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

      var closed = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: getTheme(ColorMode.localsend, Colors.teal, Brightness.light, null),
          home: Builder(
            builder: (context) => Scaffold(
              body: Center(
                child: TextButton(
                  onPressed: () async {
                    await showDialog<void>(context: context, builder: (_) => const SendModeHelpDialog());
                    closed = true;
                  },
                  child: const Text('Show help'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Show help'));
      await tester.pumpAndSettle();

      final dialog = find.byType(SendModeHelpDialog);
      final title = find.text(t.dialogs.sendModeHelp.title);
      final close = find.widgetWithText(TextButton, t.general.close);
      final explanations = [t.dialogs.sendModeHelp.single, t.dialogs.sendModeHelp.multiple, t.dialogs.sendModeHelp.link];
      expect(tester.takeException(), isNull);
      expect(title.hitTestable(), findsOneWidget);
      expect(close.hitTestable(), findsOneWidget);
      for (final text in [t.sendTab.sendModes.single, t.sendTab.sendModes.multiple, t.sendTab.sendModes.link, ...explanations]) {
        expect(find.text(text), findsOneWidget);
      }

      if (scenario.scrolls) {
        final scrollable = find.descendant(of: dialog, matching: find.byType(Scrollable));
        final last = find.text(explanations.last);
        final initialTop = tester.getTopLeft(last).dy;
        expect(scrollable, findsOneWidget);
        expect(last.hitTestable(at: const Alignment(0, 0.9)), findsNothing);

        await tester.scrollUntilVisible(last.hitTestable(at: const Alignment(0, 0.9)), 100, scrollable: scrollable, maxScrolls: 10);
        await tester.pumpAndSettle();

        final viewport = tester.getRect(scrollable);
        final paragraph = tester.getRect(last);
        expect(paragraph.top, lessThan(initialTop));
        expect(paragraph.top, greaterThanOrEqualTo(viewport.top));
        expect(paragraph.bottom, lessThanOrEqualTo(viewport.bottom));
        expect(last.hitTestable(at: const Alignment(0, 0.9)), findsOneWidget);
        expect(close.hitTestable(), findsOneWidget);

        await tester.scrollUntilVisible(title.hitTestable(), -100, scrollable: scrollable, maxScrolls: 10);
        await tester.pumpAndSettle();
        expect(title.hitTestable(), findsOneWidget);
        expect(find.text(explanations.first).hitTestable(), findsOneWidget);
      } else {
        for (final text in explanations) {
          expect(find.text(text).hitTestable(at: const Alignment(0, -0.9)), findsOneWidget);
          expect(find.text(text).hitTestable(at: const Alignment(0, 0.9)), findsOneWidget);
        }
      }

      expect(tester.takeException(), isNull);
      expect(close.hitTestable(), findsOneWidget);
      await tester.tap(close);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(dialog, findsNothing);
      expect(closed, isTrue);
      expect(find.text('Show help').hitTestable(), findsOneWidget);
    });
  }
}
