import 'package:refena_flutter/refena_flutter.dart';

class AutoSendState {
  final bool inFlight;
  final String? lastError;

  const AutoSendState({
    this.inFlight = false,
    this.lastError,
  });

  AutoSendState copyWith({
    bool? inFlight,
    String? lastError,
    bool clearError = false,
  }) {
    return AutoSendState(
      inFlight: inFlight ?? this.inFlight,
      lastError: clearError ? null : (lastError ?? this.lastError),
    );
  }
}

/// Tracks auto-send to the first favorite (personal linked-PC mode).
final autoSendProvider = NotifierProvider<AutoSendService, AutoSendState>((ref) {
  return AutoSendService();
});

class AutoSendService extends Notifier<AutoSendState> {
  @override
  AutoSendState init() => const AutoSendState();

  void setInFlight(bool value) {
    state = state.copyWith(inFlight: value, clearError: value);
  }

  void setError(String error) {
    state = state.copyWith(inFlight: false, lastError: error);
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
