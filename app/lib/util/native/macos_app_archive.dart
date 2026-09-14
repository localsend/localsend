import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

bool isMacosApp(Directory directory) => Platform.isMacOS && p.extension(p.normalize(directory.path)).toLowerCase() == '.app';

/// Keeps application bundles intact instead of enumerating their contents.
Stream<FileSystemEntity> listSendingEntries(Directory directory, {Set<String> ancestors = const {}}) async* {
  if (!Platform.isMacOS) {
    yield* directory.list(recursive: true);
  } else if (isMacosApp(directory)) {
    yield directory;
  } else {
    final resolved = await directory.resolveSymbolicLinks();
    if (ancestors.contains(resolved)) {
      return;
    }
    await for (final entry in directory.list()) {
      if (entry is Directory) {
        yield* listSendingEntries(entry, ancestors: {...ancestors, resolved});
      } else {
        yield entry;
      }
    }
  }
}

Future<Directory> macosAppArchiveCache() async => Directory(p.join((await getTemporaryDirectory()).path, 'localsend-app-archives'));

/// Reuses the snapshot while selected, including when sending to several peers.
Future<File> archiveMacosApp(Directory app, Directory cache) async {
  final id = sha256.convert(utf8.encode(p.normalize(app.absolute.path))).toString();
  final directory = Directory(p.join(cache.path, id));
  final archive = File(p.join(directory.path, '${p.basename(p.normalize(app.path))}.zip'));
  if (await archive.exists()) {
    return archive;
  }

  await directory.create(recursive: true);
  final pending = File('${archive.path}.partial');
  try {
    final result = await Process.run('/usr/bin/ditto', [
      '-c',
      '-k',
      '--rsrc',
      '--extattr',
      '--qtn',
      '--sequesterRsrc',
      '--keepParent',
      app.absolute.path,
      pending.absolute.path,
    ]);
    if (result.exitCode != 0) {
      throw FileSystemException('Could not archive application: ${result.stderr}', app.path);
    }
    return await pending.rename(archive.path);
  } catch (_) {
    if (await pending.exists()) {
      await pending.delete();
    }
    rethrow;
  }
}
