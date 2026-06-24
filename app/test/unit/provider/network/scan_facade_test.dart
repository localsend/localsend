import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/provider/network/scan_facade.dart';

void main() {
  group('buildCrossSubnetScanPlan', () {
    test('includes neighbouring /24 subnets within depth', () {
      final plan = buildCrossSubnetScanPlan(
        localIps: ['192.168.73.15'],
        port: 53317,
        https: true,
        depth: 4,
        customRanges: const [],
      );

      final ips = plan.targets.map((target) => target.ip).toSet();
      expect(ips, contains('192.168.69.200'));
      expect(ips, contains('192.168.77.200'));
      expect(ips, isNot(contains('192.168.73.15')));
      expect(ips, isNot(contains('192.168.73.200')));
      expect(plan.truncated, isFalse);
    });

    test('expands custom cidr ranges and keeps protocol settings', () {
      final plan = buildCrossSubnetScanPlan(
        localIps: ['10.0.0.5'],
        port: 53317,
        https: false,
        depth: 0,
        customRanges: const ['192.168.64.0/30'],
      );

      expect(plan.targets.map((target) => target.ip), [
        '192.168.64.1',
        '192.168.64.2',
      ]);
      expect(plan.targets.every((target) => target.port == 53317), isTrue);
      expect(plan.targets.every((target) => !target.https), isTrue);
      expect(plan.truncated, isFalse);
    });

    test('marks large generated plans as truncated', () {
      final plan = buildCrossSubnetScanPlan(
        localIps: ['192.168.73.15'],
        port: 53317,
        https: true,
        depth: 4,
        customRanges: const [],
        maxHosts: 100,
      );

      expect(plan.targets.length, 100);
      expect(plan.truncated, isTrue);
    });
  });
}
