import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';

part 'receive_session_state.mapper.dart';

@MappableClass()
class ReceiveSessionState with ReceiveSessionStateMappable {
  final String sessionId;
  final SessionStatus status;
  final Device sender;

  // Might not be the same as sender.alias since it can be overridden as a favorite
  final String senderAlias;

  final Map<String, ReceivingFile> files; // file id as key
  final int? startTime;
  final int? endTime;
  final String destinationDirectory;
  final bool saveToGallery;
  final StreamController<Map<String, String>?>? responseHandler;

  const ReceiveSessionState({
    required this.sessionId,
    required this.status,
    required this.sender,
    required this.senderAlias,
    required this.files,
    required this.startTime,
    required this.endTime,
    required this.destinationDirectory,
    required this.saveToGallery,
    required this.responseHandler,
  });

  /// Returns the message of this request if this is a "message request".
  /// Message requests must contain a single text file with preview included.
  String? get message {
    final firstFile = files.values.first.file;
    return files.length == 1 && firstFile.fileType == FileType.text ? firstFile.preview : null;
  }

  /// Returns true if this request contains files having a directory path.
  /// "Save to gallery" is disabled for such requests.
  bool get containsDirectories {
    return files.values.any((f) => f.file.fileName.contains('/'));
  }
}
