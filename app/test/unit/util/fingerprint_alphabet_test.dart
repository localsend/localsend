import 'dart:math';

import 'package:localsend_app/util/fingerprint_alphabet.dart';
import 'package:test/test.dart';

void main() {
  group('iconAlphabet', () {
    test('no two icons share a glyph', () {
      // Different names can point to the same glyph (e.g. Icons.local_dining and Icons.local_restaurant).
      final byCodePoint = <int, int>{};
      for (final icon in iconAlphabet) {
        byCodePoint.update(icon.codePoint, (count) => count + 1, ifAbsent: () => 1);
      }
      final duplicates = byCodePoint.entries.where((e) => e.value > 1).map((e) => '0x${e.key.toRadixString(16)}').toList();
      expect(duplicates, isEmpty, reason: 'duplicate glyphs: ${duplicates.join(', ')}');
    });
  });

  group('fingerprintToIcons', () {
    test('renders 16 icons', () {
      expect(fingerprintToIcons('A1B2C3' * 20).length, 16);
    });

    test('is deterministic and input-sensitive', () {
      expect(fingerprintToIcons('ABC'), fingerprintToIcons('ABC'));
      expect(fingerprintToIcons('ABC'), isNot(fingerprintToIcons('ABD')));
    });
  });

  group('convertFingerprintToAlphabet', () {
    test('converts hex to a hex alphabet', () {
      final alphabet = '0123456789ABCDEF'.split('');
      expect(
        convertFingerprintToAlphabet(fingerprint: 'A1B2C3', alphabet: alphabet),
        ['A', '1', 'B', '2', 'C', '3'],
      );
    });

    test('preserves leading zeros', () {
      final alphabet = '0123456789ABCDEF'.split('');
      expect(
        convertFingerprintToAlphabet(fingerprint: '00FF', alphabet: alphabet),
        ['0', '0', 'F', 'F'],
      );
    });

    test('converts to a smaller alphabet', () {
      expect(
        convertFingerprintToAlphabet(fingerprint: 'F', alphabet: [0, 1]),
        [1, 1, 1, 1],
      );
    });

    test('has a fixed length for a non-power-of-two alphabet', () {
      final alphabet = List.generate(10, (i) => i);
      // 64 hex chars = 256 bits, ceil(256 / log2(10)) = 78
      expect(
        convertFingerprintToAlphabet(fingerprint: 'F' * 64, alphabet: alphabet).length,
        78,
      );
      expect(
        convertFingerprintToAlphabet(fingerprint: '0' * 64, alphabet: alphabet).length,
        78,
      );
    });

    test('round-trips for any alphabet size', () {
      const fingerprint = 'A1B2C3D4E5F60718293A4B5C6D7E8F90';
      for (var size = 2; size <= 100; size++) {
        final alphabet = List.generate(size, (i) => i);
        final digits = convertFingerprintToAlphabet(fingerprint: fingerprint, alphabet: alphabet);
        final value = digits.fold(BigInt.zero, (acc, d) => acc * BigInt.from(size) + BigInt.from(d));
        expect(value, BigInt.parse(fingerprint, radix: 16));
        expect(digits.length, (fingerprint.length * 4 * log(2) / log(size)).ceil());
      }
    });
  });
}
