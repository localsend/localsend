import 'dart:async';

import 'package:common/model/device.dart';
import 'package:common/model/file_type.dart';
import 'package:common/model/session_status.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';

part 'receive_session_state.mapper.dart';

abstract class SessionState {
  SessionStatus get status;
  int? get startTime;
  int? get endTime;
}

@MappableClass()
class ReceiveSessionState with ReceiveSessionStateMappable implements SessionState {
  final String sessionId;

  @override
  final SessionStatus status;

  final Device sender;

  // Might not be the same as sender.alias since it can be overridden as a favorite
  final String senderAlias;

  final Map<String, ReceivingFile> files; // file id as key

  @override
  final int? startTime;

  @override
  final int? endTime;

  final String destinationDirectory;
  final String cacheDirectory;
  final bool saveToGallery;

  /// On Android, we need to manually create missing directories.
  /// To improve performance, we cache the created directories so we don't need to check them again.
  /// WARNING: This list is modified in-place!
  final Set<String> createdDirectories;

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
    required this.cacheDirectory,
    required this.saveToGallery,
    required this.createdDirectories,
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
