import 'dart:io';

import 'package:path/path.dart' as p;

/// Checks whether LocalSend can actually create files in [path].
///
/// A missing or unwritable destination previously led to transfers that
/// "finished" while silently dropping every file (e.g. when a Flatpak
/// sandbox lost access to the folder), so this is checked before accepting
/// an incoming transfer.
Future<bool> isDirectoryWritable(String path) async {
  try {
    final directory = Directory(path);
    if (!await directory.exists()) {
      return false;
    }
    final probe = File(p.join(path, '.localsend_write_probe_${DateTime.now().millisecondsSinceEpoch}'));
    await probe.create();
    await probe.delete();
    return true;
  } catch (_) {
    return false;
  }
}
