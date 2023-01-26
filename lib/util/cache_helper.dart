import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

/// Clears the cache.
/// It is written in a "fire-and-forget" way, so we don't need to wait until everything is cleared.
void clearCache({bool onlyFilePicker = false}) {
  if (onlyFilePicker) {
    FilePicker.platform.clearTemporaryFiles().catchError((error) {
      print(error);
    });
    return;
  }
  getTemporaryDirectory().then((cacheDir) {
    cacheDir.delete(recursive: true).catchError((error) {
      print(error);
    });
  }).catchError((error) {
    print(error);
  });
}
