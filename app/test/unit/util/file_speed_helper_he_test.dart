import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/i18n.dart';
import 'package:localsend_app/util/notification_strings.dart';
import 'package:localsend_isolates/util/file_speed_helper.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() async {
    await initI18n();
    LocaleSettings.setLocaleSync(AppLocale.he);
  });

  const cases = [
    (Duration(minutes: 10, seconds: 54), '10:54'),
    (Duration(hours: 1), 'שעה'),
    (Duration(hours: 1, minutes: 1), 'שעה ודקה'),
    (Duration(hours: 2, minutes: 2), 'שעתיים ו־2 דקות'),
    (Duration(hours: 1, minutes: 5), 'שעה ו־5 דקות'),
    (Duration(days: 1), '24 שעות'),
    (Duration(days: 1, hours: 2, minutes: 5), '26 שעות ו־5 דקות'),
    (Duration(hours: 1, minutes: 5, seconds: 9), 'שעה ו־5 דקות'),
  ];

  for (final (duration, expected) in cases) {
    test('$duration → $expected', () {
      expect(
        getRemainingTime(
          bytesPerSeconds: 1000,
          remainingBytes: duration.inMilliseconds,
          strings: notificationStrings,
        ),
        expected,
      );
    });
  }
}
