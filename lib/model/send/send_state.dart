import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/send/sending_file.dart';
import 'package:localsend_app/model/session_status.dart';

part 'send_state.freezed.dart';

@freezed
class SendState with _$SendState {
  const factory SendState({
    required SessionStatus status,
    required Device target,
    required Map<String, SendingFile> files, // file id as key
    required CancelToken? cancelToken,
  }) = _SendState;
}
