import 'package:open_filex/open_filex.dart';

/// Opens the selected file which is stored on the device.
Future<void> openFolder(String path) async {
  if (!path.endsWith('/')) {
    path = '$path/';
  }
  final result = await OpenFilex.open(path);
  print('Open folder result: ${result.message}, path: $path');
}
