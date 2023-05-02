import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'web_send_file.freezed.dart';

@freezed
class WebSendFile with _$WebSendFile {
  const factory WebSendFile({
    required FileDto file,
    required AssetEntity? asset, // for thumbnails
    required String? path, // android, iOS, desktop
    required List<int>? bytes, // web
  }) = _WebSendFile;
}
