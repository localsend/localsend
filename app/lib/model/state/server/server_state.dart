import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/state/send/web/web_send_state.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';

part 'server_state.freezed.dart';

@freezed
class ServerState with _$ServerState {
  const factory ServerState({
    required HttpServer httpServer,
    required String alias,
    required int port,
    required bool https,
    required ReceiveSessionState? session,
    required WebSendState? webSendState,
  }) = _ServerState;
}
