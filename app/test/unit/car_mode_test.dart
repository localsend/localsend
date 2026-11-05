import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/widget/car_mode_scope.dart';
import 'package:localsend_app/widget/responsive_builder.dart';

void main() {
  group('resolveCarMode', () {
    test('detects a wide Android landscape screen automatically', () {
      expect(resolveCarMode(override: null, size: const Size(1707, 960), isAndroid: true), isTrue);
      expect(resolveCarMode(override: null, size: const Size(2560, 1440), isAndroid: true), isTrue);
    });

    test('keeps desktop and phone layouts unchanged', () {
      expect(resolveCarMode(override: null, size: const Size(1707, 960), isAndroid: false), isFalse);
      expect(resolveCarMode(override: null, size: const Size(900, 500), isAndroid: true), isFalse);
      expect(resolveCarMode(override: null, size: const Size(360, 780), isAndroid: true), isFalse);
    });

    test('follows the user preference', () {
      expect(resolveCarMode(override: false, size: const Size(2560, 1440), isAndroid: true), isFalse);
      expect(resolveCarMode(override: true, size: const Size(360, 780), isAndroid: true), isTrue);
    });
  });

  group('SizingInformation', () {
    test('content width follows the screen profile', () {
      expect(SizingInformation(400).contentMaxWidth, SizingInformation.mobileContentWidth);
      expect(SizingInformation(820).contentMaxWidth, SizingInformation.desktopContentWidth);
      expect(SizingInformation(1300).contentMaxWidth, SizingInformation.wideContentWidth);
      expect(SizingInformation(1707, carMode: true).contentMaxWidth, SizingInformation.carContentWidth);
    });

    test('car mode needs a screen wider than a phone', () {
      expect(SizingInformation(400, carMode: true).isCar, isFalse);
      expect(SizingInformation(700, carMode: true).isCar, isTrue);
    });
  });
}
