import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_app/model/state/chat/chat_message.dart';

part 'chat_state.mapper.dart';

@MappableClass()
class ChatState with ChatStateMappable {
  final Map<String, List<ChatMessage>> messages;
  final int unreadCount;

  const ChatState({
    this.messages = const {},
    this.unreadCount = 0,
  });

  static const fromJson = ChatStateMapper.fromJson;
}
