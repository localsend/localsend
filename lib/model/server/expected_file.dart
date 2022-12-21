import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/dto/file_dto.dart';

part 'expected_file.freezed.dart';

@freezed
class ExpectedFile with _$ExpectedFile {
  const factory ExpectedFile({
    required String token,
    required FileDto file,
    required String? tempPath, // file is saved to a temporary path first
  }) = _ExpectedFile;
}
