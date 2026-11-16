import 'dart:io';

import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:localsend_isolates/rust/frb_generated.dart';
import 'package:path/path.dart' as p;

Future<void> initRustLib() async {
  final config = RustLib.kDefaultExternalLibraryLoaderConfig;
  var ioDirectory = config.ioDirectory;

  if (Platform.isLinux) {
    final libDirectoryBesideExecutable = Directory(p.join(p.dirname(Platform.resolvedExecutable), 'lib'));
    final rustLibraryFile = File(p.join(libDirectoryBesideExecutable.path, 'lib${config.stem}.so'));
    if (rustLibraryFile.existsSync()) {
      ioDirectory = libDirectoryBesideExecutable.uri.toString();
    }
  }

  await RustLib.init(
    externalLibrary: await loadExternalLibrary(
      ExternalLibraryLoaderConfig(
        stem: config.stem,
        ioDirectory: ioDirectory,
        webPrefix: config.webPrefix,
        wasmBindgenName: config.wasmBindgenName,
      ),
    ),
  );
}
