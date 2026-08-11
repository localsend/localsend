import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/send/web/web_send_state.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';

part 'server_state.mapper.dart';

@MappableClass()
class ServerState with ServerStateMappable {
  final String alias;
  final int port;
  final bool https;
  final ReceiveSessionState? session;
  final WebSendState? webSendState;

  /// Whether the upload page is served so web browsers can upload files.
  final bool webUpload;

  /// Optional session-scoped PIN of the active web share mode (download or upload page).
  /// The PIN is enforced by the Rust server; changing it requires a server restart.
  final String? webPin;

  const ServerState({
    required this.alias,
    required this.port,
    required this.https,
    required this.session,
    required this.webSendState,
    required this.webUpload,
    required this.webPin,
  });

  @override
  String toString() {
    return 'ServerState(alias: $alias, port: $port, https: $https, session: $session, webSendState: $webSendState, webUpload: $webUpload, webPin: $webPin)';
  }
}
