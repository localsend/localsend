import 'dart:io';

import 'package:localsend_app/util/directory_walker.dart';
import 'package:test/test.dart';

void main() {
  group('DirectoryWalker', () {
    late Directory tempDir;

    setUp(() {
      tempDir = Directory.systemTemp.createTempSync('localsend_walker_');
    });

    tearDown(() {
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    void writeFile(String relativePath, [String content = 'x']) {
      final file = File('${tempDir.path}/$relativePath');
      file.parent.createSync(recursive: true);
      file.writeAsStringSync(content);
    }

    test('collects regular files relative to the root', () async {
      writeFile('a.txt');
      writeFile('sub/b.txt');
      writeFile('sub/nested/c.txt');

      final walker = DirectoryWalker();
      final result = await walker.listFiles(tempDir.path);

      expect(result, containsAll(<String>['a.txt', 'sub/b.txt', 'sub/nested/c.txt']));
      expect(result.length, 3);
    });

    test('skips hidden files', () async {
      writeFile('a.txt');
      writeFile('.DS_Store');

      final result = await DirectoryWalker().listFiles(tempDir.path);

      expect(result, contains('a.txt'));
      expect(result, isNot(contains('.DS_Store')));
    });

    test('prunes hidden directories entirely', () async {
      writeFile('a.txt');
      writeFile('.ssh/id_rsa');
      writeFile('.git/config');
      writeFile('.hidden/nested/deep.txt');

      final result = await DirectoryWalker().listFiles(tempDir.path);

      expect(result, contains('a.txt'));
      expect(result.where((e) => e.contains('.ssh')), isEmpty);
      expect(result.where((e) => e.contains('.git')), isEmpty);
      expect(result.where((e) => e.contains('.hidden')), isEmpty);
    });

    test('reports skipped entries', () async {
      writeFile('.DS_Store');

      final skipped = <String>[];
      final walker = DirectoryWalker(onSkip: skipped.add);
      await walker.listFiles(tempDir.path);

      expect(skipped, isNotEmpty);
      expect(skipped.any((e) => e.contains('.DS_Store')), isTrue);
    });

    group('symlink cycles', () {
      test('does not follow a symlink that points to its own ancestor', () async {
        writeFile('a.txt');
        Directory('${tempDir.path}/sub').createSync();
        Link('${tempDir.path}/sub/loop').createSync(tempDir.path);

        final result = await DirectoryWalker().listFiles(tempDir.path);

        // The walk must terminate and must not contain the cycle.
        expect(result, contains('a.txt'));
        expect(result.where((e) => e.contains('loop')), isEmpty);
        expect(result.length, 1);
      });

      test('does not follow a longer symlink cycle', () async {
        writeFile('a.txt');
        Directory('${tempDir.path}/one').createSync();
        Directory('${tempDir.path}/one/two').createSync();
        Directory('${tempDir.path}/one/two/three').createSync();
        Link('${tempDir.path}/one/two/three/back').createSync('${tempDir.path}/one');

        final result = await DirectoryWalker().listFiles(tempDir.path);

        expect(result, contains('a.txt'));
        expect(result.where((e) => e.contains('back')), isEmpty);
        expect(result.length, 1);
      });

      test('follows a symlink that points outside of the selection', () async {
        final outside = Directory.systemTemp.createTempSync('localsend_walker_outside_');
        addTearDown(() {
          if (outside.existsSync()) {
            outside.deleteSync(recursive: true);
          }
        });
        File('${outside.path}/outside.txt').writeAsStringSync('x');

        writeFile('a.txt');
        Link('${tempDir.path}/link').createSync(outside.path);

        final result = await DirectoryWalker().listFiles(tempDir.path);

        expect(result, contains('a.txt'));
        expect(result, contains('link/outside.txt'));
      });

      test('reports the skipped cyclic directory', () async {
        Directory('${tempDir.path}/sub').createSync();
        Link('${tempDir.path}/sub/loop').createSync(tempDir.path);

        final skipped = <String>[];
        await DirectoryWalker(onSkip: skipped.add).listFiles(tempDir.path);

        expect(skipped.any((e) => e.contains('cycle')), isTrue);
      });
    });

    group('error resilience', () {
      test('does not throw when a directory cannot be read', () async {
        writeFile('a.txt');
        final unreadable = Directory('${tempDir.path}/unreadable')..createSync();
        writeFile('unreadable/secret.txt');

        // Make the directory unreadable (no permissions).
        Process.runSync('chmod', ['000', unreadable.path]);

        try {
          final result = await DirectoryWalker().listFiles(tempDir.path);

          // The unreadable directory is skipped, the rest is still collected.
          expect(result, contains('a.txt'));
          expect(result.where((e) => e.contains('secret.txt')), isEmpty);
        } finally {
          Process.runSync('chmod', ['755', unreadable.path]);
        }
      });

      test('does not throw when a symlink is broken', () async {
        writeFile('a.txt');
        Link('${tempDir.path}/broken').createSync('${tempDir.path}/does-not-exist');

        final result = await DirectoryWalker().listFiles(tempDir.path);

        expect(result, contains('a.txt'));
      });

      test('does not throw when the root does not exist', () async {
        final result = await DirectoryWalker().listFiles('${tempDir.path}/does-not-exist');

        expect(result, isEmpty);
      });
    });
  });
}
