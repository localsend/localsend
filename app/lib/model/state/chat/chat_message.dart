import 'package:dart_mappable/dart_mappable.dart';

part 'chat_message.mapper.dart';

@MappableClass()
class ChatMessage with ChatMessageMappable {
  final String id;
  final String text;
  final String deviceFingerprint;
  final String senderAlias;
  final int timestamp;
  final bool isMine;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.deviceFingerprint,
    required this.senderAlias,
    required this.timestamp,
    required this.isMine,
  });

  static const fromJson = ChatMessageMapper.fromJson;
}
