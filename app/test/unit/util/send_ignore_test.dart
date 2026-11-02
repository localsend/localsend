import 'package:localsend_app/util/send_ignore.dart';
import 'package:test/test.dart';

void main() {
  group('SendIgnore', () {
    group('isHidden', () {
      test('detects hidden files', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHidden('.DS_Store'), isTrue);
        expect(sendIgnore.isHidden('.ssh'), isTrue);
        expect(sendIgnore.isHidden('.gitignore'), isTrue);
      });

      test('does not detect regular files as hidden', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHidden('normal.txt'), isFalse);
        expect(sendIgnore.isHidden('file.with.dots.txt'), isFalse);
        expect(sendIgnore.isHidden('a.b'), isFalse);
        expect(sendIgnore.isHidden(''), isFalse);
      });

      test('does not treat "." and ".." as hidden', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHidden('.'), isFalse);
        expect(sendIgnore.isHidden('..'), isFalse);
      });
    });

    group('isIgnoreFile', () {
      test('does not treat any file as an ignore file (yet)', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isIgnoreFile('.sendignore'), isFalse);
      });
    });
  });
}
