import 'package:dart_mappable/dart_mappable.dart';

part 'web_send_session.mapper.dart';

@MappableClass()
class WebSendSession with WebSendSessionMappable {
  final String sessionId;
  final bool pending; // true while waiting for the user to accept or reject the request
  final String ip;
  final String deviceInfo; // parsed from userAgent

  const WebSendSession({
    required this.sessionId,
    required this.pending,
    required this.ip,
    required this.deviceInfo,
  });
}
