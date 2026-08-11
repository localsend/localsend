import 'dart:io';

/// Updates the app version in all files checked by CI.
///
/// Usage: fvm dart run release.dart 1.18.1+61
void main(List<String> args) {
  if (args.length != 1) {
    print('Usage: fvm dart run release.dart <version>+<build>');
    exit(1);
  }

  final match = RegExp(r'^(\d+\.\d+\.\d+)\+(\d+)$').firstMatch(args.first);
  if (match == null) {
    print('Invalid version "${args.first}", expected e.g. 1.18.1+61');
    exit(1);
  }
  final version = match.group(1)!;
  final build = int.parse(match.group(2)!);

  final root = File(Platform.script.toFilePath()).parent.parent.parent.path;

  _replace(
    file: '$root/app/pubspec.yaml',
    pattern: r'^version: .+$',
    replacement: 'version: $version+$build',
  );
  _replace(
    file: '$root/cli/Cargo.toml',
    pattern: r'^version = ".+"$',
    replacement: 'version = "$version"',
  );
  _replace(
    file: '$root/Cargo.lock',
    pattern: 'name = "localsend-cli"\nversion = ".+"',
    replacement: 'name = "localsend-cli"\nversion = "$version"',
  );
  _replace(
    file: '$root/support/scripts/compile_windows_exe-inno.iss',
    pattern: r'^#define MyAppVersion ".+"$',
    replacement: '#define MyAppVersion "$version"',
  );
  _replace(
    file: '$root/support/build/msix/content/AppxManifest.xml',
    pattern: r'(?<= )Version="[0-9.]+"',
    replacement: 'Version="$version.0"',
  );

  print('Updated to $version+$build');
}

void _replace({required String file, required String pattern, required String replacement}) {
  final regex = RegExp(pattern, multiLine: true);
  final content = File(file).readAsStringSync();
  if (!regex.hasMatch(content)) {
    print('Pattern not found in $file');
    exit(1);
  }
  File(file).writeAsStringSync(content.replaceFirst(regex, replacement));
  print('$file: $replacement');
}
