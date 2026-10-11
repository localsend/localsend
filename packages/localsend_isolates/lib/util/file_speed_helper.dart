import 'package:localsend_isolates/util/notification_strings.dart';

const _millisecondsPerSecond = 1000;
const _secondsPerMinute = 60;
const _secondsPerHour = 3600;

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
  required NotificationStrings strings,
}) {
  if (bytesPerSeconds == 0) {
    return remainingBytes == 0 ? strings.remainingTimeMinutes(m: 0, ss: '00') : '∞';
  }

  final remainingTimeInSeconds = _getRemainingTime(bytesPerSeconds: bytesPerSeconds, remainingBytes: remainingBytes);

  if (remainingTimeInSeconds < _secondsPerHour) {
    final minutes = remainingTimeInSeconds ~/ _secondsPerMinute;
    final seconds = remainingTimeInSeconds % _secondsPerMinute;
    return strings.remainingTimeMinutes(m: minutes, ss: seconds.toString().padLeft(2, '0'));
  } else {
    final hours = remainingTimeInSeconds ~/ _secondsPerHour;
    final minutes = (remainingTimeInSeconds % _secondsPerHour) ~/ _secondsPerMinute;
    return strings.remainingTimeLong(h: hours, m: minutes);
  }
}

int _getRemainingTime({
  required int bytesPerSeconds,
  required int remainingBytes,
}) {
  return remainingBytes ~/ bytesPerSeconds;
}
