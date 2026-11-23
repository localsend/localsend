import 'package:localsend_app/util/notification_strings.dart';
import 'package:localsend_isolates/util/file_speed_helper.dart';
import 'package:test/test.dart';

void main() {
  group('getRemainingTime', () {
    test('shows seconds for duration less than 1 minute', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 30000, strings: notificationStrings), '0:30');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 45000, strings: notificationStrings), '0:45');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 5000, strings: notificationStrings), '0:05');
    });

    test('shows minutes and seconds for duration less than 1 hour', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 90000, strings: notificationStrings), '1:30');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 600000, strings: notificationStrings), '10:00');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 3540000, strings: notificationStrings), '59:00');
    });

    test('shows hours and minutes for duration 1 hour or more', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 3600000, strings: notificationStrings), '1h');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 3660000, strings: notificationStrings), '1h 1m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 7200000, strings: notificationStrings), '2h');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 12000000, strings: notificationStrings), '3h 20m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 86340000, strings: notificationStrings), '23h 59m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 86400000, strings: notificationStrings), '24h');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 93660000, strings: notificationStrings), '26h 1m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 183780000, strings: notificationStrings), '51h 3m');
    });

    test('handles zero remaining bytes', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 0, strings: notificationStrings), '0:00');
      expect(getRemainingTime(bytesPerSeconds: 0, remainingBytes: 0, strings: notificationStrings), '0:00');
    });

    test('handles zero speed with remaining bytes', () {
      expect(getRemainingTime(bytesPerSeconds: 0, remainingBytes: 1000, strings: notificationStrings), '∞');
      expect(getRemainingTime(bytesPerSeconds: 0, remainingBytes: 1000000, strings: notificationStrings), '∞');
    });

    test('handles edge cases', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 1000, strings: notificationStrings), '0:01');
      expect(getRemainingTime(bytesPerSeconds: 1, remainingBytes: 1, strings: notificationStrings), '0:01');
    });
  });

  group('measureSpeed', () {
    test('calculates bytes per second correctly', () {
      expect(measureSpeed(startTime: 0, endTime: 1000, bytes: 1000000), 1000000);
      expect(measureSpeed(startTime: 0, endTime: 2000, bytes: 4000000), 2000000);
      expect(measureSpeed(startTime: 1000, endTime: 3000, bytes: 10000000), 5000000);
    });

    test('returns null before the transfer started', () {
      expect(measureSpeed(startTime: null, endTime: null, bytes: 1000000), null);
    });

    test('returns null below 500 KB', () {
      expect(measureSpeed(startTime: 0, endTime: 1000, bytes: 500 * 1024 - 1), null);
      expect(measureSpeed(startTime: 0, endTime: 1000, bytes: 500 * 1024), 512000);
    });

    test('returns null when the transfer ended in the millisecond it started', () {
      expect(measureSpeed(startTime: 1000, endTime: 1000, bytes: 20000000), null);
    });

    test('uses the current time while the transfer is running', () {
      final startTime = DateTime.now().millisecondsSinceEpoch - 10000;
      expect(measureSpeed(startTime: startTime, endTime: null, bytes: 10000000), inInclusiveRange(900000, 1000000));
    });
  });
}
