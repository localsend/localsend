import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/util/native/tray_helper.dart';

void main() {
  // https://github.com/localsend/localsend/issues/3312
  //
  // The Linux tray icon was hardcoded to the white asset, which is invisible on
  // a light panel. Both assets exist, so the choice follows the brightness.

  group('trayIconForBrightness', () {
    test('uses the white icon on a dark panel', () {
      expect(
        trayIconForBrightness(Brightness.dark).path,
        endsWith('logo-32-white.png'),
      );
    });

    test('uses the black icon on a light panel', () {
      expect(
        trayIconForBrightness(Brightness.light).path,
        endsWith('logo-32-black.png'),
      );
    });
  });
}
