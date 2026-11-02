import 'dart:io';

import 'package:localsend_app/util/directory_walk_guard.dart';
import 'package:test/test.dart';

void main() {
  group('DirectoryWalkGuard', () {
    group('with an injected resolver', () {
      test('allows entering a directory that is not active', () {
        final guard = DirectoryWalkGuard();
        expect(guard.enter('/a', resolve: (path) => path), isTrue);
        expect(guard.activeCount, 1);
      });

      test('rejects a directory that resolves to an active path', () {
        final guard = DirectoryWalkGuard();
        guard.enter('/a', resolve: (path) => path);

        // /a/link resolves to /a -> cycle
        expect(guard.enter('/a/link', resolve: (path) => '/a'), isFalse);
        expect(guard.activeCount, 1);
      });

      test('allows a sibling that resolves to the same path after unwinding', () {
        final guard = DirectoryWalkGuard();
        guard.enter('/a', resolve: (path) => path);
        guard.leave('/a', resolve: (path) => path);
        expect(guard.activeCount, 0);

        // The same path can be entered again once the descent unwound.
        expect(guard.enter('/a', resolve: (path) => path), isTrue);
        expect(guard.activeCount, 1);
      });

      test('does not reject a path that is active in a different branch', () {
        final guard = DirectoryWalkGuard();
        // /x resolves to /shared, /y also resolves to /shared
        expect(guard.enter('/x', resolve: (path) => '/shared'), isTrue);
        guard.leave('/x', resolve: (path) => '/shared');
        expect(guard.enter('/y', resolve: (path) => '/shared'), isTrue);
        expect(guard.activeCount, 1);
      });

      test('detects a cycle when a symlink points to its own ancestor', () {
        final guard = DirectoryWalkGuard();
        final Map<String, String> resolved = {
          '/root': '/root',
          '/root/sub': '/root/sub',
          '/root/sub/loop': '/root',
        };

        expect(guard.enter('/root', resolve: (path) => resolved[path]!), isTrue);
        expect(guard.enter('/root/sub', resolve: (path) => resolved[path]!), isTrue);
        expect(guard.enter('/root/sub/loop', resolve: (path) => resolved[path]!), isFalse);
        expect(guard.activeCount, 2);
      });

      test('allows entering a path that cannot be resolved', () {
        final guard = DirectoryWalkGuard();
        expect(
          guard.enter('/broken', resolve: (path) => throw const FileSystemException('broken')),
          isTrue,
        );
        expect(guard.activeCount, 0);
      });

      test('leaving a path that cannot be resolved does not throw', () {
        final guard = DirectoryWalkGuard();
        expect(
          () => guard.leave('/broken', resolve: (path) => throw const FileSystemException('broken')),
          returnsNormally,
        );
        expect(guard.activeCount, 0);
      });
    });

    group('with real symlinks', () {
      late Directory tempDir;

      setUp(() {
        tempDir = Directory.systemTemp.createTempSync('localsend_walk_guard_');
      });

      tearDown(() {
        if (tempDir.existsSync()) {
          tempDir.deleteSync(recursive: true);
        }
      });

      test('rejects a symlink that points to its own ancestor', () {
        final root = Directory('${tempDir.path}/root')..createSync();
        final sub = Directory('${root.path}/sub')..createSync();
        Link('${sub.path}/loop').createSync(root.path);

        final guard = DirectoryWalkGuard();
        expect(guard.enter(root.path), isTrue);
        expect(guard.enter(sub.path), isTrue);
        expect(guard.enter('${sub.path}/loop'), isFalse);
        expect(guard.activeCount, 2);

        guard.leave(sub.path);
        guard.leave(root.path);
        expect(guard.activeCount, 0);
      });

      test('allows a symlink that points outside of the current descent', () {
        final root = Directory('${tempDir.path}/root')..createSync();
        final other = Directory('${tempDir.path}/other')..createSync();
        Link('${root.path}/link').createSync(other.path);

        final guard = DirectoryWalkGuard();
        expect(guard.enter(root.path), isTrue);
        expect(guard.enter('${root.path}/link'), isTrue);
        expect(guard.activeCount, 2);
      });

      test('allows re-entering a symlink target after unwinding', () {
        final root = Directory('${tempDir.path}/root')..createSync();
        final other = Directory('${tempDir.path}/other')..createSync();
        Link('${root.path}/link').createSync(other.path);

        final guard = DirectoryWalkGuard();
        expect(guard.enter(root.path), isTrue);
        expect(guard.enter('${root.path}/link'), isTrue);
        guard.leave('${root.path}/link');
        expect(guard.enter('${root.path}/link'), isTrue);
      });

      test('allows entering a broken symlink target without throwing', () {
        final root = Directory('${tempDir.path}/root')..createSync();
        Link('${root.path}/broken').createSync('${tempDir.path}/does-not-exist');

        final guard = DirectoryWalkGuard();
        expect(guard.enter(root.path), isTrue);
        expect(guard.enter('${root.path}/broken'), isTrue);
      });
    });
  });
}
