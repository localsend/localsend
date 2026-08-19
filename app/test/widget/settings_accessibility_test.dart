import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/widget/custom_dropdown_button.dart';
import 'package:localsend_app/widget/labeled_checkbox.dart';
import 'package:localsend_app/widget/settings_entry.dart';

void main() {
  group('SettingsEntry semantics', () {
    testWidgets('combines a setting name with its switch state and action', (tester) async {
      final handle = tester.ensureSemantics();
      var value = false;

      await tester.pumpWidget(
        _testApp(
          StatefulBuilder(
            builder: (context, setState) {
              return SettingsEntry(
                label: 'Allow uploads',
                child: Switch(
                  value: value,
                  onChanged: (newValue) => setState(() => value = newValue),
                ),
              );
            },
          ),
        ),
      );

      var node = _semanticsNode('Allow uploads');
      expect(
        node,
        isSemantics(
          label: 'Allow uploads',
          hasToggledState: true,
          isToggled: false,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          hasFocusAction: true,
          hasTapAction: true,
        ),
      );

      tester.semantics.tap(find.semantics.byLabel('Allow uploads'));
      await tester.pump();

      expect(value, isTrue);
      node = _semanticsNode('Allow uploads');
      expect(node, isSemantics(hasToggledState: true, isToggled: true));
      handle.dispose();
    });

    testWidgets('combines a setting name with a button value and role', (tester) async {
      final handle = tester.ensureSemantics();
      var activations = 0;

      await tester.pumpWidget(
        _testApp(
          SettingsEntry(
            label: 'Language',
            child: TextButton(
              onPressed: () => activations++,
              child: const Text('English'),
            ),
          ),
        ),
      );

      final node = _semanticsNode('Language');
      expect(
        node,
        isSemantics(
          label: 'Language\nEnglish',
          isButton: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          hasFocusAction: true,
          hasTapAction: true,
        ),
      );

      tester.semantics.tap(find.semantics.byLabel('English'));
      await tester.pump();

      expect(activations, 1);
      handle.dispose();
    });

    testWidgets('keeps a text field label, current value, role, and actions together', (tester) async {
      final handle = tester.ensureSemantics();
      final controller = TextEditingController(text: '53317');

      await tester.pumpWidget(
        _testApp(
          SettingsEntry(
            label: 'Port',
            child: TextFormField(controller: controller),
          ),
        ),
      );

      expect(
        _semanticsNode('Port'),
        isSemantics(
          label: 'Port',
          value: '53317',
          isTextField: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          hasFocusAction: true,
          hasTapAction: true,
        ),
      );
      controller.dispose();
      handle.dispose();
    });

    testWidgets('announces an icon-only dropdown current value', (tester) async {
      final handle = tester.ensureSemantics();

      await tester.pumpWidget(
        _testApp(
          SettingsEntry(
            label: 'Device type',
            child: CustomDropdownButton<String>(
              value: 'mobile',
              items: const [
                DropdownMenuItem(
                  value: 'mobile',
                  child: Icon(Icons.smartphone, semanticLabel: 'mobile'),
                ),
              ],
              onChanged: (_) {},
            ),
          ),
        ),
      );

      expect(
        _semanticsNode('Device type\nmobile'),
        isSemantics(
          label: 'Device type\nmobile',
          isButton: true,
          isFocusable: true,
          hasExpandedState: true,
          isExpanded: false,
          hasFocusAction: true,
          hasTapAction: true,
        ),
      );
      handle.dispose();
    });

    testWidgets('preserves every action in a setting with multiple controls', (tester) async {
      final handle = tester.ensureSemantics();
      var starts = 0;
      var stops = 0;

      await tester.pumpWidget(
        _testApp(
          SettingsEntry(
            label: 'Server (offline)',
            mergeSemantics: false,
            child: Row(
              children: [
                IconButton(
                  tooltip: 'Start',
                  onPressed: () => starts++,
                  icon: const Icon(Icons.play_arrow, semanticLabel: 'Start'),
                ),
                IconButton(
                  tooltip: 'Stop',
                  onPressed: () => stops++,
                  icon: const Icon(Icons.stop, semanticLabel: 'Stop'),
                ),
              ],
            ),
          ),
        ),
      );

      final groupNode = _semanticsNode('Server (offline)');
      expect(groupNode, isSemantics(label: 'Server (offline)', hasTapAction: false));

      final startNode = _semanticsNode('Start');
      final stopNode = _semanticsNode('Stop');
      expect(startNode, isSemantics(label: 'Start', isButton: true, hasTapAction: true));
      expect(stopNode, isSemantics(label: 'Stop', isButton: true, hasTapAction: true));

      tester.semantics.tap(find.semantics.byLabel('Start'));
      tester.semantics.tap(find.semantics.byLabel('Stop'));
      await tester.pump();

      expect(starts, 1);
      expect(stops, 1);
      handle.dispose();
    });
  });

  group('LabeledCheckbox semantics', () {
    for (final labelFirst in [false, true]) {
      testWidgets('associates the label when labelFirst is $labelFirst', (tester) async {
        final handle = tester.ensureSemantics();
        bool? changedValue;

        await tester.pumpWidget(
          _testApp(
            LabeledCheckbox(
              label: 'Advanced settings',
              value: true,
              labelFirst: labelFirst,
              onChanged: (value) => changedValue = value,
            ),
          ),
        );

        final node = _semanticsNode('Advanced settings');
        expect(
          node,
          isSemantics(
            label: 'Advanced settings',
            hasCheckedState: true,
            isChecked: true,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true,
            hasFocusAction: true,
            hasTapAction: true,
          ),
        );

        tester.semantics.tap(find.semantics.byLabel('Advanced settings'));
        await tester.pump();

        expect(changedValue, isFalse);
        handle.dispose();
      });
    }
  });
}

SemanticsNode _semanticsNode(Pattern label) {
  return find.semantics.byLabel(label).evaluate().single;
}

Widget _testApp(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: child,
        ),
      ),
    ),
  );
}
