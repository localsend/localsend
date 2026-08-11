/// This is copied from Cargokit (which is the official way to use it currently)
/// Details: https://fzyzcjy.github.io/flutter_rust_bridge/manual/integrate/builtin

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as path;

class CrateHash {
  /// Computes a hash uniquely identifying crate content. This takes into account
  /// content all all .rs files inside the src directory, as well as Cargo.toml,
  /// Cargo.lock, build.rs and cargokit.yaml.
  ///
  /// If [tempStorage] is provided, computed hash is stored in a file in that directory
  /// and reused on subsequent calls if the crate content hasn't changed.
  static String compute(String manifestDir, {String? tempStorage}) {
    return CrateHash._(
      manifestDir: manifestDir,
      tempStorage: tempStorage,
    )._compute();
  }

  CrateHash._({
    required this.manifestDir,
    required this.tempStorage,
  });

  String _compute() {
    final files = getFiles();
    final tempStorage = this.tempStorage;
    if (tempStorage != null) {
      final quickHash = _computeQuickHash(files);
      final quickHashFolder = Directory(path.join(tempStorage, 'crate_hash'));
      quickHashFolder.createSync(recursive: true);
      final quickHashFile = File(path.join(quickHashFolder.path, quickHash));
      if (quickHashFile.existsSync()) {
        return quickHashFile.readAsStringSync();
      }
      final hash = _computeHash(files);
      quickHashFile.writeAsStringSync(hash);
      return hash;
    } else {
      return _computeHash(files);
    }
  }

  /// Computes a quick hash based on files stat (without reading contents). This
  /// is used to cache the real hash, which is slower to compute since it involves
  /// reading every single file.
  String _computeQuickHash(List<File> files) {
    final output = AccumulatorSink<Digest>();
    final input = sha256.startChunkedConversion(output);

    final data = ByteData(8);
    for (final file in files) {
      input.add(utf8.encode(file.path));
      final stat = file.statSync();
      data.setUint64(0, stat.size);
      input.add(data.buffer.asUint8List());
      data.setUint64(0, stat.modified.millisecondsSinceEpoch);
      input.add(data.buffer.asUint8List());
    }

    input.close();
    return base64Url.encode(output.events.single.bytes);
  }

  String _computeHash(List<File> files) {
    final output = AccumulatorSink<Digest>();
    final input = sha256.startChunkedConversion(output);

    void addTextFile(File file) {
      // text Files are hashed by lines in case we're dealing with github checkout
      // that auto-converts line endings.
      final splitter = LineSplitter();
      if (file.existsSync()) {
        final data = file.readAsStringSync();
        final lines = splitter.convert(data);
        for (final line in lines) {
          input.add(utf8.encode(line));
        }
      }
    }

    for (final file in files) {
      addTextFile(file);
    }

    input.close();
    final res = output.events.single;

    // Truncate to 128bits.
    final hash = res.bytes.sublist(0, 16);
    return hex.encode(hash);
  }

  List<File> getFiles() {
    final src = Directory(path.join(manifestDir, 'src'));
    final files = src
        .listSync(recursive: true, followLinks: false)
        .whereType<File>()
        .toList();
    files.sortBy((element) => element.path);
    void addFile(String relative) {
      final file = File(path.join(manifestDir, relative));
      if (file.existsSync()) {
        files.add(file);
      }
    }

    addFile('Cargo.toml');
    addFile('Cargo.lock');
    addFile('build.rs');
    addFile('cargokit.yaml');
    return files;
  }

  final String manifestDir;
  final String? tempStorage;
}
