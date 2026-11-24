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

  test('saves under an alternative name when a directory occupies the incoming name', () async {
    final existingDirectory = Directory(p.join(tempDir.path, 'file.txt'))..createSync();
    final existingContent = File(p.join(existingDirectory.path, 'keep.txt'))..writeAsStringSync('keep');
    final existingFile = File(p.join(tempDir.path, 'file (2).txt'))..writeAsStringSync('existing');

    final path = await digest(tempDir.path, 'file.txt');
    await File(path).writeAsString('received');

    expect(path, p.join(tempDir.path, 'file (3).txt'));
    expect(File(path).readAsStringSync(), 'received');
    expect(existingContent.readAsStringSync(), 'keep');
    expect(existingFile.readAsStringSync(), 'existing');
  });

  test('parallel same-name allocations stay distinct before any file is written', () async {
    final reservedPaths = <String>{};
    final targets = await Future.wait([
      for (var i = 0; i < 10; i++)
        prepareFileSaveTarget(
          destinationDirectory: tempDir.path,
          cacheDirectory: tempDir.path,
          fileName: 'Frame.bin',
          saveToGallery: false,
          createdDirectories: {},
          reservedPaths: reservedPaths,
        ),
    ]);

    expect(targets.map((target) => target.path).toSet(), hasLength(10));
    expect(reservedPaths, hasLength(10));
    expect(tempDir.listSync(), isEmpty, reason: 'Reserving targets must not create placeholder files');
  });

  test('considers both existing entries and targets not yet written', () async {
    final original = File(p.join(tempDir.path, 'Frame.bin'))..writeAsStringSync('keep');
    final reservedPaths = {p.join(tempDir.path, 'Frame (2).bin')};

    final (path, _, _) = await digestFilePathAndPrepareDirectory(
      parentDirectory: tempDir.path,
      fileName: 'Frame.bin',
      createdDirectories: {},
      reservedPaths: reservedPaths,
    );

    expect(path, p.join(tempDir.path, 'Frame (3).bin'));
    expect(original.readAsStringSync(), 'keep');
    expect(reservedPaths, contains(path));
  });

  test('a retry reuses its target without another reservation', () async {
    final reservedPaths = <String>{};
    final target = await prepareFileSaveTarget(
      destinationDirectory: tempDir.path,
      cacheDirectory: tempDir.path,
      fileName: 'Frame.bin',
      saveToGallery: false,
      createdDirectories: {},
      reservedPaths: reservedPaths,
    );
    await File(target.path!).writeAsString('partial');

    expect(await reopenFileSaveTarget(target), same(target));
    expect(reservedPaths, {target.path});
    expect(tempDir.listSync(), hasLength(1));
  });

  test('reservations belong to one receive session', () async {
    Future<FileSaveTarget> prepare(Set<String> reservations) => prepareFileSaveTarget(
      destinationDirectory: tempDir.path,
      cacheDirectory: tempDir.path,
      fileName: 'Frame.bin',
      saveToGallery: false,
      createdDirectories: {},
      reservedPaths: reservations,
    );
    final firstSession = <String>{};
    final secondSession = <String>{};

    final first = await prepare(firstSession);
    final second = await prepare(secondSession);

    expect(first.path, second.path, reason: 'An unwritten target from a finished session is not globally reserved');
    expect(firstSession, {first.path});
    expect(secondSession, {second.path});
  });

  test('same names in different directories retain their names', () async {
    final reservedPaths = <String>{};
    final results = await Future.wait([
      for (final folder in ['first', 'second'])
        digestFilePathAndPrepareDirectory(
          parentDirectory: tempDir.path,
          fileName: '$folder/Frame.bin',
          createdDirectories: {},
          reservedPaths: reservedPaths,
        ),
    ]);

    expect(results.map((result) => p.basename(result.$1)), everyElement('Frame.bin'));
    expect(reservedPaths, hasLength(2));
  });

  test('failed directory preparation does not reserve a target', () async {
    final parent = File(p.join(tempDir.path, 'not-a-directory'))..writeAsStringSync('keep');
    final reservedPaths = <String>{};

    await expectLater(
      digestFilePathAndPrepareDirectory(
        parentDirectory: parent.path,
        fileName: 'Frame.bin',
        createdDirectories: {},
        reservedPaths: reservedPaths,
      ),
      throwsA(isA<FileSystemException>()),
    );

    expect(reservedPaths, isEmpty);
    expect(parent.readAsStringSync(), 'keep');
  });
}

/// The sanitizer lives in the Rust library, which is not loaded in unit tests.
class _MockRustLibApi implements RustLibApi {
  @override
  String crateApiFilenameSanitizeFileName({required String name}) => name;

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnsupportedError('Not mocked: ${invocation.memberName}');
}
