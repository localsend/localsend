import 'dart:io';

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
    print(e);
  }
}
