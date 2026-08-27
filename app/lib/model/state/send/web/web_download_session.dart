import 'package:dart_mappable/dart_mappable.dart';

part 'web_download_session.mapper.dart';

@MappableClass()
class WebDownloadSession with WebDownloadSessionMappable {
  final String sessionId;
  final bool pending; // true while waiting for the user to accept or reject the request
  final String ip;
  final String deviceInfo; // parsed from userAgent

  const WebDownloadSession({
    required this.sessionId,
    required this.pending,
    required this.ip,
    required this.deviceInfo,
  });
}
