import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/server/receiving_file.dart';
import 'package:localsend_app/model/session_status.dart';

part 'receive_state.freezed.dart';

@freezed
class ReceiveState with _$ReceiveState {
  const factory ReceiveState({
    required SessionStatus status,
    required Device sender,
    required Map<String, ReceivingFile> files,
    required int? startTime,
    required int? endTime,
    required String destinationDirectory,
    required StreamController<bool>? responseHandler, // use this to accept / decline the request
  }) = _ReceiveState;
}
