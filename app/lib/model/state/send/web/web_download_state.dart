import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/send/web/web_download_file.dart';
import 'package:localsend_app/model/state/send/web/web_download_session.dart';

part 'web_download_state.mapper.dart';

@MappableClass()
class WebDownloadState with WebDownloadStateMappable {
  final Map<String, WebDownloadSession> sessions; // session id -> session data, also includes incoming requests
  final Map<String, WebDownloadFile> files; // file id as key
  final bool autoAccept; // automatically accept incoming requests

  const WebDownloadState({
    required this.sessions,
    required this.files,
    required this.autoAccept,
  });

  @override
  String toString() {
    return 'WebDownloadState(sessions: $sessions, files: <${files.keys}>, autoAccept: $autoAccept)';
  }
}
