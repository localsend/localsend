import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:localsend_isolates/src/task/server/file_saver.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;

  setUpAll(() {
    RustLib.initMock(api: _MockRustLibApi());
  });

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('file_saver_test');
  });

  tearDown(() {
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  Future<String> digest(String parentDirectory, String fileName) async {
    final (path, _, _) = await digestFilePathAndPrepareDirectory(
      parentDirectory: parentDirectory,
      fileName: fileName,
      createdDirectories: {},
    );
    return path;
  }

  test('creates the destination directory when it does not exist', () async {
    final destination = p.join(tempDir.path, 'gone');
    final path = await digest(destination, 'file.txt');

    expect(Directory(destination).existsSync(), isTrue);
    expect(path, p.join(destination, 'file.txt'));
  });

  test('creates the sub-directories of a folder transfer', () async {
    final path = await digest(tempDir.path, p.join('outer', 'inner', 'file.txt'));

    expect(Directory(p.join(tempDir.path, 'outer', 'inner')).existsSync(), isTrue);
    expect(path, p.join(tempDir.path, 'outer', 'inner', 'file.txt'));
  });

  test('keeps an existing directory and its content', () async {
    File(p.join(tempDir.path, 'file.txt')).writeAsStringSync('hello');

    final path = await digest(tempDir.path, 'file.txt');

    expect(path, p.join(tempDir.path, 'file (2).txt'));
    expect(File(p.join(tempDir.path, 'file.txt')).readAsStringSync(), 'hello');
  });

  test('still rejects path traversal', () async {
    await expectLater(
      digest(tempDir.path, p.join('..', 'escaped', 'file.txt')),
      throwsA('Path traversal detected'),
    );
  });
}

/// The sanitizer lives in the Rust library, which is not loaded in unit tests.
class _MockRustLibApi implements RustLibApi {
  @override
  String crateApiFilenameSanitizeFileName({required String name}) => name;

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnsupportedError('Not mocked: ${invocation.memberName}');
}
