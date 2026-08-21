import 'package:localsend_app/util/tailnet_address.dart';
import 'package:test/test.dart';

/// Mirrors the tests of `is_tailnet_address` in
/// `packages/core/src/tailscale/mod.rs`, so a drift between the two
/// classifiers shows up as a failing test on whichever side changed.
void main() {
  group('isTailnetAddress', () {
    test('recognises the ranges a tailnet assigns', () {
      expect(isTailnetAddress('100.64.0.0'), true, reason: 'the first address');
      expect(isTailnetAddress('100.90.62.40'), true);
      expect(isTailnetAddress('100.127.255.255'), true, reason: 'the last address');
      expect(isTailnetAddress('fd7a:115c:a1e0::d933:3e28'), true);
    });

    test('rejects addresses outside them', () {
      expect(isTailnetAddress('100.63.255.255'), false, reason: 'just below the range');
      expect(isTailnetAddress('100.128.0.0'), false, reason: 'just above the range');
      expect(isTailnetAddress('192.168.1.42'), false);
      expect(isTailnetAddress('127.0.0.1'), false);
      expect(isTailnetAddress('fd7a:115c:a1e1::1'), false, reason: 'a neighbouring /48');
      expect(isTailnetAddress('2001:db8::1'), false);
    });

    test('accepts a scoped address and rejects a host that is not one', () {
      expect(isTailnetAddress('fe80::1%3'), false, reason: 'a scoped link-local address must parse, not be mistaken for one');
      expect(isTailnetAddress('desktop.tail8182b8.ts.net'), false);
      expect(isTailnetAddress(''), false);
    });
  });
}
