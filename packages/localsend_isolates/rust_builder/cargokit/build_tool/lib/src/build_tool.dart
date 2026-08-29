/// This is copied from Cargokit (which is the official way to use it currently)
/// Details: https://fzyzcjy.github.io/flutter_rust_bridge/manual/integrate/builtin

import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart';
import 'package:github/github.dart';
import 'package:hex/hex.dart';
import 'package:logging/logging.dart';

import 'android_environment.dart';
import 'build_cmake.dart';
import 'build_gradle.dart';
import 'build_pod.dart';
import 'logging.dart';
import 'options.dart';
import 'precompile_binaries.dart';
import 'target.dart';
import 'util.dart';
import 'verify_binaries.dart';

final log = Logger('build_tool');

abstract class BuildCommand extends Command {
  Future<void> runBuildCommand(CargokitUserOptions options);

  @override
  Future<void> run() async {
    final options = CargokitUserOptions.load();

    if (options.verboseLogging ||
        Platform.environment['CARGOKIT_VERBOSE'] == '1') {
      enableVerboseLogging();
    }

    await runBuildCommand(options);
  }
}

class BuildPodCommand extends BuildCommand {
  @override
  final name = 'build-pod';

  @override
  final description = 'Build cocoa pod library';

  @override
  Future<void> runBuildCommand(CargokitUserOptions options) async {
    final build = BuildPod(userOptions: options);
    await build.build();
  }
}

class BuildGradleCommand extends BuildCommand {
  @override
  final name = 'build-gradle';

  @override
  final description = 'Build android library';

  @override
  Future<void> runBuildCommand(CargokitUserOptions options) async {
    final build = BuildGradle(userOptions: options);
    await build.build();
  }
}

class BuildCMakeCommand extends BuildCommand {
  @override
  final name = 'build-cmake';

  @override
  final description = 'Build CMake library';

  @override
  Future<void> runBuildCommand(CargokitUserOptions options) async {
    final build = BuildCMake(userOptions: options);
    await build.build();
  }
}

class GenKeyCommand extends Command {
  @override
  final name = 'gen-key';

  @override
  final description = 'Generate key pair for signing precompiled binaries';

  @override
  void run() {
    final kp = generateKey();
    final private = HEX.encode(kp.privateKey.bytes);
    final public = HEX.encode(kp.publicKey.bytes);
    print("Private Key: $private");
    print("Public Key: $public");
  }
}

class PrecompileBinariesCommand extends Command {
  PrecompileBinariesCommand() {
    argParser
      ..addOption(
        'repository',
        mandatory: true,
        help: 'Github repository slug in format owner/name',
      )
      ..addOption(
        'manifest-dir',
        mandatory: true,
        help: 'Directory containing Cargo.toml',
      )
      ..addMultiOption('target',
          help: 'Rust target triple of artifact to build.\n'
              'Can be specified multiple times or omitted in which case\n'
              'all targets for current platform will be built.')
      ..addOption(
        'android-sdk-location',
        help: 'Location of Android SDK (if available)',
      )
      ..addOption(
        'android-ndk-version',
        help: 'Android NDK version (if available)',
      )
      ..addOption(
        'android-min-sdk-version',
        help: 'Android minimum rquired version (if available)',
      )
      ..addOption(
        'temp-dir',
        help: 'Directory to store temporary build artifacts',
      )
      ..addFlag(
        "verbose",
        abbr: "v",
        defaultsTo: false,
        help: "Enable verbose logging",
      );
  }

  @override
  final name = 'precompile-binaries';

  @override
  final description = 'Prebuild and upload binaries\n'
      'Private key must be passed through PRIVATE_KEY environment variable. '
      'Use gen_key through generate priave key.\n'
      'Github token must be passed as GITHUB_TOKEN environment variable.\n';

