/// This is copied from Cargokit (which is the official way to use it currently)
/// Details: https://fzyzcjy.github.io/flutter_rust_bridge/manual/integrate/builtin

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart';
import 'package:hex/hex.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:source_span/source_span.dart';
import 'package:yaml/yaml.dart';

import 'builder.dart';
import 'environment.dart';
import 'rustup.dart';

final _log = Logger('options');

/// A class for exceptions that have source span information attached.
class SourceSpanException implements Exception {
  // This is a getter so that subclasses can override it.
  /// A message describing the exception.
  String get message => _message;
  final String _message;

  // This is a getter so that subclasses can override it.
  /// The span associated with this exception.
  ///
  /// This may be `null` if the source location can't be determined.
  SourceSpan? get span => _span;
  final SourceSpan? _span;

  SourceSpanException(this._message, this._span);

  /// Returns a string representation of `this`.
  ///
  /// [color] may either be a [String], a [bool], or `null`. If it's a string,
  /// it indicates an ANSI terminal color escape that should be used to
  /// highlight the span's text. If it's `true`, it indicates that the text
  /// should be highlighted using the default color. If it's `false` or `null`,
  /// it indicates that the text shouldn't be highlighted.
  @override
  String toString({Object? color}) {
    if (span == null) return message;
    return 'Error on ${span!.message(message, color: color)}';
  }
}

enum Toolchain {
  stable,
  beta,
  nightly,
}

class CargoBuildOptions {
  final Toolchain toolchain;
  final List<String> flags;

  CargoBuildOptions({
    required this.toolchain,
    required this.flags,
  });

  static Toolchain _toolchainFromNode(YamlNode node) {
    if (node case YamlScalar(value: String name)) {
      final toolchain =
          Toolchain.values.firstWhereOrNull((element) => element.name == name);
      if (toolchain != null) {
        return toolchain;
      }
    }
    throw SourceSpanException(
        'Unknown toolchain. Must be one of ${Toolchain.values.map((e) => e.name)}.',
        node.span);
  }

  static CargoBuildOptions parse(YamlNode node) {
    if (node is! YamlMap) {
      throw SourceSpanException('Cargo options must be a map', node.span);
    }
    Toolchain toolchain = Toolchain.stable;
    List<String> flags = [];
    for (final MapEntry(:key, :value) in node.nodes.entries) {
      if (key case YamlScalar(value: 'toolchain')) {
        toolchain = _toolchainFromNode(value);
      } else if (key case YamlScalar(value: 'extra_flags')) {
        if (value case YamlList(nodes: List<YamlNode> list)) {
          if (list.every((element) {
            if (element case YamlScalar(value: String _)) {
              return true;
            }
            return false;
          })) {
            flags = list.map((e) => e.value as String).toList();
            continue;
          }
        }
        throw SourceSpanException(
            'Extra flags must be a list of strings', value.span);
      } else {
        throw SourceSpanException(
            'Unknown cargo option type. Must be "toolchain" or "extra_flags".',
            key.span);
      }
    }
    return CargoBuildOptions(toolchain: toolchain, flags: flags);
  }
}

extension on YamlMap {
  /// Map that extracts keys so that we can do map case check on them.
  Map<dynamic, YamlNode> get valueMap =>
      nodes.map((key, value) => MapEntry(key.value, value));
}

class PrecompiledBinaries {
  final String uriPrefix;
  final PublicKey publicKey;

  PrecompiledBinaries({
    required this.uriPrefix,
    required this.publicKey,
  });

  static PublicKey _publicKeyFromHex(String key, SourceSpan? span) {
    final bytes = HEX.decode(key);
    if (bytes.length != 32) {
      throw SourceSpanException(
          'Invalid public key. Must be 32 bytes long.', span);
    }
    return PublicKey(bytes);
  }

  static PrecompiledBinaries parse(YamlNode node) {
    if (node case YamlMap(valueMap: Map<dynamic, YamlNode> map)) {
      if (map
          case {
            'url_prefix': YamlNode urlPrefixNode,
            'public_key': YamlNode publicKeyNode,
          }) {
        final urlPrefix = switch (urlPrefixNode) {
          YamlScalar(value: String urlPrefix) => urlPrefix,
          _ => throw SourceSpanException(
              'Invalid URL prefix value.', urlPrefixNode.span),
        };
        final publicKey = switch (publicKeyNode) {
          YamlScalar(value: String publicKey) =>
            _publicKeyFromHex(publicKey, publicKeyNode.span),
          _ => throw SourceSpanException(
              'Invalid public key value.', publicKeyNode.span),
        };
        return PrecompiledBinaries(
          uriPrefix: urlPrefix,
          publicKey: publicKey,
        );
      }
    }
    throw SourceSpanException(
        'Invalid precompiled binaries value. '
        'Expected Map with "url_prefix" and "public_key".',
        node.span);
  }
}

