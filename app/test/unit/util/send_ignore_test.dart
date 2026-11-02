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

    group('isHiddenPath', () {
      test('detects a hidden file at the root', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHiddenPath('.DS_Store'), isTrue);
        expect(sendIgnore.isHiddenPath('.gitignore'), isTrue);
      });

      test('detects a hidden directory in the path', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHiddenPath('.ssh/id_rsa'), isTrue);
        expect(sendIgnore.isHiddenPath('folder/.ssh/id_rsa'), isTrue);
        expect(sendIgnore.isHiddenPath('folder/.hidden/file.txt'), isTrue);
      });

      test('detects a hidden directory in a nested path', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHiddenPath('sub/.git/config'), isTrue);
        expect(sendIgnore.isHiddenPath('sub/nested/.git/config'), isTrue);
        expect(sendIgnore.isHiddenPath('a/b/c/.hidden/d/e.txt'), isTrue);
      });

      test('detects a hidden component anywhere in the path', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHiddenPath('visible/.hidden/visible.txt'), isTrue);
        expect(sendIgnore.isHiddenPath('visible/visible/.hidden'), isTrue);
      });

      test('does not detect regular paths as hidden', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHiddenPath('file.txt'), isFalse);
        expect(sendIgnore.isHiddenPath('folder/file.txt'), isFalse);
        expect(sendIgnore.isHiddenPath('folder/nested/file.txt'), isFalse);
        expect(sendIgnore.isHiddenPath('file.with.dots.txt'), isFalse);
        expect(sendIgnore.isHiddenPath('a.b/c.d'), isFalse);
      });

      test('supports windows style separators', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHiddenPath('folder\\.ssh\\id_rsa'), isTrue);
        expect(sendIgnore.isHiddenPath('folder\\file.txt'), isFalse);
      });

      test('ignores empty path components', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHiddenPath(''), isFalse);
        expect(sendIgnore.isHiddenPath('/'), isFalse);
        expect(sendIgnore.isHiddenPath('//folder//file.txt'), isFalse);
        expect(sendIgnore.isHiddenPath('/folder//.ssh//id_rsa'), isTrue);
      });

      test('does not treat "." and ".." as hidden', () {
        final sendIgnore = SendIgnore();
        expect(sendIgnore.isHiddenPath('.'), isFalse);
        expect(sendIgnore.isHiddenPath('..'), isFalse);
        expect(sendIgnore.isHiddenPath('folder/./file.txt'), isFalse);
        expect(sendIgnore.isHiddenPath('folder/../file.txt'), isFalse);
      });
    });

    group('isHiddenFileInFolder', () {
      test('skips a hidden file inside the folder', () {
        final sendIgnore = SendIgnore();
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: 'Office', relativePath: 'Office/.DS_Store'),
          isTrue,
        );
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: 'Office', relativePath: 'Office/.gitignore'),
          isTrue,
        );
      });

      test('skips a file inside a hidden directory', () {
        final sendIgnore = SendIgnore();
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: 'Office', relativePath: 'Office/.ssh/id_rsa'),
          isTrue,
        );
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: 'Office', relativePath: 'Office/sub/.git/config'),
          isTrue,
        );
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: 'Office', relativePath: 'Office/.hidden/nested/deep.txt'),
          isTrue,
        );
      });

      test('keeps regular files inside the folder', () {
        final sendIgnore = SendIgnore();
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: 'Office', relativePath: 'Office/Test.pdf'),
          isFalse,
        );
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: 'Office', relativePath: 'Office/Office Lens/Test.pdf'),
          isFalse,
        );
      });

      test('does not treat the selected folder itself as hidden', () {
        final sendIgnore = SendIgnore();
        // The user selected this folder explicitly, so its content is sent.
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: '.config', relativePath: '.config/settings.json'),
          isFalse,
        );
      });

      test('still detects hidden content inside a hidden folder', () {
        final sendIgnore = SendIgnore();
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: '.config', relativePath: '.config/.git/config'),
          isTrue,
        );
      });

      test('works when the path does not start with the folder name', () {
        final sendIgnore = SendIgnore();
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: 'Office', relativePath: '.ssh/id_rsa'),
          isTrue,
        );
        expect(
          sendIgnore.isHiddenFileInFolder(folderName: 'Office', relativePath: 'Test.pdf'),
          isFalse,
        );
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
