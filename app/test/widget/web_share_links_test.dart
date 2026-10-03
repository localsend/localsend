import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/widget/web_share_links.dart';

void main() {
  const urls = ['http://192.168.1.2:53317', 'http://192.168.100.222:53317'];

  Widget app({required double width, required double scale, required List<WebShareLink> links, TextDirection direction = TextDirection.ltr}) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: width,
            child: Directionality(
              textDirection: direction,
              child: MediaQuery(
                data: MediaQueryData(textScaler: TextScaler.linear(scale)),
                child: WebShareLinks(links: links, style: const TextStyle(fontSize: 14)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<WebShareLink> links([VoidCallback? onCopy, VoidCallback? onQr, VoidCallback? onZoom]) => [
    for (final url in urls) WebShareLink(url: url, onCopy: onCopy ?? () {}, onQr: onQr ?? () {}, onZoom: onZoom ?? () {}),
  ];

  testWidgets('actions share visible spacing and stay within the available width', (tester) async {
    for (final width in [600.0, 800.0]) {
      await tester.pumpWidget(app(width: width, scale: 1, links: links()));
      expect(tester.takeException(), isNull);

      final icons = tester.widgetList<Icon>(find.byType(Icon)).toList();
      expect(icons.length, 6);
      final iconRects = [for (final element in find.byType(Icon).evaluate()) tester.getRect(find.byWidget(element.widget))];
      final taps = [for (final element in find.byType(InkWell).evaluate()) tester.getRect(find.byWidget(element.widget))];
      final textRects = [for (final element in find.byType(SelectableText).evaluate()) tester.getRect(find.byWidget(element.widget))];
      final container = tester.getRect(find.byType(WebShareLinks));

      for (var row = 0; row < 2; row++) {
        final first = row * 3;
        expect(iconRects[first].left, greaterThan(textRects[row].right));
        expect(iconRects[first + 2].right, lessThanOrEqualTo(container.right));
        for (var action = 0; action < 2; action++) {
          final gap = iconRects[first + action + 1].left - iconRects[first + action].right;
          expect(gap, inInclusiveRange(2, 4));
          expect(taps[first + action].right, lessThanOrEqualTo(taps[first + action + 1].left));
        }
      }
      expect(iconRects[1].left - iconRects[0].right, closeTo(iconRects[4].left - iconRects[3].right, 0.01));
      expect(iconRects[0].left, lessThan(iconRects[3].left));
    }
  });

  testWidgets('a longer URL wraps its actions while a shorter one stays inline', (tester) async {
    await tester.pumpWidget(app(width: 450, scale: 1, links: links()));
    expect(tester.takeException(), isNull);

    final icons = [for (final element in find.byType(Icon).evaluate()) tester.getRect(find.byWidget(element.widget))];
    final texts = [for (final element in find.byType(SelectableText).evaluate()) tester.getRect(find.byWidget(element.widget))];
    expect(icons[0].top, lessThan(texts[0].bottom));
    expect(icons[3].top, greaterThanOrEqualTo(texts[1].bottom));
  });

  testWidgets('spacing grows with available width and stops at the maximum', (tester) async {
    await tester.pumpWidget(app(width: 600, scale: 1, links: links()));
    final widestUrl = tester.getSize(find.byType(SelectableText).last).width + 10;

    for (final gap in [2.0, 3.0, 4.0, 20.0]) {
      await tester.pumpWidget(app(width: widestUrl + 5 + 3 * (16 + gap), scale: 1, links: links()));
      expect(tester.takeException(), isNull);
      final icons = find.byType(Icon);
      final expectedGap = gap.clamp(2, 4);
      for (final first in [0, 3]) {
        expect(tester.getRect(icons.at(first + 1)).left - tester.getRect(icons.at(first)).right, closeTo(expectedGap, 0.01));
      }
    }
  });

  testWidgets('long URLs keep action groups accessible when text is enlarged', (tester) async {
    for (final scale in [1.0, 1.5, 2.0]) {
      for (final width in [200.0, 300.0, 400.0, 600.0]) {
        await tester.pumpWidget(app(width: width, scale: scale, links: links()));
        expect(tester.takeException(), isNull);

        final icons = [for (final element in find.byType(Icon).evaluate()) tester.getRect(find.byWidget(element.widget))];
        final taps = [for (final element in find.byType(InkWell).evaluate()) tester.getRect(find.byWidget(element.widget))];
        final texts = [for (final element in find.byType(SelectableText).evaluate()) tester.getRect(find.byWidget(element.widget))];
        final container = tester.getRect(find.byType(WebShareLinks));
        for (var row = 0; row < 2; row++) {
          final first = row * 3;
          expect(icons[first].top >= texts[row].bottom || icons[first].left >= texts[row].right, isTrue);
          for (var action = 0; action < 3; action++) {
            final rect = icons[first + action];
            expect(rect.left, greaterThanOrEqualTo(container.left));
            expect(rect.right, lessThanOrEqualTo(container.right));
            expect(taps[first + action].left, greaterThanOrEqualTo(container.left));
            expect(taps[first + action].right, lessThanOrEqualTo(container.right));
          }
        }
      }
    }
  });

  testWidgets('all actions work and remain separate in RTL', (tester) async {
    final pressed = <String>[];
    for (final width in [600.0, 200.0]) {
      pressed.clear();
      await tester.pumpWidget(
        app(
          width: width,
          scale: 1,
          direction: TextDirection.rtl,
          links: links(() => pressed.add('copy'), () => pressed.add('qr'), () => pressed.add('zoom')),
        ),
      );
      expect(tester.takeException(), isNull);

      final icons = find.byType(Icon);
      final taps = find.byType(InkWell);
      for (var action = 0; action < 3; action++) {
        await tester.tap(taps.at(action));
      }
      expect(pressed, ['copy', 'qr', 'zoom']);
      final container = tester.getRect(find.byType(WebShareLinks));
      final rects = [for (var i = 0; i < 3; i++) tester.getRect(icons.at(i))];
      expect(rects[0].right, lessThanOrEqualTo(container.right));
      expect(rects[0].left, greaterThan(rects[1].right));
      expect(rects[1].left, greaterThan(rects[2].right));
      expect(rects[2].left, greaterThanOrEqualTo(container.left));
    }
  });
}
