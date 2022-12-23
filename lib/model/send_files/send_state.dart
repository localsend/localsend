import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/send_files/sending_file.dart';

part 'send_state.freezed.dart';

enum SendStatus {
  waiting,
  declined,
  sending,
  finished,
}

@freezed
class SendState with _$SendState {
  const factory SendState({
    required SendStatus status,
    required Device target,
    required Map<String, SendingFile> files, // file id as key
    required CancelToken? cancelToken,
  }) = _SendState;
}
