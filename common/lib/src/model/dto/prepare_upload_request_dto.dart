import 'package:common/src/model/dto/file_dto.dart';
import 'package:common/src/model/dto/info_register_dto.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'prepare_upload_request_dto.mapper.dart';

@MappableClass()
class PrepareUploadRequestDto with PrepareUploadRequestDtoMappable {
  final InfoRegisterDto info;
  final Map<String, FileDto> files;

  const PrepareUploadRequestDto({
    required this.info,
    required this.files,
  });

  static const fromJson = PrepareUploadRequestDtoMapper.fromJson;
}
