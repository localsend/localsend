import 'package:localsend_app/util/file_speed_helper.dart';
import 'package:test/test.dart';

void main() {
  group('getRemainingTime', () {
    test('shows seconds for duration less than 1 minute', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 30000), '0:30');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 45000), '0:45');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 5000), '0:05');
    });

    test('shows minutes and seconds for duration less than 1 hour', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 90000), '1:30');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 600000), '10:00');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 3540000), '59:00');
    });

    test('shows hours and minutes for duration 1 hour or more but less than 1 day', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 3600000), '1h 0m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 3660000), '1h 1m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 7200000), '2h 0m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 12000000), '3h 20m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 86340000), '23h 59m');
    });

    test('shows days, hours and minutes for duration 1 day or more', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 86400000), '1d 0h 0m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 90000000), '1d 1h 0m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 93660000), '1d 2h 1m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 172800000), '2d 0h 0m');
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 183780000), '2d 3h 3m');
    });

    test('handles zero remaining bytes', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 0), '0:00');
      expect(getRemainingTime(bytesPerSeconds: 0, remainingBytes: 0), '0:00');
    });

    test('handles zero speed with remaining bytes', () {
      expect(getRemainingTime(bytesPerSeconds: 0, remainingBytes: 1000), '∞');
      expect(getRemainingTime(bytesPerSeconds: 0, remainingBytes: 1000000), '∞');
    });

    test('handles edge cases', () {
      expect(getRemainingTime(bytesPerSeconds: 1000, remainingBytes: 1000), '0:01');
      expect(getRemainingTime(bytesPerSeconds: 1, remainingBytes: 1), '0:01');
    });
  });

  group('getFileSpeed', () {
    test('calculates bytes per second correctly', () {
      expect(getFileSpeed(start: 0, end: 1000, bytes: 1000), 1000);
      expect(getFileSpeed(start: 0, end: 2000, bytes: 4000), 2000);
      expect(getFileSpeed(start: 1000, end: 3000, bytes: 10000), 5000);
    });
  });
}
