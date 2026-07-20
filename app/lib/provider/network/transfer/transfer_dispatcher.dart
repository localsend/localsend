import 'dart:async';

import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/state/send/send_session_state.dart';
import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/provider/network/quic/quic_send_provider.dart';
import 'package:localsend_app/provider/network/quic/quic_server_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/network/transfer/transfer_service.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// Merged view of all send sessions across all transports.
///
/// Reads both [sendProvider] (HTTP) and [quicSendProvider] (QUIC)
/// and merges them into a single map. Downstream UI should use this
/// instead of reading individual transport providers.
///
/// Note: Uses [read] not [watch] — call from a build method or
/// watch the individual providers and merge yourself for reactivity.
Map<String, SendSessionState> getAllSendSessions(Ref ref) {
  return {...ref.read(sendProvider), ...ref.read(quicSendProvider)};
}

/// Picks the right transport for a given target device and routes
/// operations (start, cancel, close) to the owning provider.
///
/// Usage:
/// ```dart
/// // Start a session — auto-selects HTTP or QUIC
/// ref.read(transferDispatcherProvider).startSession(
///   target: device, files: files, background: false,
/// );
///
/// // Cancel — finds which transport owns the session
/// ref.read(transferDispatcherProvider).cancelSession(sessionId);
/// ```
final transferDispatcherProvider = Provider<TransferDispatcher>((ref) {
  return TransferDispatcher(ref);
});

/// Dispatches send operations to the correct transport provider.
///
/// Transport selection logic:
/// - If `device.supportsQuic && device.ip != null` → QUIC
/// - Otherwise → HTTP
///
/// Session routing: each session is owned by exactly one provider.
/// [cancelSession], [closeSession] probe both providers to find the owner.
class TransferDispatcher {
  final Ref _ref;

  TransferDispatcher(this._ref);

  // ─── Transport selection ─────────────────────────────────────────

  /// Whether a given target device should use QUIC transport.
  bool shouldUseQuic(Device target) {
    return target.supportsQuic && target.ip != null;
  }

  /// Returns the appropriate [TransferService] for a target device.
  TransferService serviceFor(Device target) {
    if (shouldUseQuic(target)) {
      return _quicService;
    }
    return _httpService;
  }

  // ─── Routed operations ───────────────────────────────────────────

  /// Start a send session. Auto-selects transport based on device capabilities.
  Future<void> startSession({
    required Device target,
    required List<CrossFile> files,
    required bool background,
  }) {
    return serviceFor(target).startSession(
      target: target,
      files: files,
      background: background,
    );
  }

  /// Cancel an active session. Routes to whichever provider owns it.
  Future<void> cancelSession(String sessionId) async {
    await _serviceForSession(sessionId)?.cancelSession(sessionId);
  }

  /// Cancel a session that was cancelled by the receiver.
  void cancelSessionByReceiver(String sessionId) {
    _serviceForSession(sessionId)?.cancelSessionByReceiver(sessionId);
  }

  /// Close a session and clean up. Routes to the owning provider.
  void closeSession(String sessionId) {
    _serviceForSession(sessionId)?.closeSession(sessionId);
  }

  /// Close all sessions across all transports.
  void clearAllSessions() {
    _httpService.clearAllSessions();
    _quicService.clearAllSessions();
  }

  /// Set background mode for an HTTP isolate-based session.
  /// No-op for QUIC sessions (they don't use isolates).
  void setBackground(String sessionId, bool background) {
    if (_httpService.sessions.containsKey(sessionId)) {
      _ref.notifier(sendProvider).setBackground(sessionId, background);
    }
  }

  // ─── Session lookup ──────────────────────────────────────────────

  /// Find a session across all transports by its ID.
  SendSessionState? session(String sessionId) {
    return _httpService.sessions[sessionId] ?? _quicService.sessions[sessionId];
  }

  /// Find a session for a given target IP across all transports.
  SendSessionState? sessionForDevice(String ip) {
    return _httpService.sessionForDevice(ip) ?? _quicService.sessionForDevice(ip);
  }

  // ─── Receive-side helpers ────────────────────────────────────────

