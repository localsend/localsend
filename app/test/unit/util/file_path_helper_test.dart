import 'dart:io';

import 'package:localsend_isolates/util/file_path_helper.dart';
import 'package:test/test.dart';

void main() {
  test('rename a file without an extension does not add a trailing dot', () {
    expect('README'.withFileNameKeepExtension('renamed'), 'renamed');
  });

  test('rename a file preserves its extension', () {
    expect('photo.jpg'.withFileNameKeepExtension('renamed'), 'renamed.jpg');
  });

  test('fileName with counter', () async {
    expect('myFile'.withCount(1), 'myFile (1)');
    expect('myFile (1)'.withCount(2), 'myFile (2)');
  });

  // https://github.com/localsend/localsend/issues/3499
  group('isExistingLocalPath', () {
    late Directory dir;
    late File file;

    setUp(() {
      dir = Directory.systemTemp.createTempSync('localsend_clip_test');
      file = File('${dir.path}/note.txt')..writeAsStringSync('x');
    });

    tearDown(() => dir.deleteSync(recursive: true));

    test('accepts the path of an existing file', () {
      expect(isExistingLocalPath(file.path), isTrue);
    });

    test('accepts the path of an existing directory', () {
      expect(isExistingLocalPath(dir.path), isTrue);
    });

    test('tolerates surrounding whitespace', () {
      expect(isExistingLocalPath('  ${file.path}\n'), isTrue);
    });

    test('tolerates shell-style quotes', () {
      expect(isExistingLocalPath('"${file.path}"'), isTrue);
      expect(isExistingLocalPath("'${file.path}'"), isTrue);
    });

    test('rejects a path that does not exist', () {
      expect(isExistingLocalPath('${dir.path}/missing.txt'), isFalse);
    });

    test('rejects ordinary text', () {
      expect(isExistingLocalPath('hello world'), isFalse);
      expect(isExistingLocalPath('some longer sentence of text'), isFalse);
    });

    test('rejects a multi-line block of text', () {
      expect(isExistingLocalPath('${file.path}\n${file.path}'), isFalse);
    });

    test('rejects an empty or null value', () {
      expect(isExistingLocalPath(null), isFalse);
      expect(isExistingLocalPath(''), isFalse);
      expect(isExistingLocalPath('   '), isFalse);
    });

    test('rejects a URI', () {
      expect(isExistingLocalPath('file://${file.path}'), isFalse);
      expect(isExistingLocalPath('https://example.com/a.txt'), isFalse);
    });

    test('does not treat an empty quoted string as a path', () {
      expect(isExistingLocalPath('""'), isFalse);
    });

    test('rejects a string containing a NUL', () {
      expect(isExistingLocalPath('${file.path}\u0000'), isFalse);
    });
  });
}
