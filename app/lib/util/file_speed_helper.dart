import 'package:localsend_app/gen/strings.g.dart';

const _millisecondsPerSecond = 1000;
const _secondsPerMinute = 60;
const _secondsPerHour = 3600;
const _secondsPerDay = 86400;

int getFileSpeed({
  required int start,
  required int end,
  required int bytes,
}) {
  final deltaTime = end - start;
  return (_millisecondsPerSecond * bytes) ~/ deltaTime;
}

String getRemainingTime({
  required int bytesPerSeconds,
  required int remainingBytes,
}) {
  if (bytesPerSeconds == 0) {
    return remainingBytes == 0 ? t.progressPage.remainingTime.seconds(n: 0, ss: '00') : '∞';
  }

  final remainingTimeInSeconds = _getRemainingTime(bytesPerSeconds: bytesPerSeconds, remainingBytes: remainingBytes);

  if (remainingTimeInSeconds < _secondsPerMinute) {
    return t.progressPage.remainingTime.seconds(n: 0, ss: remainingTimeInSeconds.toString().padLeft(2, '0'));
  } else if (remainingTimeInSeconds < _secondsPerHour) {
    final minutes = remainingTimeInSeconds ~/ _secondsPerMinute;
    final seconds = remainingTimeInSeconds % _secondsPerMinute;
    return t.progressPage.remainingTime.minutes(n: minutes, ss: seconds.toString().padLeft(2, '0'));
  } else if (remainingTimeInSeconds < _secondsPerDay) {
    final hours = remainingTimeInSeconds ~/ _secondsPerHour;
    final minutes = (remainingTimeInSeconds % _secondsPerHour) ~/ _secondsPerMinute;
    return t.progressPage.remainingTime.hours(h: hours, m: minutes);
  } else {
    final days = remainingTimeInSeconds ~/ _secondsPerDay;
    final remainingAfterDays = remainingTimeInSeconds % _secondsPerDay;
    final hours = remainingAfterDays ~/ _secondsPerHour;
    final minutes = (remainingAfterDays % _secondsPerHour) ~/ _secondsPerMinute;
    return t.progressPage.remainingTime.days(d: days, h: hours, m: minutes);
  }
}

int _getRemainingTime({
  required int bytesPerSeconds,
  required int remainingBytes,
}) {
  return remainingBytes ~/ bytesPerSeconds;
}
