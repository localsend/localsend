import 'dart:io';

import 'package:localsend_app/model/cross_file.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

bool isMacosApp(Directory directory) => Platform.isMacOS && p.extension(p.normalize(directory.path)).toLowerCase() == '.app';

/// A selected app has no archive size until a transfer is started.
bool isPendingMacosAppArchive(CrossFile file) => file.size == -1 && file.path != null && isMacosApp(Directory(file.path!));

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

/// Creates a fresh snapshot for each transfer so a later selection cannot reuse stale contents.
Future<File> archiveMacosApp(Directory app, Directory cache) async {
  await cache.create(recursive: true);
  final directory = await cache.createTemp('app-');
  final archive = File(p.join(directory.path, '${p.basename(p.normalize(app.path))}.zip'));
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
    await directory.delete(recursive: true);
    rethrow;
  }
}
