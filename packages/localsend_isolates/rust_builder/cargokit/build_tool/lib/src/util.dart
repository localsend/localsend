/// This is copied from Cargokit (which is the official way to use it currently)
/// Details: https://fzyzcjy.github.io/flutter_rust_bridge/manual/integrate/builtin

import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

import 'logging.dart';
import 'rustup.dart';

final log = Logger("process");

class CommandFailedException implements Exception {
  final String executable;
  final List<String> arguments;
  final ProcessResult result;

  CommandFailedException({
    required this.executable,
    required this.arguments,
    required this.result,
  });

  @override
  String toString() {
    final stdout = result.stdout.toString().trim();
    final stderr = result.stderr.toString().trim();
    return [
      "External Command: $executable ${arguments.map((e) => '"$e"').join(' ')}",
      "Returned Exit Code: ${result.exitCode}",
      kSeparator,
      "STDOUT:",
      if (stdout.isNotEmpty) stdout,
      kSeparator,
      "STDERR:",
      if (stderr.isNotEmpty) stderr,
    ].join('\n');
  }
}

class TestRunCommandArgs {
  final String executable;
  final List<String> arguments;
  final String? workingDirectory;
  final Map<String, String>? environment;
  final bool includeParentEnvironment;
  final bool runInShell;
  final Encoding? stdoutEncoding;
  final Encoding? stderrEncoding;

  TestRunCommandArgs({
    required this.executable,
    required this.arguments,
    this.workingDirectory,
    this.environment,
    this.includeParentEnvironment = true,
    this.runInShell = false,
    this.stdoutEncoding,
    this.stderrEncoding,
  });
}

class TestRunCommandResult {
  TestRunCommandResult({
    this.pid = 1,
    this.exitCode = 0,
    this.stdout = '',
    this.stderr = '',
  });

  final int pid;
  final int exitCode;
  final String stdout;
  final String stderr;
}

TestRunCommandResult Function(TestRunCommandArgs args)? testRunCommandOverride;

ProcessResult runCommand(
  String executable,
  List<String> arguments, {
  String? workingDirectory,
  Map<String, String>? environment,
  bool includeParentEnvironment = true,
  bool runInShell = false,
  Encoding? stdoutEncoding = systemEncoding,
  Encoding? stderrEncoding = systemEncoding,
}) {
  if (testRunCommandOverride != null) {
    final result = testRunCommandOverride!(TestRunCommandArgs(
      executable: executable,
      arguments: arguments,
      workingDirectory: workingDirectory,
      environment: environment,
      includeParentEnvironment: includeParentEnvironment,
      runInShell: runInShell,
      stdoutEncoding: stdoutEncoding,
      stderrEncoding: stderrEncoding,
    ));
    return ProcessResult(
      result.pid,
      result.exitCode,
      result.stdout,
      result.stderr,
    );
  }
  log.finer('Running command $executable ${arguments.join(' ')}');
  final res = Process.runSync(
    _resolveExecutable(executable),
    arguments,
    workingDirectory: workingDirectory,
    environment: environment,
    includeParentEnvironment: includeParentEnvironment,
    runInShell: runInShell,
    stderrEncoding: stderrEncoding,
    stdoutEncoding: stdoutEncoding,
  );
  if (res.exitCode != 0) {
    throw CommandFailedException(
      executable: executable,
      arguments: arguments,
      result: res,
    );
  } else {
    return res;
  }
}

class RustupNotFoundException implements Exception {
  @override
  String toString() {
    return [
      ' ',
      'rustup not found in PATH.',
      ' ',
      'Maybe you need to install Rust? It only takes a minute:',
      ' ',
      if (Platform.isWindows) 'https://www.rust-lang.org/tools/install',
      if (hasHomebrewRustInPath()) ...[
        '\$ brew unlink rust # Unlink homebrew Rust from PATH',
      ],
      if (!Platform.isWindows)
        "\$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh",
      ' ',
    ].join('\n');
  }

  static bool hasHomebrewRustInPath() {
    if (!Platform.isMacOS) {
      return false;
    }
    final envPath = Platform.environment['PATH'] ?? '';
    final paths = envPath.split(':');
    return paths.any((p) {
      return p.contains('homebrew') && File(path.join(p, 'rustc')).existsSync();
    });
  }
}

String _resolveExecutable(String executable) {
  if (executable == 'rustup') {
    final resolved = Rustup.executablePath();
    if (resolved != null) {
      return resolved;
    }
    throw RustupNotFoundException();
  } else {
    return executable;
  }
}
