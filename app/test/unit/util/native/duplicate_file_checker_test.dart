import 'dart:io';

import 'package:localsend_app/util/native/duplicate_file_checker.dart';
import 'package:test/test.dart';

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('duplicate_file_checker_test_');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('returns false when file does not exist', () async {
    final result = await fileLikelyAlreadyExists(
      destinationDirectory: tempDir.path,
      relativeFileName: 'missing.txt',
      expectedSize: 123,
      expectedLastModified: null,
    );
    expect(result, false);
  });

  test('returns true when size and lastModified match', () async {
    final file = File('${tempDir.path}/existing.txt');
    await file.writeAsString('hello world');
    final lastModified = DateTime.now();
    await file.setLastModified(lastModified);

    final result = await fileLikelyAlreadyExists(
      destinationDirectory: tempDir.path,
      relativeFileName: 'existing.txt',
      expectedSize: await file.length(),
      expectedLastModified: lastModified,
    );
    expect(result, true);
  });

  test('returns false when size differs', () async {
    final file = File('${tempDir.path}/existing.txt');
    await file.writeAsString('hello world');

    final result = await fileLikelyAlreadyExists(
      destinationDirectory: tempDir.path,
      relativeFileName: 'existing.txt',
      expectedSize: 99999,
      expectedLastModified: null,
    );
    expect(result, false);
  });

  test('returns false when lastModified differs beyond tolerance', () async {
    final file = File('${tempDir.path}/existing.txt');
    await file.writeAsString('hello world');
    await file.setLastModified(DateTime.now());

    final result = await fileLikelyAlreadyExists(
      destinationDirectory: tempDir.path,
      relativeFileName: 'existing.txt',
      expectedSize: await file.length(),
      expectedLastModified: DateTime.now().subtract(const Duration(days: 1)),
    );
    expect(result, false);
  });

  test('returns false for content:// (SAF) destination directories', () async {
    final result = await fileLikelyAlreadyExists(
      destinationDirectory: 'content://com.android.externalstorage.documents/tree/abc',
      relativeFileName: 'existing.txt',
      expectedSize: 123,
      expectedLastModified: null,
    );
    expect(result, false);
  });
}
