import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';

part 'receiving_file.mapper.dart';

@MappableClass()
class ReceivingFile with ReceivingFileMappable {
  final FileDto file;
  final String? token;
  final String? desiredName; // not null when accepted
  final String? path; // when finished
  final bool savedToGallery; // when finished
  final String? errorMessage; // when failed; the live status is tracked in fileTransferProvider

  const ReceivingFile({
    required this.file,
    required this.token,
    required this.desiredName,
    required this.path,
    required this.savedToGallery,
    required this.errorMessage,
  });
}
