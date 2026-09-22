import 'dart:io';

import 'package:localsend_app/util/native/cross_file_converters.dart';
import 'package:localsend_app/util/native/macos_app_archive.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  test(
    'app selection stays uncompressed and each transfer gets a fresh snapshot',
    () async {
      final root = await Directory.systemTemp.createTemp(
        'localsend-app-archive-test-',
      );
      addTearDown(() => root.delete(recursive: true));

      final app = Directory(p.join(root.path, 'Example.app'));
      await app.create();
      final contents = File(p.join(app.path, 'version.txt'));
      await contents.writeAsString('first');
      final cache = Directory(p.join(root.path, 'cache'));

      final selected = CrossFileConverters.selectMacosAppForSending(app);
      expect(isPendingMacosAppArchive(selected), isTrue);
      expect(selected.path, app.path);
      expect(CrossFileConverters.selectMacosAppForSending(Directory('${app.path}/')).name, 'Example.app.zip');
      expect(await cache.exists(), isFalse);

      final first = await archiveMacosApp(app, cache);
      await contents.writeAsString('second');
      final second = await archiveMacosApp(app, cache);
      expect(second.path, isNot(first.path));

      for (final (archive, expected) in [
        (first, 'first'),
        (second, 'second'),
      ]) {
        final destination = Directory(p.join(root.path, 'unpacked-$expected'));
        await destination.create();
        final result = await Process.run('/usr/bin/ditto', [
          '-x',
          '-k',
          archive.path,
          destination.path,
        ]);
        expect(result.exitCode, 0, reason: '${result.stderr}');
        expect(
          await File(
            p.join(destination.path, 'Example.app', 'version.txt'),
          ).readAsString(),
          expected,
        );
      }

      await PreparedSendingFiles([], [first.parent, second.parent]).dispose();
      expect(await first.exists(), isFalse);
      expect(await second.exists(), isFalse);
    },
    skip: !Platform.isMacOS,
  );
}
