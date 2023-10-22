import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';

part 'web_send_session.mapper.dart';

@MappableClass()
class WebSendSession with WebSendSessionMappable {
  final String sessionId;
  final StreamController<bool>? responseHandler; // used to accept or reject incoming requests
  final String ip;
  final String deviceInfo; // parsed from userAgent

  const WebSendSession({
    required this.sessionId,
    required this.responseHandler,
    required this.ip,
    required this.deviceInfo,
  });
}
