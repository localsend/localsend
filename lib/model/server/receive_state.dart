import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/server/receiving_file.dart';

part 'receive_state.freezed.dart';

@freezed
class ReceiveState with _$ReceiveState {
  const factory ReceiveState({
    required Device sender,
    required Map<String, ReceivingFile> files,
  }) = _ReceiveState;
}
