import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/widget/rotating_widget.dart';

Widget _rotor({bool spinning = true, bool tickerEnabled = true}) {
  return MaterialApp(
    home: TickerMode(
      enabled: tickerEnabled,
      child: RotatingWidget(
        duration: const Duration(seconds: 1),
        spinning: spinning,
        child: const SizedBox(width: 10, height: 10),
      ),
    ),
  );
}

Matrix4 _transform(WidgetTester tester) {
  return tester.widget<Transform>(find.descendant(of: find.byType(RotatingWidget), matching: find.byType(Transform))).transform;
}

double _angle(WidgetTester tester) {
  final m = _transform(tester);
  return math.atan2(m.entry(1, 0), m.entry(0, 0));
}

Future<void> _dispose(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox());
  // let the pending tick finish
  await tester.pump(const Duration(milliseconds: 100));
}

void main() {
  testWidgets('leaves no timer behind when not spinning', (tester) async {
    await tester.pumpWidget(_rotor(spinning: false));
    await tester.pump(const Duration(seconds: 1));
    // no pump: fails if a timer is still pending
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('stops when spinning is turned off and starts again when turned on', (tester) async {
    await tester.pumpWidget(_rotor());
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pumpWidget(_rotor(spinning: false));
    await tester.pump(const Duration(milliseconds: 100));
    final stopped = _transform(tester);

    await tester.pump(const Duration(seconds: 1));
    expect(_transform(tester), stopped);

    await tester.pumpWidget(_rotor());
    await tester.pump(const Duration(milliseconds: 200));
    expect(_transform(tester), isNot(stopped));

    await _dispose(tester);
  });

  testWidgets('does not rotate while TickerMode is disabled', (tester) async {
    await tester.pumpWidget(_rotor(tickerEnabled: false));
    final start = _transform(tester);

    await tester.pump(const Duration(seconds: 1));
    expect(_transform(tester), start);

    await tester.pumpWidget(_rotor());
    await tester.pump(const Duration(milliseconds: 200));
    expect(_transform(tester), isNot(start));

    await _dispose(tester);
  });

  testWidgets('pauses while the app is hidden', (tester) async {
    addTearDown(() => tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed));
    await tester.pumpWidget(_rotor());
    await tester.pump(const Duration(milliseconds: 100));
    final before = _angle(tester);

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    await tester.binding.delayed(const Duration(milliseconds: 500)); // hidden: no frames
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    expect((_angle(tester) - before).abs(), lessThan(0.3)); // at most one tick

    await _dispose(tester);
  });
}
