import 'package:common/model/device.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/state/send/send_session_state.dart';

/// Abstract interface for a send-side transfer transport.
///
/// Mirrors the Rust `TransferSession` trait but at the Dart provider level,
/// including session state management, progress tracking, and UI coordination.
/// Both HTTP and QUIC providers implement this interface.
///
/// Downstream code (progress_page, send_tab_vm) should use
/// [TransferDispatcher] rather than referencing raw providers directly.
abstract class TransferService {
  /// Start a send session to [target] with the given [files].
  ///
  /// Handles the full flow: connect → prepare → send → finish,
  /// including UI navigation to send/progress pages.
  Future<void> startSession({
    required Device target,
    required List<CrossFile> files,
    required bool background,
  });

  /// Cancel an active session. The receiver is notified if possible.
  Future<void> cancelSession(String sessionId);

  /// Cancel a session that was cancelled by the receiver side.
  void cancelSessionByReceiver(String sessionId);

  /// Close a completed/failed session and clean up resources.
  void closeSession(String sessionId);

  /// Close all sessions.
  void clearAllSessions();

  /// Current active sessions managed by this transport.
  Map<String, SendSessionState> get sessions;

  /// Find a session for a given target device IP.
  SendSessionState? sessionForDevice(String ip);
}

/// Default implementation of [sessionForDevice] — searches sessions by target IP.
SendSessionState? findSessionForDevice(
  Map<String, SendSessionState> sessions,
  String ip,
) {
  for (final session in sessions.values) {
    if (session.target.ip == ip) return session;
  }
  return null;
}
