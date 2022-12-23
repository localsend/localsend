import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/dto/file_dto.dart';

part 'temp_request.freezed.dart';

@freezed
class TempRequest with _$TempRequest {
  const factory TempRequest({
    required Device sender,
    required Map<String, FileDto> files,
    required StreamController<bool> responseHandler, // use this to accept / decline the request
  }) = _TempRequest;
}
