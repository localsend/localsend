// Protocol v2 lets a sender put directory components in a file name, for
// folder transfers. The sender is untrusted, so those components must not be
// able to leave the destination directory, and must be sanitized like the base
// name is.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:localsend_isolates/src/task/server/file_saver.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late Directory destination;

  setUpAll(() {
    RustLib.initMock(api: _MockRustLibApi());
  });

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('file_saver_traversal');
    destination = Directory(p.join(tempDir.path, 'downloads'))..createSync();
  });

  tearDown(() {
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  Future<String> digest(String fileName) async {
    final (path, _, _) = await digestFilePathAndPrepareDirectory(
      parentDirectory: destination.path,
      fileName: fileName,
      createdDirectories: {},
    );
    return path;
  }

  /// Names that must not produce a destination outside of the download
  /// directory. Rejecting them is the expected outcome; the test also asserts
  /// that nothing was created outside, in case one is ever accepted.
  const escaping = [
    '../escaped.txt',
    '../outside/escaped.txt',
    '../../escaped.txt',
    'sub/../../escaped.txt',
    'sub/../sub2/file.txt',
    '..',
    '/etc/passwd',
    '//tmp/absolute.txt',
  ];

  for (final fileName in escaping) {
    test('rejects ${jsonish(fileName)}', () async {
      await expectLater(digest(fileName), throwsA('Path traversal detected'));

      expect(
        Directory(tempDir.path).listSync().map((e) => p.basename(e.path)),
        ['downloads'],
        reason: 'nothing may be created next to the destination',
      );
    });
  }

  test('keeps a plain name', () async {
    expect(await digest('file.txt'), p.join(destination.path, 'file.txt'));
  });

  test('keeps the directories of a folder transfer', () async {
    expect(
      await digest('outer/inner/file.txt'),
      p.join(destination.path, 'outer', 'inner', 'file.txt'),
    );
  });

  /// `.` addresses the directory it sits in, so it is dropped rather than
  /// treated as an attempt to escape.
  test('accepts a name with a "." component', () async {
    expect(await digest('./file.txt'), p.join(destination.path, 'file.txt'));
    expect(await digest('a/./b/file.txt'), p.join(destination.path, 'a', 'b', 'file.txt'));
  });

  /// An empty name used to reach `take(-1)` and fail with a `RangeError`.
  test('falls back to a placeholder for an empty name', () async {
    expect(await digest(''), p.join(destination.path, 'untitled'));
    expect(await digest('.'), p.join(destination.path, 'untitled'));
  });

  /// Only the base name used to be sanitized, so a directory could carry
  /// characters the file system rejects.
  test('sanitizes the directory components too', () async {
    expect(
      await digest('sub\u0000dir/file.txt'),
      p.join(destination.path, 'sub_dir', 'file.txt'),
    );
  });
}

String jsonish(String value) => value.isEmpty ? '<empty>' : value.replaceAll('\u0000', r'\0');

/// Mirrors `localsend::util::filename::sanitize` under `Rules::Posix`; the
/// real one lives in the Rust library, which is not loaded in unit tests.
class _MockRustLibApi implements RustLibApi {
  @override
  String crateApiFilenameSanitizeFileName({required String name}) {
    var result = name.split('').map((c) {
      final code = c.codeUnitAt(0);
      final isControl = code < 0x20 || code == 0x7f;
      return (c == '/' || isControl) ? '_' : c;
    }).join();

    if (result.length > 255) {
      result = result.substring(0, 255);
    }
    if (result.isEmpty || result == '.' || result == '..') {
      result = 'untitled';
    }
    return result;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnsupportedError('Not mocked: ${invocation.memberName}');
}
