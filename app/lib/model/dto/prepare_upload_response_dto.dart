import 'package:dart_mappable/dart_mappable.dart';

part 'prepare_upload_response_dto.mapper.dart';

@MappableClass()
class PrepareUploadResponseDto with PrepareUploadResponseDtoMappable {
  final String sessionId;
  final Map<String, String> files;

  const PrepareUploadResponseDto({
    required this.sessionId,
    required this.files,
  });

  static const fromJson = PrepareUploadResponseDtoMapper.fromJson;
}
