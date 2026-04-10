import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/chat/chat_message.dart';

part 'chat_state.mapper.dart';

@MappableClass()
class ChatState with ChatStateMappable {
  /// Messages grouped by peer device fingerprint.
  final Map<String, List<ChatMessage>> messages;

  /// Total number of unread received messages across all conversations.
  /// Kept in sync with [lastReadTimestamps] so it never diverges.
  final int unreadCount;

  /// Highest timestamp of a read message for each peer fingerprint. Any
  /// received message with `timestamp > lastReadTimestamps[fingerprint]` is
  /// unread.
  final Map<String, int> lastReadTimestamps;

  const ChatState({
    this.messages = const {},
    this.unreadCount = 0,
    this.lastReadTimestamps = const {},
  });

  /// Returns the number of unread received messages for a specific device.
  int unreadCountFor(String fingerprint) {
    final conversation = messages[fingerprint];
    if (conversation == null || conversation.isEmpty) {
      return 0;
    }
    final lastRead = lastReadTimestamps[fingerprint] ?? 0;
    return conversation.where((m) => !m.isMine && m.timestamp > lastRead).length;
  }

  static const fromJson = ChatStateMapper.fromJson;
}
