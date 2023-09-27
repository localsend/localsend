import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/model/state/send/sending_file.dart';

part 'send_session_state.freezed.dart';

@freezed
class SendSessionState with _$SendSessionState {
  const factory SendSessionState({
    required String sessionId,
    required String? remoteSessionId, // v2
    required bool background,
    required SessionStatus status,
    required Device target,
    required Map<String, SendingFile> files, // file id as key
    required int? startTime,
    required int? endTime,
    required CancelToken? cancelToken,
    required String? errorMessage,
  }) = _SendSessionState;
}
