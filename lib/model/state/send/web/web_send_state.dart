import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/state/send/web/web_send_file.dart';
import 'package:localsend_app/model/state/send/web/web_send_session.dart';

part 'web_send_state.freezed.dart';

@freezed
class WebSendState with _$WebSendState {
  const factory WebSendState({
    required Map<String, WebSendSession> sessions, // session id -> session data, also includes incoming requests
    required Map<String, WebSendFile> files, // file id as key
  }) = _WebSendState;
}
