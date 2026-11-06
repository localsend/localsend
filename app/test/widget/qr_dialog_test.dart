import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/widget/dialogs/qr_dialog.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

void main() {
  Future<void> pumpQr(WidgetTester tester, {required Brightness brightness}) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: brightness),
        home: const Scaffold(
          body: QrDialog(data: 'https://localsend.org', label: 'test-label'),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  void expectStandardQrColors(WidgetTester tester) {
    final bg = tester.widget<ColoredBox>(find.byKey(const ValueKey('qr-standard-background')));
    expect(bg.color, Colors.white);

    final qr = tester.widget<PrettyQrView>(find.byType(PrettyQrView));
    final decoration = qr.decoration;
    expect(decoration, isNotNull);
    final shape = decoration!.shape;
    expect(shape, isA<PrettyQrSmoothSymbol>());
    expect((shape as PrettyQrSmoothSymbol).color, Colors.black);
  }

  testWidgets('QR stays black on white in dark mode', (tester) async {
    await pumpQr(tester, brightness: Brightness.dark);
    expectStandardQrColors(tester);
  });

  testWidgets('QR stays black on white in light mode', (tester) async {
    await pumpQr(tester, brightness: Brightness.light);
    expectStandardQrColors(tester);
  });
}