  /// The active receive session, regardless of transport.
  /// Returns the HTTP session if active, otherwise the QUIC session.
  ReceiveSessionState? get receiveSession {
    return _ref.read(serverProvider)?.session ?? _ref.read(quicServerProvider)?.session;
  }

  /// Cancel the active receive session on whichever server owns it.
  Future<void> cancelReceiveSession() async {
    final httpSession = _ref.read(serverProvider)?.session;
    if (httpSession != null) {
      _ref.notifier(serverProvider).cancelSession();
      return;
    }
    final quicSession = _ref.read(quicServerProvider)?.session;
    if (quicSession != null) {
      await _ref.notifier(quicServerProvider).cancelSession();
    }
  }

  /// Close the active receive session on whichever server owns it.
  void closeReceiveSession() {
    final httpSession = _ref.read(serverProvider)?.session;
    if (httpSession != null) {
      _ref.notifier(serverProvider).closeSession();
      return;
    }
    final quicSession = _ref.read(quicServerProvider)?.session;
    if (quicSession != null) {
      _ref.notifier(quicServerProvider).closeSession();
    }
  }

  /// Whether the given session ID belongs to the HTTP send provider.
  /// Used by progress_page for HTTP-specific features (e.g. per-file retry).
  bool isHttpSendSession(String sessionId) {
    return _ref.read(sendProvider).containsKey(sessionId);
  }

  // ─── Internal ────────────────────────────────────────────────────

  TransferService get _httpService => _HttpTransferService(_ref);
  TransferService get _quicService => _QuicTransferService(_ref);

  TransferService? _serviceForSession(String sessionId) {
    if (_httpService.sessions.containsKey(sessionId)) return _httpService;
    if (_quicService.sessions.containsKey(sessionId)) return _quicService;
    return null;
  }
}

// ─── Transport-specific adapters ────────────────────────────────────

class _HttpTransferService implements TransferService {
  final Ref _ref;
  _HttpTransferService(this._ref);

  @override
  Map<String, SendSessionState> get sessions => _ref.read(sendProvider);

  @override
  Future<void> startSession({
    required Device target,
    required List<CrossFile> files,
    required bool background,
  }) => _ref
      .notifier(sendProvider)
      .startSession(
        target: target,
        files: files,
        background: background,
      );

  @override
  Future<void> cancelSession(String sessionId) async {
    _ref.notifier(sendProvider).cancelSession(sessionId);
  }

  @override
  void cancelSessionByReceiver(String sessionId) => _ref.notifier(sendProvider).cancelSessionByReceiver(sessionId);

  @override
  void closeSession(String sessionId) => _ref.notifier(sendProvider).closeSession(sessionId);

  @override
  void clearAllSessions() => _ref.notifier(sendProvider).clearAllSessions();

  @override
  SendSessionState? sessionForDevice(String ip) => findSessionForDevice(sessions, ip);
}

class _QuicTransferService implements TransferService {
  final Ref _ref;
  _QuicTransferService(this._ref);

  @override
  Map<String, SendSessionState> get sessions => _ref.read(quicSendProvider);

  @override
  Future<void> startSession({
    required Device target,
    required List<CrossFile> files,
    required bool background,
  }) => _ref
      .notifier(quicSendProvider)
      .startSession(
        target: target,
        files: files,
        background: background,
      );

  @override
  Future<void> cancelSession(String sessionId) async {
    await _ref.notifier(quicSendProvider).cancelSession(sessionId);
  }

  @override
  void cancelSessionByReceiver(String sessionId) {
    // QUIC doesn't have a separate cancelByReceiver yet — treat as cancel.
    // Fire-and-forget since the caller (HTTP cancel-by-receiver handler) is void.
    unawaited(_ref.notifier(quicSendProvider).cancelSession(sessionId));
  }

  @override
  void closeSession(String sessionId) => _ref.notifier(quicSendProvider).closeSession(sessionId);

  @override
  void clearAllSessions() => _ref.notifier(quicSendProvider).clearAllSessions();

  @override
  SendSessionState? sessionForDevice(String ip) => findSessionForDevice(sessions, ip);
}