/// Cargokit options specified for Rust crate.
class CargokitCrateOptions {
  CargokitCrateOptions({
    this.cargo = const {},
    this.precompiledBinaries,
  });

  final Map<BuildConfiguration, CargoBuildOptions> cargo;
  final PrecompiledBinaries? precompiledBinaries;

  static CargokitCrateOptions parse(YamlNode node) {
    if (node is! YamlMap) {
      throw SourceSpanException('Cargokit options must be a map', node.span);
    }
    final options = <BuildConfiguration, CargoBuildOptions>{};
    PrecompiledBinaries? precompiledBinaries;

    for (final entry in node.nodes.entries) {
      if (entry
          case MapEntry(
            key: YamlScalar(value: 'cargo'),
            value: YamlNode node,
          )) {
        if (node is! YamlMap) {
          throw SourceSpanException('Cargo options must be a map', node.span);
        }
        for (final MapEntry(:YamlNode key, :value) in node.nodes.entries) {
          if (key case YamlScalar(value: String name)) {
            final configuration = BuildConfiguration.values
                .firstWhereOrNull((element) => element.name == name);
            if (configuration != null) {
              options[configuration] = CargoBuildOptions.parse(value);
              continue;
            }
          }
          throw SourceSpanException(
              'Unknown build configuration. Must be one of ${BuildConfiguration.values.map((e) => e.name)}.',
              key.span);
        }
      } else if (entry.key case YamlScalar(value: 'precompiled_binaries')) {
        precompiledBinaries = PrecompiledBinaries.parse(entry.value);
      } else {
        throw SourceSpanException(
            'Unknown cargokit option type. Must be "cargo" or "precompiled_binaries".',
            entry.key.span);
      }
    }
    return CargokitCrateOptions(
      cargo: options,
      precompiledBinaries: precompiledBinaries,
    );
  }

  static CargokitCrateOptions load({
    required String manifestDir,
  }) {
    final uri = Uri.file(path.join(manifestDir, "cargokit.yaml"));
    final file = File.fromUri(uri);
    if (file.existsSync()) {
      final contents = loadYamlNode(file.readAsStringSync(), sourceUrl: uri);
      return parse(contents);
    } else {
      return CargokitCrateOptions();
    }
  }
}

class CargokitUserOptions {
  // When Rustup is installed always build locally unless user opts into
  // using precompiled binaries.
  static bool defaultUsePrecompiledBinaries() {
    return Rustup.executablePath() == null;
  }

  CargokitUserOptions({
    required this.usePrecompiledBinaries,
    required this.verboseLogging,
  });

  CargokitUserOptions._()
      : usePrecompiledBinaries = defaultUsePrecompiledBinaries(),
        verboseLogging = false;

  static CargokitUserOptions parse(YamlNode node) {
    if (node is! YamlMap) {
      throw SourceSpanException('Cargokit options must be a map', node.span);
    }
    bool usePrecompiledBinaries = defaultUsePrecompiledBinaries();
    bool verboseLogging = false;

    for (final entry in node.nodes.entries) {
      if (entry.key case YamlScalar(value: 'use_precompiled_binaries')) {
        if (entry.value case YamlScalar(value: bool value)) {
          usePrecompiledBinaries = value;
          continue;
        }
        throw SourceSpanException(
            'Invalid value for "use_precompiled_binaries". Must be a boolean.',
            entry.value.span);
      } else if (entry.key case YamlScalar(value: 'verbose_logging')) {
        if (entry.value case YamlScalar(value: bool value)) {
          verboseLogging = value;
          continue;
        }
        throw SourceSpanException(
            'Invalid value for "verbose_logging". Must be a boolean.',
            entry.value.span);
      } else {
        throw SourceSpanException(
            'Unknown cargokit option type. Must be "use_precompiled_binaries" or "verbose_logging".',
            entry.key.span);
      }
    }
    return CargokitUserOptions(
      usePrecompiledBinaries: usePrecompiledBinaries,
      verboseLogging: verboseLogging,
    );
  }

  static CargokitUserOptions load() {
    String fileName = "cargokit_options.yaml";
    var userProjectDir = Directory(Environment.rootProjectDir);

    while (userProjectDir.parent.path != userProjectDir.path) {
      final configFile = File(path.join(userProjectDir.path, fileName));
      if (configFile.existsSync()) {
        final contents = loadYamlNode(
          configFile.readAsStringSync(),
          sourceUrl: configFile.uri,
        );
        final res = parse(contents);
        if (res.verboseLogging) {
          _log.info('Found user options file at ${configFile.path}');
        }
        return res;
      }
      userProjectDir = userProjectDir.parent;
    }
    return CargokitUserOptions._();
  }

  final bool usePrecompiledBinaries;
  final bool verboseLogging;
}
