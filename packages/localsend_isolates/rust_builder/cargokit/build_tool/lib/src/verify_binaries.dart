/// This is copied from Cargokit (which is the official way to use it currently)
/// Details: https://fzyzcjy.github.io/flutter_rust_bridge/manual/integrate/builtin

import 'dart:io';

import 'package:ed25519_edwards/ed25519_edwards.dart';
import 'package:http/http.dart';

import 'artifacts_provider.dart';
import 'cargo.dart';
import 'crate_hash.dart';
import 'options.dart';
import 'precompile_binaries.dart';
import 'target.dart';

class VerifyBinaries {
  VerifyBinaries({
    required this.manifestDir,
  });

  final String manifestDir;

  Future<void> run() async {
    final crateInfo = CrateInfo.load(manifestDir);

    final config = CargokitCrateOptions.load(manifestDir: manifestDir);
    final precompiledBinaries = config.precompiledBinaries;
    if (precompiledBinaries == null) {
      stdout.writeln('Crate does not support precompiled binaries.');
    } else {
      final crateHash = CrateHash.compute(manifestDir);
      stdout.writeln('Crate hash: $crateHash');

      for (final target in Target.all) {
        final message = 'Checking ${target.rust}...';
        stdout.write(message.padRight(40));
        stdout.flush();

        final artifacts = getArtifactNames(
          target: target,
          libraryName: crateInfo.packageName,
          remote: true,
        );

        final prefix = precompiledBinaries.uriPrefix;

        bool ok = true;

        for (final artifact in artifacts) {
          final fileName = PrecompileBinaries.fileName(target, artifact);
          final signatureFileName =
              PrecompileBinaries.signatureFileName(target, artifact);

          final url = Uri.parse('$prefix$crateHash/$fileName');
          final signatureUrl =
              Uri.parse('$prefix$crateHash/$signatureFileName');

          final signature = await get(signatureUrl);
          if (signature.statusCode != 200) {
            stdout.writeln('MISSING');
            ok = false;
            break;
          }
          final asset = await get(url);
          if (asset.statusCode != 200) {
            stdout.writeln('MISSING');
            ok = false;
            break;
          }

          if (!verify(precompiledBinaries.publicKey, asset.bodyBytes,
              signature.bodyBytes)) {
            stdout.writeln('INVALID SIGNATURE');
            ok = false;
          }
        }

        if (ok) {
          stdout.writeln('OK');
        }
      }
    }
  }
}
