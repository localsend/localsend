import 'dart:typed_data';

import 'package:common/common.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'sending_file.mapper.dart';

@MappableClass()
class SendingFile with SendingFileMappable {
  final FileDto file;
  final FileStatus status;
  final String? token;
  final Uint8List? thumbnail;
  final String? path; // android, iOS, desktop
  final List<int>? bytes; // web
  final String? errorMessage; // when status == failed

  const SendingFile({
    required this.file,
    required this.status,
    required this.token,
    required this.thumbnail,
    required this.path,
    required this.bytes,
    required this.errorMessage,
  });

  /// Custom toString() to avoid printing the bytes.
  @override
  String toString() {
    return 'SendingFile(file: $file, status: $status, token: $token, thumbnail: ${thumbnail != null ? thumbnail!.length : 'null'},  path: $path, bytes: ${bytes != null ? bytes!.length : 'null'}, errorMessage: $errorMessage)';
  }
}
