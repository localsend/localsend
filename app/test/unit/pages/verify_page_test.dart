import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/pages/verify_page.dart';

void main() {
  testWidgets('VerifyWidget maintains LTR icon order under RTL environment', (tester) async {
    final fingerprint = CombinedFingerprint(
      combined: 'test-fingerprint',
      icons: [Icons.home, Icons.star, Icons.person, Icons.phone],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Directionality(
          textDirection: TextDirection.rtl, // Simulate RTL locale
          child: Scaffold(
            body: VerifyWidget(
              mode: VerifyMode.icons,
              fingerprint: fingerprint,
            ),
          ),
        ),
      ),
    );

    // Verify first icon (home) is physically to the left of the second icon (star)
    final homeOffset = tester.getTopLeft(find.byIcon(Icons.home));
    final starOffset = tester.getTopLeft(find.byIcon(Icons.star));

    expect(homeOffset.dx < starOffset.dx, isTrue);
  });

  testWidgets('VerifyWidget maintains LTR text direction for hash under RTL environment', (tester) async {
    final fingerprint = CombinedFingerprint(
      combined: 'test-fingerprint',
      icons: [Icons.home, Icons.star, Icons.person, Icons.phone],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: VerifyWidget(
              mode: VerifyMode.text,
              fingerprint: fingerprint,
            ),
          ),
        ),
      ),
    );

    expect(find.text('test-fingerprint'), findsOneWidget);
    final textWidget = tester.widget<SelectableText>(find.byType(SelectableText));
    expect(textWidget.data, 'test-fingerprint');
  });
}
