import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_state.freezed.dart';

@freezed
class ServerState with _$ServerState {
  const factory ServerState({
    required HttpServer httpServer,
    required String alias,
    required int port,
  }) = _ServerState;
}
