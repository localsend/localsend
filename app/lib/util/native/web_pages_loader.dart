import 'dart:io';

import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_isolates/rust/api/server.dart' show WebPages;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

final _logger = Logger('WebPagesLoader');

/// Loads custom web pages from the `web` folder next to the executable
/// (e.g. `web/download.html`), so the served pages can be customized without
/// recompiling the app. Pages that are not provided fall back to the assets
/// embedded in the Rust server.
///
/// Returns `null` when no custom page exists (or on mobile platforms where
/// there is no folder next to the executable).
Future<WebPages?> loadCustomWebPages() async {
  if (!checkPlatformIsDesktop()) {
    return null;
  }

  final webDir = path.join(File(Platform.resolvedExecutable).parent.path, 'web');
  final downloadHtml = await _readOptionalFile(path.join(webDir, 'download.html'));
  final uploadHtml = await _readOptionalFile(path.join(webDir, 'upload.html'));
  final error403Html = await _readOptionalFile(path.join(webDir, 'error-403.html'));

  if (downloadHtml == null && uploadHtml == null && error403Html == null) {
    return null;
  }

  return WebPages(
    downloadHtml: downloadHtml,
    uploadHtml: uploadHtml,
    error403Html: error403Html,
  );
}

Future<String?> _readOptionalFile(String filePath) async {
  final file = File(filePath);
  try {
    if (!await file.exists()) {
      return null;
    }
    return await file.readAsString();
  } catch (e) {
    _logger.warning('Failed to read custom web page: $filePath', e);
    return null;
  }
}
