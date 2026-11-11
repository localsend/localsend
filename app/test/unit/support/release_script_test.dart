import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  late Directory fixture;
  late String source;
  late String dartExecutable;

  setUpAll(() {
    source = File('../support/scripts/release.dart').readAsStringSync();
    final flutterRoot = Platform.environment['FLUTTER_ROOT']!;
    dartExecutable = '$flutterRoot/bin/cache/dart-sdk/bin/dart${Platform.isWindows ? '.exe' : ''}';
  });

  setUp(() {
    fixture = Directory.systemTemp.createTempSync('localsend release ');
    final script = File('${fixture.path}/support/scripts/release.dart');
    script.parent.createSync(recursive: true);
    script.writeAsStringSync(source);
  });

  tearDown(() => fixture.deleteSync(recursive: true));

  Future<ProcessResult> runRelease(List<String> args) {
    return Process.run(dartExecutable, ['${fixture.path}/support/scripts/release.dart', ...args], workingDirectory: fixture.path);
  }

  void writeFiles(Map<String, String> files) {
    for (final entry in files.entries) {
      final file = File('${fixture.path}/${entry.key}');
      file.parent.createSync(recursive: true);
      file.writeAsBytesSync(utf8.encode(entry.value));
    }
  }

  void expectFiles(Map<String, String> expected) {
    for (final entry in expected.entries) {
      expect(File('${fixture.path}/${entry.key}').readAsBytesSync(), utf8.encode(entry.value), reason: entry.key);
    }
  }

  for (final (name, lockEnding, otherEnding) in [
    ('LF', '\n', '\n'),
    ('CRLF lockfile', '\r\n', '\n'),
    ('all CRLF', '\r\n', '\r\n'),
  ]) {
    test('release script preserves file contents and line endings with $name', () async {
      writeFiles(_files('1.0.0', 1, lockEnding, otherEnding));

      for (final (version, build) in [('2.3.4', 42), ('2.3.4', 42), ('3.4.5', 43)]) {
        final result = await runRelease(['$version+$build']);
        expect(result.exitCode, 0, reason: '${result.stdout}\n${result.stderr}');
        expectFiles(_files(version, build, lockEnding, otherEnding));
      }
    });
  }

  for (final args in <List<String>>[
    [],
    ['invalid'],
    ['1.2.3'],
    ['1.2.3+4', 'extra'],
  ]) {
    test('release script rejects $args without modifying files', () async {
      final original = _files('1.0.0', 1, '\r\n', '\n');
      writeFiles(original);

      final result = await runRelease(args);

      expect(result.exitCode, isNot(0));
      expectFiles(original);
    });
  }
}

Map<String, String> _files(String version, int build, String lockEnding, String otherEnding) {
  final files = {
    'app/pubspec.yaml': 'name: localsend_app\nversion: $version+$build\n# Keep this comment.\n',
    'cli/Cargo.toml': '[package]\nname = "localsend-cli"\nversion = "$version"\n',
    'Cargo.lock':
        '[[package]]\nname = "other-before"\nversion = "1.0.0"\n\n'
        '[[package]]\nname = "localsend-cli"\nversion = "$version"\n\n'
        '[[package]]\nname = "other-after"\nversion = "1.0.0"\n',
    'support/scripts/compile_windows_exe-inno.iss': '#define MyAppVersion "$version"\n#define MyAppName "LocalSend"\n',
    'support/build/msix/content/AppxManifest.xml': '<Identity Name="LocalSend" Version="$version.0" />\n',
    'support/build/appimage/AppImageBuilder_x86_64.yml': 'AppDir:\n  app_info:\n    version: $version\n',
    'support/build/appimage/AppImageBuilder_arm_64.yml': 'AppDir:\n  app_info:\n    version: $version\n',
  };

  return files.map((path, content) => MapEntry(path, content.replaceAll('\n', path == 'Cargo.lock' ? lockEnding : otherEnding)));
}
