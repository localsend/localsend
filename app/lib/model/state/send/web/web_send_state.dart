import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/send/web/web_send_file.dart';
import 'package:localsend_app/model/state/send/web/web_send_session.dart';

part 'web_send_state.mapper.dart';

@MappableClass()
class WebSendState with WebSendStateMappable {
  final Map<String, WebSendSession> sessions; // session id -> session data, also includes incoming requests
  final Map<String, WebSendFile> files; // file id as key
  final bool autoAccept; // automatically accept incoming requests
  final String? pin;
  final Map<String, int> pinAttempts; // IP address -> attempts (will be reset on session end)

  const WebSendState({
    required this.sessions,
    required this.files,
    required this.autoAccept,
    required this.pin,
    required this.pinAttempts,
  });

  @override
  String toString() {
    return 'WebSendState(sessions: $sessions, files: <${files.keys}>, autoAccept: $autoAccept, pin: $pin, pinAttempts: $pinAttempts)';
  }
}
