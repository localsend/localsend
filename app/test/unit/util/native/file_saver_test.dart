import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/util/native/file_saver.dart';
import 'package:path/path.dart' as p;

void main() {
  group('digestFilePathAndPrepareDirectory', () {
    late Directory tempDir;

    setUp(() {
      tempDir = Directory.systemTemp.createTempSync('localsend_saver_test_');
    });

    tearDown(() {
      tempDir.deleteSync(recursive: true);
    });

    test('Should increment counter if file already exists', () async {
      File(p.join(tempDir.path, 'test.txt')).writeAsStringSync('existing file');

      final (destinationPath, _, finalName) = await digestFilePathAndPrepareDirectory(
        parentDirectory: tempDir.path,
        fileName: 'test.txt',
        createdDirectories: {},
        overwriteDuplicateFiles: false,
      );

      final expectedPath = p.join(tempDir.path, 'test (2).txt');
      expect(destinationPath, expectedPath);
      expect(finalName, 'test (2).txt');
    });

    test('Should overwrite if file already exists and overwriteDuplicateFiles is true', () async {
      File(p.join(tempDir.path, 'test.txt')).writeAsStringSync('existing file');

      final (destinationPath, _, finalName) = await digestFilePathAndPrepareDirectory(
        parentDirectory: tempDir.path,
        fileName: 'test.txt',
        createdDirectories: {},
        overwriteDuplicateFiles: true,
      );

      final expectedPath = p.join(tempDir.path, 'test.txt');
      expect(destinationPath, expectedPath);
      expect(finalName, 'test.txt');
    });

    test('Should not change file name if file does not exist and overwriteDuplicateFiles is true', () async {
      final (destinationPath, _, finalName) = await digestFilePathAndPrepareDirectory(
        parentDirectory: tempDir.path,
        fileName: 'test.txt',
        createdDirectories: {},
        overwriteDuplicateFiles: true,
      );

      final expectedPath = p.join(tempDir.path, 'test.txt');
      expect(destinationPath, expectedPath);
      expect(finalName, 'test.txt');
    });
    
    test('Should not change file name if file does not exist and overwriteDuplicateFiles is false', () async {
      final (destinationPath, _, finalName) = await digestFilePathAndPrepareDirectory(
        parentDirectory: tempDir.path,
        fileName: 'test.txt',
        createdDirectories: {},
        overwriteDuplicateFiles: false,
      );

      final expectedPath = p.join(tempDir.path, 'test.txt');
      expect(destinationPath, expectedPath);
      expect(finalName, 'test.txt');
    });
  });
}
