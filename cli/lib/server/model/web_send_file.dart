import 'package:common/common.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'web_send_file.mapper.dart';

@MappableClass()
class WebSendFile with WebSendFileMappable {
  final FileDto file;
  final String? path; // android, iOS, desktop
  final List<int>? bytes; // web

  const WebSendFile({
    required this.file,
    required this.path,
    required this.bytes,
  });
}
