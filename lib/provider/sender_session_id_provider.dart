import 'package:flutter_riverpod/flutter_riverpod.dart';

final senderSessionIdProvider = StateNotifierProvider<SenderSessionId, String>((ref) {
  return SenderSessionId();
});

class SenderSessionId extends StateNotifier<String> {
  SenderSessionId() : super("");
  void setSessionId(String sessionId) {
    state = sessionId;
  }
}