import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/server/receive_state.dart';

part 'server_state.freezed.dart';

@freezed
class ServerState with _$ServerState {
  const factory ServerState({
    required HttpServer httpServer,
    required String alias,
    required int port,
    required ReceiveState? receiveState,
  }) = _ServerState;
}
