import 'dart:io';

import 'package:logging/logging.dart';

final _logger = Logger('CmdHelper');

/// Runs [commands] in cmd having admin privileges.
Future<void> runWindowsCommandAsAdmin(List<String> commands) async {
  try {
    final joinedCommands = commands.join(' & ');
    await Process.run(
      'powershell',
      [
        '-Command',
        "Start-Process -Verb RunAs cmd.exe -Args '/c', '$joinedCommands & echo. & pause'",
      ],
    );
  } catch (e) {
    _logger.warning('Could not run command as admin', e);
  }
}
