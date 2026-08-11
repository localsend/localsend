/// This is copied from Cargokit (which is the official way to use it currently)
/// Details: https://fzyzcjy.github.io/flutter_rust_bridge/manual/integrate/builtin

import 'dart:io';
import 'dart:isolate';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:path/path.dart' as path;
import 'package:version/version.dart';

import 'target.dart';
import 'util.dart';

class AndroidEnvironment {
  AndroidEnvironment({
    required this.sdkPath,
    required this.ndkVersion,
    required this.minSdkVersion,
    required this.targetTempDir,
    required this.target,
  });

  static void clangLinkerWrapper(List<String> args) {
    final clang = Platform.environment['_CARGOKIT_NDK_LINK_CLANG'];
    if (clang == null) {
      throw Exception(
          "cargo-ndk rustc linker: didn't find _CARGOKIT_NDK_LINK_CLANG env var");
    }
    final target = Platform.environment['_CARGOKIT_NDK_LINK_TARGET'];
    if (target == null) {
      throw Exception(
          "cargo-ndk rustc linker: didn't find _CARGOKIT_NDK_LINK_TARGET env var");
    }

    runCommand(clang, [
      target,
      ...args,
    ]);
  }

  /// Full path to Android SDK.
  final String sdkPath;

  /// Full version of Android NDK.
  final String ndkVersion;

  /// Minimum supported SDK version.
  final int minSdkVersion;

  /// Target directory for build artifacts.
  final String targetTempDir;

  /// Target being built.
  final Target target;

  bool ndkIsInstalled() {
    final ndkPath = path.join(sdkPath, 'ndk', ndkVersion);
    final ndkPackageXml = File(path.join(ndkPath, 'package.xml'));
    return ndkPackageXml.existsSync();
  }

  void installNdk({
    required String javaHome,
  }) {
    final sdkManagerExtension = Platform.isWindows ? '.bat' : '';
    final sdkManager = path.join(
      sdkPath,
      'cmdline-tools',
      'latest',
      'bin',
      'sdkmanager$sdkManagerExtension',
    );

    log.info('Installing NDK $ndkVersion');
    runCommand(sdkManager, [
      '--install',
      'ndk;$ndkVersion',
    ], environment: {
      'JAVA_HOME': javaHome,
    });
  }

  Future<Map<String, String>> buildEnvironment() async {
    final hostArch = Platform.isMacOS
        ? "darwin-x86_64"
        : (Platform.isLinux ? "linux-x86_64" : "windows-x86_64");

    final ndkPath = path.join(sdkPath, 'ndk', ndkVersion);
    final toolchainPath = path.join(
      ndkPath,
      'toolchains',
      'llvm',
      'prebuilt',
      hostArch,
      'bin',
    );

    final minSdkVersion =
        math.max(target.androidMinSdkVersion!, this.minSdkVersion);

    final exe = Platform.isWindows ? '.exe' : '';

    final arKey = 'AR_${target.rust}';
    final arValue = ['${target.rust}-ar', 'llvm-ar', 'llvm-ar.exe']
        .map((e) => path.join(toolchainPath, e))
        .firstWhereOrNull((element) => File(element).existsSync());
    if (arValue == null) {
      throw Exception('Failed to find ar for $target in $toolchainPath');
    }

    final targetArg = '--target=${target.rust}$minSdkVersion';

    final ccKey = 'CC_${target.rust}';
    final ccValue = path.join(toolchainPath, 'clang$exe');
    final cfFlagsKey = 'CFLAGS_${target.rust}';
    final cFlagsValue = targetArg;

    final cxxKey = 'CXX_${target.rust}';
    final cxxValue = path.join(toolchainPath, 'clang++$exe');
    final cxxFlagsKey = 'CXXFLAGS_${target.rust}';
    final cxxFlagsValue = targetArg;

    final linkerKey =
        'cargo_target_${target.rust.replaceAll('-', '_')}_linker'.toUpperCase();

    final ranlibKey = 'RANLIB_${target.rust}';
    final ranlibValue = path.join(toolchainPath, 'llvm-ranlib$exe');

    final ndkVersionParsed = Version.parse(ndkVersion);
    final rustFlagsKey = 'CARGO_ENCODED_RUSTFLAGS';
    final rustFlagsValue = _libGccWorkaround(targetTempDir, ndkVersionParsed);

    final runRustTool =
        Platform.isWindows ? 'run_build_tool.cmd' : 'run_build_tool.sh';

    final packagePath = (await Isolate.resolvePackageUri(
            Uri.parse('package:build_tool/buildtool.dart')))!
        .toFilePath();
    final selfPath = path.canonicalize(path.join(
      packagePath,
      '..',
      '..',
      '..',
      runRustTool,
    ));

    // Make sure that run_build_tool is working properly even initially launched directly
    // through dart run.
    final toolTempDir =
        Platform.environment['CARGOKIT_TOOL_TEMP_DIR'] ?? targetTempDir;

    return {
      arKey: arValue,
      ccKey: ccValue,
      cfFlagsKey: cFlagsValue,
      cxxKey: cxxValue,
      cxxFlagsKey: cxxFlagsValue,
      ranlibKey: ranlibValue,
      rustFlagsKey: rustFlagsValue,
      linkerKey: selfPath,
      // Recognized by main() so we know when we're acting as a wrapper
      '_CARGOKIT_NDK_LINK_TARGET': targetArg,
      '_CARGOKIT_NDK_LINK_CLANG': ccValue,
      'CARGOKIT_TOOL_TEMP_DIR': toolTempDir,
    };
  }

  // Workaround for libgcc missing in NDK23, inspired by cargo-ndk
  String _libGccWorkaround(String buildDir, Version ndkVersion) {
    final workaroundDir = path.join(
      buildDir,
      'cargokit',
      'libgcc_workaround',
      '${ndkVersion.major}',
    );
    Directory(workaroundDir).createSync(recursive: true);
    if (ndkVersion.major >= 23) {
      File(path.join(workaroundDir, 'libgcc.a'))
          .writeAsStringSync('INPUT(-lunwind)');
    } else {
      // Other way around, untested, forward libgcc.a from libunwind once Rust
      // gets updated for NDK23+.
      File(path.join(workaroundDir, 'libunwind.a'))
          .writeAsStringSync('INPUT(-lgcc)');
    }

    var rustFlags = Platform.environment['CARGO_ENCODED_RUSTFLAGS'] ?? '';
    if (rustFlags.isNotEmpty) {
      rustFlags = '$rustFlags\x1f';
    }
    rustFlags = '$rustFlags-L\x1f$workaroundDir';
    return rustFlags;
  }
}
