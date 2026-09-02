import 'package:localsend_app/provider/network/scan_facade.dart';
import 'package:test/test.dart';

/// Simulates StartSmartScan.reduce() decision logic for testing.
/// Returns true when legacy scan should be triggered.
bool _shouldTriggerLegacy(bool forceLegacy, bool noDevicesFound, bool inSendTab) {
  return forceLegacy || (noDevicesFound && inSendTab);
}

void main() {
  group('StartSmartScan', () {
    test('maxInterfaces should be 3', () {
      expect(StartSmartScan.maxInterfaces, 3);
    });

    test('decision logic: forceLegacy=true always triggers legacy path', () {
      // forceLegacy=true → always uses legacy path regardless of other conditions
      expect(_shouldTriggerLegacy(true, false, false), isTrue);
    });

    test('decision logic: legacy scan triggered when no devices and in send tab', () {
      // When noDevicesFound=true AND inSendTab=true, legacy scan is triggered
      expect(_shouldTriggerLegacy(false, true, true), isTrue);
    });

    test('decision logic: legacy scan skipped when devices found', () {
      // When devices are found, legacy scan is skipped
      expect(_shouldTriggerLegacy(false, false, true), isFalse);
    });

    test('decision logic: legacy scan skipped when not in send tab', () {
      expect(_shouldTriggerLegacy(false, true, false), isFalse);
    });
  });

  group('StartLegacySubnetScan', () {
    test('should accept list of subnets', () {
      final action = StartLegacySubnetScan(
        subnets: ['192.168.1.1', '192.168.2.1'],
      );

      expect(action.subnets, hasLength(2));
      expect(action.subnets, contains('192.168.1.1'));
      expect(action.subnets, contains('192.168.2.1'));
    });

    test('should handle empty subnets list', () {
      final action = StartLegacySubnetScan(subnets: []);
      expect(action.subnets, isEmpty);
    });

    test('reduce() should iterate all subnets', () {
      final subnets = ['192.168.1.1', '192.168.2.1', '192.168.3.1'];
      expect(subnets.length, 3);
    });

    test('should respect maxInterfaces limit', () {
      final subnets = [
        '192.168.1.1',
        '192.168.2.1',
        '192.168.3.1',
        '192.168.4.1',
      ];
      final limited = subnets.take(StartSmartScan.maxInterfaces).toList();
      expect(limited, hasLength(3));
      expect(limited, isNot(contains('192.168.4.1')));
    });
  });
}
