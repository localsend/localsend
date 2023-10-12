import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/send/web/web_send_file.dart';
import 'package:localsend_app/model/state/send/web/web_send_session.dart';

part 'web_send_state.mapper.dart';

@MappableClass()
class WebSendState with WebSendStateMappable {
  final Map<String, WebSendSession> sessions; // session id -> session data, also includes incoming requests
  final Map<String, WebSendFile> files; // file id as key

  const WebSendState({
    required this.sessions,
    required this.files,
  });
}
