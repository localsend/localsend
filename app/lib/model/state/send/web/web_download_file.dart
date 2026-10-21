import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_isolates/model/content_source.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'web_download_file.mapper.dart';

@MappableClass()
class WebDownloadFile with WebDownloadFileMappable {
  final FileDto file;
  final AssetEntity? asset; // for thumbnails
  final ContentSource source;
  String? get path => source.path; // android, iOS, desktop
  List<int>? get bytes => source.bytes; // web

  const WebDownloadFile({
    required this.file,
    required this.asset,
    required this.source,
  });
}
