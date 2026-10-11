import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_isolates/util/notification_strings.dart';

/// The translations that `localsend_isolates` needs, taken from the current locale.
///
/// Lazy, so it resolves after the locale has been applied in `preInit`. The locale is pinned on
/// app start, so binding the translation members once is enough.
final notificationStrings = NotificationStrings(
  titleReceiving: t.progressPage.titleReceiving,
  titleSending: t.progressPage.titleSending,
  remainingTimeMinutes: t.progressPage.remainingTime.minutes,
  remainingTimeLong: _remainingTimeLong,
);

String _remainingTimeLong({required num h, required num m}) {
  final remainingTime = t.progressPage.remainingTime;
  if (m == 0) {
    return remainingTime.hoursUnit(h: h);
  }
  return remainingTime.hours(h: h, m: m);
}
