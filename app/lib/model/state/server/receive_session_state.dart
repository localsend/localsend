import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_app/util/message_preview.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/session_status.dart';

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
  });

  /// Returns the message of this request if this is a "message request".
  /// Message requests must contain a single small text file with preview included.
  /// Older peers may embed an entire large text file; receive it as a file
  /// instead of laying it out as one paragraph in the message dialog.
  String? get message => extractMessagePreview(files.values.map((f) => f.file));

  /// Returns true if this is a "message request", even if it is too large for [message].
  /// See [isMessageRequestOf].
  bool get isMessageRequest => isMessageRequestOf(files.values.map((f) => f.file));

  /// Returns true if this request contains files having a directory path.
  /// "Save to gallery" is disabled for such requests.
  bool get containsDirectories {
    return files.values.any((f) => f.file.fileName.contains('/'));
  }
}
