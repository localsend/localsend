// SPDX-License-Identifier: Apache-2.0
// Regression tests for LocalSend rotation scheduling.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/widget/rotating_widget.dart';

Widget rotor({bool enabled = true, bool spinning = true}) => MaterialApp(
      home: TickerMode(
        enabled: enabled,
        child: RotatingWidget(
          duration: const Duration(seconds: 2),
          spinning: spinning,
          child: const Text('logo'),
        ),
      ),
    );

void main() {
  testWidgets('stopped rotor has no recurring frame or timer work', (tester) async {
    await tester.pumpWidget(rotor(spinning: false));
    await tester.pump(const Duration(seconds: 5));
    expect(tester.binding.transientCallbackCount, 0);
    expect(tester.binding.hasScheduledFrame, isFalse);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('TickerMode stops and restores the rotor', (tester) async {
    await tester.pumpWidget(rotor());
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.binding.transientCallbackCount, greaterThan(0));
    await tester.pumpWidget(rotor(enabled: false));
    await tester.pump(const Duration(seconds: 5));
    expect(tester.binding.transientCallbackCount, 0);
    expect(tester.binding.hasScheduledFrame, isFalse);
    await tester.pumpWidget(rotor());
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.binding.transientCallbackCount, greaterThan(0));
    await tester.pumpWidget(const SizedBox());
  });

}
