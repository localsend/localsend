import 'package:localsend_app/model/local_interface_info.dart';
import 'package:localsend_app/util/two_direction_scanner.dart';
import 'package:test/test.dart';

void main() {
  group('buildWideQueues', () {
    test('in-subnet third octets come first then continue outward (/21 c=149)', () {
      final q = buildWideQueues(
        [const LocalInterfaceInfo(ip: '10.67.149.91', prefixLength: 21)],
        '241',
        exclude: {'10.67.149.241'},
      );
      // Subnet bounds for /21 from c=149 are [144, 151].
      // Down queue: in-subnet 148..144 first, then out-of-subnet 143..0.
      final expectedDown = <String>[
        for (var n = 148; n >= 144; n--) '10.67.$n.241',
        for (var n = 143; n >= 0; n--) '10.67.$n.241',
      ];
      // Up queue: in-subnet 150..151 first, then out-of-subnet 152..255.
      final expectedUp = <String>[
        for (var n = 150; n <= 151; n++) '10.67.$n.241',
        for (var n = 152; n <= 255; n++) '10.67.$n.241',
      ];
      expect(q.down, expectedDown);
      expect(q.up, expectedUp);
    });

    test('/24 produces only out-of-subnet candidates (entire wide scan is out)', () {
      final q = buildWideQueues(
        [const LocalInterfaceInfo(ip: '10.67.149.91', prefixLength: 24)],
        '241',
        exclude: {'10.67.149.241'},
      );
      expect(q.down.first, '10.67.148.241');
      expect(q.up.first, '10.67.150.241');
      expect(q.down.length, 149); // 148..0
      expect(q.up.length, 106); // 150..255
    });

    test('/16 keeps the full /16 outward spiral (no subnet narrowing)', () {
      final q = buildWideQueues(
        [const LocalInterfaceInfo(ip: '10.67.149.91', prefixLength: 16)],
        '241',
        exclude: {'10.67.149.241'},
      );
      expect(q.down.length, 149);
      expect(q.up.length, 106);
      expect(q.down.first, '10.67.148.241');
      expect(q.up.first, '10.67.150.241');
    });

    test('excludes pre-known narrow candidates from both queues', () {
      final q = buildWideQueues(
        [const LocalInterfaceInfo(ip: '10.67.149.91', prefixLength: 16)],
        '241',
        exclude: {'10.67.150.241', '10.67.148.241'},
      );
      expect(q.down, isNot(contains('10.67.148.241')));
      expect(q.up, isNot(contains('10.67.150.241')));
    });
  });

  group('subnetBoundsForThirdOctet', () {
    test('/16 covers the full third octet regardless of c', () {
      expect(subnetBoundsForThirdOctet(0, 16), (min: 0, max: 255));
      expect(subnetBoundsForThirdOctet(149, 16), (min: 0, max: 255));
    });

    test('/20 with c=149 spans 144..159', () {
      expect(subnetBoundsForThirdOctet(149, 20), (min: 144, max: 159));
    });

    test('/21 with c=149 spans 144..151', () {
      expect(subnetBoundsForThirdOctet(149, 21), (min: 144, max: 151));
    });

    test('/22 with c=149 spans 148..151', () {
      expect(subnetBoundsForThirdOctet(149, 22), (min: 148, max: 151));
    });

    test('/23 with c=149 spans 148..149', () {
      expect(subnetBoundsForThirdOctet(149, 23), (min: 148, max: 149));
    });

    test('/24 collapses to the single third octet c', () {
      expect(subnetBoundsForThirdOctet(149, 24), (min: 149, max: 149));
      expect(subnetBoundsForThirdOctet(0, 24), (min: 0, max: 0));
    });

    test('prefixes 25..32 still collapse to c (third-octet is fixed)', () {
      for (final p in [25, 26, 30, 32]) {
        expect(subnetBoundsForThirdOctet(149, p), (min: 149, max: 149));
      }
    });

    test('prefixes <=16 widen to full /16', () {
      expect(subnetBoundsForThirdOctet(149, 8), (min: 0, max: 255));
      expect(subnetBoundsForThirdOctet(149, 0), (min: 0, max: 255));
    });
  });

  group('allocateWorkers', () {
    test('proportional split with floor 1 on each side', () {
      final r = allocateWorkers(32, 149, 106);
      expect(r.down + r.up, 32);
      expect(r.down, greaterThanOrEqualTo(1));
      expect(r.up, greaterThanOrEqualTo(1));
      // For 149:106 the down side should get the majority.
      expect(r.down, greaterThan(r.up));
      // Expected ~19/13 by rounding.
      expect(r.down, 19);
      expect(r.up, 13);
    });

    test('extreme ratio still leaves one per side', () {
      final r = allocateWorkers(32, 254, 1);
      expect(r.down + r.up, 32);
      expect(r.up, 1);
      expect(r.down, 31);
    });

    test('empty side yields all workers to the other', () {
      final r = allocateWorkers(32, 0, 100);
      expect(r.down, 0);
      expect(r.up, 32);
    });

    test('both empty yields zero workers', () {
      expect(allocateWorkers(32, 0, 0), (down: 0, up: 0));
    });

    test('non-positive total clamps to zero', () {
      expect(allocateWorkers(0, 10, 10), (down: 0, up: 0));
    });
  });

  group('TwoDirectionScanner.popNext', () {
    test('serves own queue first then steals', () {
      final s = TwoDirectionScanner(down: ['a', 'b'], up: ['x', 'y']);
      expect(s.popNext(ScanDirection.down)?.ip, 'a');
      expect(s.popNext(ScanDirection.down)?.ip, 'b');
      final stolen = s.popNext(ScanDirection.down);
      expect(stolen?.ip, 'x');
      expect(stolen?.source, ScanDirection.up);
    });

    test('returns null when both queues are empty', () {
      final s = TwoDirectionScanner(down: ['a'], up: []);
      expect(s.popNext(ScanDirection.down)?.ip, 'a');
      expect(s.popNext(ScanDirection.down), isNull);
      expect(s.popNext(ScanDirection.up), isNull);
    });

    test('preserves order within a queue', () {
      final s = TwoDirectionScanner(down: ['148', '147', '146'], up: ['150', '151']);
      expect(s.popNext(ScanDirection.down)?.ip, '148');
      expect(s.popNext(ScanDirection.up)?.ip, '150');
      expect(s.popNext(ScanDirection.up)?.ip, '151');
      // up worker now steals from down.
      final stolen = s.popNext(ScanDirection.up);
      expect(stolen?.ip, '147');
      expect(stolen?.source, ScanDirection.down);
    });
  });

  group('TwoDirectionScanner.markDone', () {
    test('credits source direction even when item was stolen', () {
      final s = TwoDirectionScanner(down: ['a'], up: []);
      final item = s.popNext(ScanDirection.up); // up worker steals 'a' from down
      expect(item?.source, ScanDirection.down);
      s.markDone(item!);
      expect(s.downDone, 1);
      expect(s.upDone, 0);
    });
  });

  group('TwoDirectionScanner.etaFor', () {
    test('returns null before warmup completions', () {
      final s = TwoDirectionScanner(down: List.generate(100, (i) => '$i'), up: []);
      s.start();
      for (var i = 0; i < 4; i++) {
        s.markDone(s.popNext(ScanDirection.down)!);
      }
      expect(s.etaFor(ScanDirection.down), isNull);
    });

    test('returns positive duration after warmup', () async {
      final s = TwoDirectionScanner(down: List.generate(100, (i) => '$i'), up: []);
      s.start();
      await Future<void>.delayed(const Duration(milliseconds: 30));
      for (var i = 0; i < 5; i++) {
        s.markDone(s.popNext(ScanDirection.down)!);
      }
      final eta = s.etaFor(ScanDirection.down);
      expect(eta, isNotNull);
      expect(eta!.inMilliseconds, greaterThan(0));
    });

    test('returns null once the direction is fully drained', () {
      final s = TwoDirectionScanner(down: ['a', 'b'], up: []);
      s.start();
      for (var i = 0; i < 2; i++) {
        s.markDone(s.popNext(ScanDirection.down)!);
      }
      // Below warmup threshold and also fully drained — both reasons return null.
      expect(s.etaFor(ScanDirection.down), isNull);
    });

    test('uses injected now to make computation deterministic', () {
      final t0 = DateTime.utc(2026, 1, 1);
      final s = TwoDirectionScanner(down: List.generate(20, (i) => '$i'), up: []);
      s.start(at: t0);
      // 10 completions over a simulated 1 second → 10 remaining at the same
      // rate ≈ 1000ms.
      for (var i = 0; i < 10; i++) {
        s.markDone(s.popNext(ScanDirection.down)!);
      }
      final eta = s.etaFor(ScanDirection.down, now: t0.add(const Duration(seconds: 1)));
      expect(eta, isNotNull);
      expect(eta!.inMilliseconds, inInclusiveRange(900, 1100));
    });
  });
}
