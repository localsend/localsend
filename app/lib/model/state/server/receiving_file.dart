import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/file_status.dart';

part 'receiving_file.mapper.dart';

@MappableClass()
class ReceivingFile with ReceivingFileMappable {
  final FileDto file;
  final FileStatus status;
  final String? token;
  final String? desiredName; // not null when accepted
  final String? path; // when finished
  final bool savedToGallery; // when finished
  final String? errorMessage; // when status == failed

  const ReceivingFile({
    required this.file,
    required this.status,
    required this.token,
    required this.desiredName,
    required this.path,
    required this.savedToGallery,
    required this.errorMessage,
  });
}
