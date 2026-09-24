import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:path/path.dart' as p;

/// Image file IDs mapped to their video file IDs. Only accepted, unambiguous
/// pairs are combined; matching uses the names chosen by the receiver.
Map<String, String> findLivePhotoPairs(Map<String, ReceivingFile> files) {
  final groups = <String, List<ReceivingFile>>{};
  for (final file in files.values) {
    final name = file.desiredName;
    if (name == null || (file.file.fileType != FileType.image && file.file.fileType != FileType.video)) continue;
    groups.putIfAbsent(p.withoutExtension(name), () => []).add(file);
  }
  final pairs = <String, String>{};
  for (final group in groups.values) {
    if (group.length != 2) continue;
    final images = group.where((f) => f.file.fileType == FileType.image);
    final videos = group.where((f) => f.file.fileType == FileType.video);
    if (images.length == 1 && videos.length == 1) pairs[images.single.file.id] = videos.single.file.id;
  }
  return pairs;
}

Set<String> findLivePhotoPairFileIds(Map<String, ReceivingFile> files) {
  final pairs = findLivePhotoPairs(files);
  return {...pairs.keys, ...pairs.values};
}
