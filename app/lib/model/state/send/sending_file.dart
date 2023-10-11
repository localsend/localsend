import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/file_status.dart';

part 'sending_file.mapper.dart';

@MappableClass()
class SendingFile with SendingFileMappable {
  final FileDto file;
  final FileStatus status;
  final String? token;
  final String? path; // android, iOS, desktop
  final List<int>? bytes; // web
  final String? errorMessage; // when status == failed

  const SendingFile({
    required this.file,
    required this.status,
    required this.token,
    required this.path,
    required this.bytes,
    required this.errorMessage,
  });
}
