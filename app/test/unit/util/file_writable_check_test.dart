import 'dart:io';

import 'package:localsend_app/util/file_writable_check.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  test('existing directory is writable', () async {
    final dir = await Directory.systemTemp.createTemp('localsend_writable');
    addTearDown(() => dir.delete(recursive: true));

    expect(await isDirectoryWritable(dir.path), isTrue);
  });

  test('nonexistent directory is not writable', () async {
    final dir = Directory.systemTemp.createTempSync('localsend_writable');
    final missing = p.join(dir.path, 'does-not-exist');
    addTearDown(() => dir.delete(recursive: true));

    expect(await isDirectoryWritable(missing), isFalse);
  });

  test('file path is not writable', () async {
    final dir = Directory.systemTemp.createTempSync('localsend_writable');
    final file = File(p.join(dir.path, 'file.txt'))..createSync();
    addTearDown(() => dir.delete(recursive: true));

    expect(await isDirectoryWritable(file.path), isFalse);
  });

  if (!Platform.isWindows) {
    // Windows CI may run elevated, where read-only attributes do not apply.
    test('read-only directory is not writable', () async {
      final dir = Directory.systemTemp.createTempSync('localsend_writable');
      addTearDown(() {
        Process.runSync('chmod', ['u+w', dir.path]);
        dir.deleteSync(recursive: true);
      });
      Process.runSync('chmod', ['u-w', dir.path]);

      expect(await isDirectoryWritable(dir.path), isFalse);
    });
  }
}
