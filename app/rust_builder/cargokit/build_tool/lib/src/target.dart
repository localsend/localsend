/// This is copied from Cargokit (which is the official way to use it currently)
/// Details: https://fzyzcjy.github.io/flutter_rust_bridge/manual/integrate/builtin

import 'dart:io';

import 'package:collection/collection.dart';

import 'util.dart';

class Target {
  Target({
    required this.rust,
    this.flutter,
    this.android,
    this.androidMinSdkVersion,
    this.darwinPlatform,
    this.darwinArch,
  });

  static final all = [
    Target(
      rust: 'armv7-linux-androideabi',
      flutter: 'android-arm',
      android: 'armeabi-v7a',
      androidMinSdkVersion: 16,
    ),
    Target(
      rust: 'aarch64-linux-android',
      flutter: 'android-arm64',
      android: 'arm64-v8a',
      androidMinSdkVersion: 21,
    ),
    Target(
      rust: 'i686-linux-android',
      flutter: 'android-x86',
      android: 'x86',
      androidMinSdkVersion: 16,
    ),
    Target(
      rust: 'x86_64-linux-android',
      flutter: 'android-x64',
      android: 'x86_64',
      androidMinSdkVersion: 21,
    ),
    Target(
      rust: 'x86_64-pc-windows-msvc',
      flutter: 'windows-x64',
    ),
    Target(
      rust: 'x86_64-unknown-linux-gnu',
      flutter: 'linux-x64',
    ),
    Target(
      rust: 'aarch64-unknown-linux-gnu',
      flutter: 'linux-arm64',
    ),
    Target(
      rust: 'x86_64-apple-darwin',
      darwinPlatform: 'macosx',
      darwinArch: 'x86_64',
    ),
    Target(
      rust: 'aarch64-apple-darwin',
      darwinPlatform: 'macosx',
      darwinArch: 'arm64',
    ),
    Target(
      rust: 'aarch64-apple-ios',
      darwinPlatform: 'iphoneos',
      darwinArch: 'arm64',
    ),
    Target(
      rust: 'aarch64-apple-ios-sim',
      darwinPlatform: 'iphonesimulator',
      darwinArch: 'arm64',
    ),
    Target(
      rust: 'x86_64-apple-ios',
      darwinPlatform: 'iphonesimulator',
      darwinArch: 'x86_64',
    ),
  ];

  static Target? forFlutterName(String flutterName) {
    return all.firstWhereOrNull((element) => element.flutter == flutterName);
  }

  static Target? forDarwin({
    required String platformName,
    required String darwinAarch,
  }) {
    return all.firstWhereOrNull((element) => //
        element.darwinPlatform == platformName &&
        element.darwinArch == darwinAarch);
  }

  static Target? forRustTriple(String triple) {
    return all.firstWhereOrNull((element) => element.rust == triple);
  }

  static List<Target> androidTargets() {
    return all
        .where((element) => element.android != null)
        .toList(growable: false);
  }

  /// Returns buildable targets on current host platform ignoring Android targets.
  static List<Target> buildableTargets() {
    if (Platform.isLinux) {
      // Right now we don't support cross-compiling on Linux. So we just return
      // the host target.
      final arch = runCommand('arch', []).stdout as String;
      if (arch.trim() == 'aarch64') {
        return [Target.forRustTriple('aarch64-unknown-linux-gnu')!];
      } else {
        return [Target.forRustTriple('x86_64-unknown-linux-gnu')!];
      }
    }
    return all.where((target) {
      if (Platform.isWindows) {
        return target.rust.contains('-windows-');
      } else if (Platform.isMacOS) {
        return target.darwinPlatform != null;
      }
      return false;
    }).toList(growable: false);
  }

  @override
  String toString() {
    return rust;
  }

  final String? flutter;
  final String rust;
  final String? android;
  final int? androidMinSdkVersion;
  final String? darwinPlatform;
  final String? darwinArch;
}
