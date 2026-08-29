import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/send/web/web_download_state.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/model/state/server/web_share_state.dart';

part 'server_state.mapper.dart';

@MappableClass()
class ServerState with ServerStateMappable {
  final String alias;
  final int port;
  final bool https;
  final ReceiveSessionState? session;

  /// Which web share is active (download or upload page). `null` when disabled.
  final WebShareState? web;

  const ServerState({
    required this.alias,
    required this.port,
    required this.https,
    required this.session,
    required this.web,
  });

  /// The web download state while the download page is served.
  WebDownloadState? get webDownloadState => switch (web) {
    WebShareDownload(:final state) => state,
    _ => null,
  };

  /// Whether the upload page is served so web browsers can upload files.
  bool get webUpload => web is WebShareUpload;

  /// Returns a copy with the [WebDownloadState] of the active download share updated.
  /// Returns this state unchanged when the download page is not active.
  ServerState updateWebDownloadState(WebDownloadState Function(WebDownloadState state) update) {
    return switch (web) {
      WebShareDownload(:final state, :final pin) => copyWith(
        web: WebShareDownload(state: update(state), pin: pin),
      ),
      _ => this,
    };
  }

  @override
  String toString() {
    return 'ServerState(alias: $alias, port: $port, https: $https, session: $session, web: $web)';
  }
}