  @override
  Future<void> run() async {
    final verbose = argResults!['verbose'] as bool;
    if (verbose) {
      enableVerboseLogging();
    }

    final privateKeyString = Platform.environment['PRIVATE_KEY'];
    if (privateKeyString == null) {
      throw ArgumentError('Missing PRIVATE_KEY environment variable');
    }
    final githubToken = Platform.environment['GITHUB_TOKEN'];
    if (githubToken == null) {
      throw ArgumentError('Missing GITHUB_TOKEN environment variable');
    }
    final privateKey = HEX.decode(privateKeyString);
    if (privateKey.length != 64) {
      throw ArgumentError('Private key must be 64 bytes long');
    }
    final manifestDir = argResults!['manifest-dir'] as String;
    if (!Directory(manifestDir).existsSync()) {
      throw ArgumentError('Manifest directory does not exist: $manifestDir');
    }
    String? androidMinSdkVersionString =
        argResults!['android-min-sdk-version'] as String?;
    int? androidMinSdkVersion;
    if (androidMinSdkVersionString != null) {
      androidMinSdkVersion = int.tryParse(androidMinSdkVersionString);
      if (androidMinSdkVersion == null) {
        throw ArgumentError(
            'Invalid android-min-sdk-version: $androidMinSdkVersionString');
      }
    }
    final targetStrigns = argResults!['target'] as List<String>;
    final targets = targetStrigns.map((target) {
      final res = Target.forRustTriple(target);
      if (res == null) {
        throw ArgumentError('Invalid target: $target');
      }
      return res;
    }).toList(growable: false);
    final precompileBinaries = PrecompileBinaries(
      privateKey: PrivateKey(privateKey),
      githubToken: githubToken,
      manifestDir: manifestDir,
      repositorySlug: RepositorySlug.full(argResults!['repository'] as String),
      targets: targets,
      androidSdkLocation: argResults!['android-sdk-location'] as String?,
      androidNdkVersion: argResults!['android-ndk-version'] as String?,
      androidMinSdkVersion: androidMinSdkVersion,
      tempDir: argResults!['temp-dir'] as String?,
    );

    await precompileBinaries.run();
  }
}

class VerifyBinariesCommand extends Command {
  VerifyBinariesCommand() {
    argParser.addOption(
      'manifest-dir',
      mandatory: true,
      help: 'Directory containing Cargo.toml',
    );
  }

  @override
  final name = "verify-binaries";

  @override
  final description = 'Verifies published binaries\n'
      'Checks whether there is a binary published for each targets\n'
      'and checks the signature.';

  @override
  Future<void> run() async {
    final manifestDir = argResults!['manifest-dir'] as String;
    final verifyBinaries = VerifyBinaries(
      manifestDir: manifestDir,
    );
    await verifyBinaries.run();
  }
}

Future<void> runMain(List<String> args) async {
  try {
    // Init logging before options are loaded
    initLogging();

    if (Platform.environment['_CARGOKIT_NDK_LINK_TARGET'] != null) {
      return AndroidEnvironment.clangLinkerWrapper(args);
    }

    final runner = CommandRunner('build_tool', 'Cargokit built_tool')
      ..addCommand(BuildPodCommand())
      ..addCommand(BuildGradleCommand())
      ..addCommand(BuildCMakeCommand())
      ..addCommand(GenKeyCommand())
      ..addCommand(PrecompileBinariesCommand())
      ..addCommand(VerifyBinariesCommand());

    await runner.run(args);
  } on ArgumentError catch (e) {
    stderr.writeln(e.toString());
    exit(1);
  } catch (e, s) {
    log.severe(kDoubleSeparator);
    log.severe('Cargokit BuildTool failed with error:');
    log.severe(kSeparator);
    log.severe(e);
    // This tells user to install Rust, there's no need to pollute the log with
    // stack trace.
    if (e is! RustupNotFoundException) {
      log.severe(kSeparator);
      log.severe(s);
      log.severe(kSeparator);
      log.severe('BuildTool arguments: $args');
    }
    log.severe(kDoubleSeparator);
    exit(1);
  }
}
