import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/dto/file_dto.dart';

part 'sending_file.freezed.dart';

@freezed
class SendingFile with _$SendingFile {
  const factory SendingFile({
    required FileDto file,
    required Future<Uint8List> Function() read,
    required String? token,
  }) = _SendingFile;
}
