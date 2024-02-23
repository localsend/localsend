import 'package:common/src/model/dto/file_dto.dart';
import 'package:common/src/model/dto/info_dto.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'receive_request_response_dto.mapper.dart';

@MappableClass()
class ReceiveRequestResponseDto with ReceiveRequestResponseDtoMappable {
  final InfoDto info;
  final String sessionId;
  final Map<String, FileDto> files;

  const ReceiveRequestResponseDto({
    required this.info,
    required this.sessionId,
    required this.files,
  });
}
