import 'package:localsend_app/util/native/channel/android_channel.dart' as android_channel;
import 'package:logging/logging.dart';
import 'package:open_filex/open_filex.dart';

final _logger = Logger('OpenFolder');

/// Opens the folder and optionally selects the file in the folder.
Future<void> openFolder({
  required String folderPath,
  String? fileName,
}) async {
  if (folderPath.startsWith('content://')) {
    await android_channel.openContentUri(uri: folderPath);
    return;
  }

  if (!folderPath.endsWith('/')) {
    folderPath = '$folderPath/';
  }

  final result = await OpenFilex.open(folderPath);
  _logger.info('Open folder result: ${result.message}, path: $folderPath');
}
