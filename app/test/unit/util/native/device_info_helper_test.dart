import 'package:localsend_app/util/native/device_info_helper.dart';
import 'package:test/test.dart';

void main() {
  group('resolveIosDeviceName', () {
    test('returns user-assigned custom name when distinct from generic model', () {
      expect(
        resolveIosDeviceName(
          name: "John's iPhone",
          model: 'iPhone',
          localizedModel: 'iPhone',
          modelName: 'iPhone 16 Pro',
        ),
        "John's iPhone",
      );
    });

    test('falls back to modelName when iOS 16+ returns generic model name', () {
      expect(
        resolveIosDeviceName(
          name: 'iPhone',
          model: 'iPhone',
          localizedModel: 'iPhone',
          modelName: 'iPhone 16 Pro',
        ),
        'iPhone 16 Pro',
      );
    });

    test('falls back to modelName when name matches localizedModel', () {
      expect(
        resolveIosDeviceName(
          name: 'iPhone (Local)',
          model: 'iPhone',
          localizedModel: 'iPhone (Local)',
          modelName: 'iPhone 16 Pro',
        ),
        'iPhone 16 Pro',
      );
    });

    test('falls back to localizedModel when modelName is Unknown device', () {
      expect(
        resolveIosDeviceName(
          name: 'iPhone',
          model: 'iPhone',
          localizedModel: 'iPhone Localized',
          modelName: 'Unknown device',
        ),
        'iPhone Localized',
      );
    });

    test('falls back to model when modelName is Unknown device and localizedModel is empty', () {
      expect(
        resolveIosDeviceName(
          name: 'iPad',
          model: 'iPad',
          localizedModel: '   ',
          modelName: 'Unknown device',
        ),
        'iPad',
      );
    });

    test('returns null instead of empty string when all inputs are empty or whitespace', () {
      expect(
        resolveIosDeviceName(
          name: '   ',
          model: '',
          localizedModel: '\t',
          modelName: '  ',
        ),
        isNull,
      );
    });

    test('trims leading and trailing whitespace on custom name', () {
      expect(
        resolveIosDeviceName(
          name: "  John's iPhone  ",
          model: 'iPhone',
          localizedModel: 'iPhone',
          modelName: 'iPhone 16 Pro',
        ),
        "John's iPhone",
      );
    });

    test('trims leading and trailing whitespace on fallback modelName', () {
      expect(
        resolveIosDeviceName(
          name: ' iPhone ',
          model: 'iPhone',
          localizedModel: 'iPhone',
          modelName: '  iPhone 16 Pro  ',
        ),
        'iPhone 16 Pro',
      );
    });
  });
}
