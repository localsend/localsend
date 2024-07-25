import 'package:localsend_app/util/native/android_saf.dart';
import 'package:logging/logging.dart';
import 'package:open_filex/open_filex.dart';

final _logger = Logger('OpenFolder');

/// Opens the selected file which is stored on the device.
Future<void> openFolder(String path) async {
  if (path.startsWith('content://')) {
    await openContentUri(uri: path);
    return;
  }

  if (!path.endsWith('/')) {
    path = '$path/';
  }
  final result = await OpenFilex.open(path);
  _logger.info('Open folder result: ${result.message}, path: $path');
}
