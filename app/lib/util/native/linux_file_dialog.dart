import 'package:flutter/services.dart';

/// Native file dialogs for Linux.
///
/// The Linux runner opens the dialog itself instead of relying on
/// `file_selector`: it asks the XDG desktop portal for the system file chooser
/// and falls back to the built-in GTK dialog when the portal is unavailable or
/// broken, so the picker never waits forever. Callers still fall back to
/// `file_selector` if the platform channel itself is unavailable.
const _channel = MethodChannel('org.localsend.localsend_app/file_dialog');

/// Opens the native file chooser.
///
/// Returns the selected paths, or an empty list when the user cancels.
/// Throws when the dialog cannot be shown.
Future<List<String>> openFilesLinux({
  required String title,
  required String acceptLabel,
  required String cancelLabel,
}) async {
  final result = await _channel.invokeMethod<List<dynamic>>(
    'openFiles',
    {
      'title': title,
      'acceptLabel': acceptLabel,
      'cancelLabel': cancelLabel,
    },
  );

  return (result ?? const <dynamic>[]).cast<String>();
}

/// Opens the native directory chooser.
///
/// Returns the selected path, or null when the user cancels.
/// Throws when the dialog cannot be shown.
Future<String?> pickDirectoryLinux({
  required String title,
  required String acceptLabel,
  required String cancelLabel,
}) async {
  final result = await _channel.invokeMethod<List<dynamic>>(
    'pickDirectory',
    {
      'title': title,
      'acceptLabel': acceptLabel,
      'cancelLabel': cancelLabel,
    },
  );

  if (result == null || result.isEmpty) {
    return null;
  }
  return result.first as String;
}
