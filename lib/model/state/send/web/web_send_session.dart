import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_send_session.freezed.dart';

@freezed
class WebSendSession with _$WebSendSession {
  const factory WebSendSession({
    required String sessionId,
    required StreamController<bool>? responseHandler, // used to accept or reject incoming requests
    required String ip,
    required String deviceInfo, // parsed from userAgent
  }) = _WebSendSession;
}
