import 'package:common/model/file_type.dart';
import 'package:pasteboard/pasteboard.dart';

bool canCopyImageToClipboard({
  required String? path,
  required FileType fileType,
  required bool isDesktop,
}) {
  if (!isDesktop) return false;
  if (path == null || path.isEmpty) return false;
  return fileType == FileType.image;
}

Future<bool> copyImageToClipboard(String filePath) async {
  try {
    await Pasteboard.writeFiles([filePath]);
    return true;
  } catch (_) {
    return false;
  }
}
