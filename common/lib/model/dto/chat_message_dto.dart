import 'package:dart_mappable/dart_mappable.dart';

part 'chat_message_dto.mapper.dart';

@MappableClass()
class ChatMessageDto with ChatMessageDtoMappable {
  final String id;
  final String text;
  final String senderAlias;
  final String senderFingerprint;
  final int timestamp;

  const ChatMessageDto({
    required this.id,
    required this.text,
    required this.senderAlias,
    required this.senderFingerprint,
    required this.timestamp,
  });

  static const fromJson = ChatMessageDtoMapper.fromJson;
}
