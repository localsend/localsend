import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/util/native/device_info_helper.dart';

void main() {
  // https://github.com/localsend/localsend/issues/3357
  //
  // The "use system name" shortcut read Platform.localHostname, which on
  // Android resolves to "localhost", so the alias became "localhost" instead of
  // the device name. cleanDeviceName is the guard that refuses such values, so
  // it is what stops the shortcut from writing a meaningless alias.

  group('cleanDeviceName', () {
    test('keeps a real device name', () {
      expect(cleanDeviceName('Pixel 8 Pro'), 'Pixel 8 Pro');
    });

    test('trims surrounding whitespace', () {
      expect(cleanDeviceName('  Galaxy S23\n'), 'Galaxy S23');
    });

    test('rejects localhost, which is what Android returned', () {
      expect(cleanDeviceName('localhost'), isNull);
      expect(cleanDeviceName('LOCALHOST'), isNull);
      expect(cleanDeviceName('LocalHost'), isNull);
    });

    test('rejects a loopback address', () {
      expect(cleanDeviceName('127.0.0.1'), isNull);
    });

    test('rejects "unknown"', () {
      expect(cleanDeviceName('unknown'), isNull);
    });

    test('rejects empty and whitespace-only values', () {
      expect(cleanDeviceName(''), isNull);
      expect(cleanDeviceName('   '), isNull);
      expect(cleanDeviceName(null), isNull);
    });

    test('rejects a scutil diagnostic line, which carries no name', () {
      // `scutil --get ComputerName` prints a message instead of a name when the
      // value is unset, and that line would otherwise become the alias.
      expect(cleanDeviceName('Computer Name is not set'), isNull);
      expect(cleanDeviceName('scutil: error: not a valid command'), isNull);
    });
  });
}
