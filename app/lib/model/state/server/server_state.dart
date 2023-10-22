import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/send/web/web_send_state.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';

part 'server_state.mapper.dart';

@MappableClass()
class ServerState with ServerStateMappable {
  final HttpServer httpServer;
  final String alias;
  final int port;
  final bool https;
  final ReceiveSessionState? session;
  final WebSendState? webSendState;

  const ServerState({
    required this.httpServer,
    required this.alias,
    required this.port,
    required this.https,
    required this.session,
    required this.webSendState,
  });
}
