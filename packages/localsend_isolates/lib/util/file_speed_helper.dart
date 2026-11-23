import 'package:localsend_isolates/util/notification_strings.dart';

const _millisecondsPerSecond = 1000;
const _secondsPerMinute = 60;
const _secondsPerHour = 3600;

/// A transfer only becomes fast enough to measure after a while; the first chunks are not representative.
const _minBytesForSpeed = 500 * 1024;

/// The transfer speed in bytes per second, or null while it cannot be measured yet.
/// [endTime] is null while the transfer is running, then the current time is used.
int? measureSpeed({
  required int? startTime,
  required int? endTime,
  required int bytes,
}) {
  if (startTime == null || bytes < _minBytesForSpeed) {
    return null;
  }

  final end = endTime ?? DateTime.now().millisecondsSinceEpoch;
  if (end <= startTime) {
    // E.g. a file that fails right away (a rejected file name) counts as fully transferred
    // and ends the session in the millisecond it started.
    return null;
  }

  return (_millisecondsPerSecond * bytes) ~/ (end - startTime);
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
