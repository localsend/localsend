import 'package:localsend_app/gen/strings.g.dart';
import 'package:test/test.dart';

void main() {
  group('i18n', () {
    test('Should compile', () {
      // The following test will fail if the i18n file is either not compiled
      // or there are compile-time errors.
      expect(AppLocale.en.translations.general.accept, 'Accept');
    });
  });
}
