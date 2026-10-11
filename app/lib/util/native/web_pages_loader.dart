import 'dart:io';

import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_isolates/rust/api/server.dart' show WebPages;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

final _logger = Logger('WebPagesLoader');

/// Loads custom web pages from the `web` folder next to the executable
/// (e.g. `web/download.html`), so the served pages can be customized without
/// recompiling the app. Pages that are not provided fall back to the assets
/// embedded in the Rust server (also on mobile platforms where there is no
/// folder next to the executable).
Future<WebPages> loadCustomWebPages() async {
  if (!checkPlatformIsDesktop()) {
    return const WebPages();
  }

  final webDir = path.join(File(Platform.resolvedExecutable).parent.path, 'web');
  return WebPages(
    downloadHtml: await _readOptionalFile(path.join(webDir, 'download.html')),
    uploadHtml: await _readOptionalFile(path.join(webDir, 'upload.html')),
    error403Html: await _readOptionalFile(path.join(webDir, 'error-403.html')),
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
