import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'web_send_file.mapper.dart';

@MappableClass()
class WebSendFile with WebSendFileMappable {
  final FileDto file;
  final AssetEntity? asset; // for thumbnails
  final String? path; // android, iOS, desktop
  final List<int>? bytes; // web

  const WebSendFile({
    required this.file,
    required this.asset,
    required this.path,
    required this.bytes,
  });
}
