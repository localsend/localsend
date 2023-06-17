import 'package:logging/logging.dart';
import 'package:open_filex/open_filex.dart';

final _logger = Logger('OpenFolder');

/// Opens the selected file which is stored on the device.
Future<void> openFolder(String path) async {
  if (!path.endsWith('/')) {
    path = '$path/';
  }
  final result = await OpenFilex.open(path);
  _logger.info('Open folder result: ${result.message}, path: $path');
}
