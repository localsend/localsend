import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';

part 'receive_session_state.freezed.dart';

@freezed
class ReceiveSessionState with _$ReceiveSessionState {
  const ReceiveSessionState._(); // allow custom getters

  const factory ReceiveSessionState({
    required String sessionId,
    required SessionStatus status,
    required Device sender,
    required Map<String, ReceivingFile> files,
    required int? startTime,
    required int? endTime,
    required String destinationDirectory,
    required bool saveToGallery,

    // use this to accept / decline the request, empty map == decline
    // FileId -> File Name
    required StreamController<Map<String, String>?>? responseHandler,
  }) = _ReceiveSessionState;

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
