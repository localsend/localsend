// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_message.dart';

class ChatMessageMapper extends ClassMapperBase<ChatMessage> {
  ChatMessageMapper._();

  static ChatMessageMapper? _instance;
  static ChatMessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatMessageMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatMessage';

  static String _$id(ChatMessage v) => v.id;
  static const Field<ChatMessage, String> _f$id = Field('id', _$id);
  static String _$text(ChatMessage v) => v.text;
  static const Field<ChatMessage, String> _f$text = Field('text', _$text);
  static String _$deviceFingerprint(ChatMessage v) => v.deviceFingerprint;
  static const Field<ChatMessage, String> _f$deviceFingerprint = Field('deviceFingerprint', _$deviceFingerprint);
  static String _$senderAlias(ChatMessage v) => v.senderAlias;
  static const Field<ChatMessage, String> _f$senderAlias = Field('senderAlias', _$senderAlias);
  static int _$timestamp(ChatMessage v) => v.timestamp;
  static const Field<ChatMessage, int> _f$timestamp = Field('timestamp', _$timestamp);
  static bool _$isMine(ChatMessage v) => v.isMine;
  static const Field<ChatMessage, bool> _f$isMine = Field('isMine', _$isMine);

  @override
  final MappableFields<ChatMessage> fields = const {
    #id: _f$id,
    #text: _f$text,
    #deviceFingerprint: _f$deviceFingerprint,
    #senderAlias: _f$senderAlias,
    #timestamp: _f$timestamp,
    #isMine: _f$isMine,
  };

  static ChatMessage _instantiate(DecodingData data) {
    return ChatMessage(
      id: data.dec(_f$id),
      text: data.dec(_f$text),
      deviceFingerprint: data.dec(_f$deviceFingerprint),
      senderAlias: data.dec(_f$senderAlias),
      timestamp: data.dec(_f$timestamp),
      isMine: data.dec(_f$isMine),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatMessage fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatMessage>(map);
  }

  static ChatMessage deserialize(String json) {
    return ensureInitialized().decodeJson<ChatMessage>(json);
  }
}

mixin ChatMessageMappable {
  String serialize() {
    return ChatMessageMapper.ensureInitialized().encodeJson<ChatMessage>(this as ChatMessage);
  }

  Map<String, dynamic> toJson() {
    return ChatMessageMapper.ensureInitialized().encodeMap<ChatMessage>(this as ChatMessage);
  }

  ChatMessageCopyWith<ChatMessage, ChatMessage, ChatMessage> get copyWith =>
      _ChatMessageCopyWithImpl(this as ChatMessage, $identity, $identity);
  @override
  String toString() {
    return ChatMessageMapper.ensureInitialized().stringifyValue(this as ChatMessage);
  }

  @override
  bool operator ==(Object other) {
    return ChatMessageMapper.ensureInitialized().equalsValue(this as ChatMessage, other);
  }

  @override
  int get hashCode {
    return ChatMessageMapper.ensureInitialized().hashValue(this as ChatMessage);
  }
}

extension ChatMessageValueCopy<$R, $Out> on ObjectCopyWith<$R, ChatMessage, $Out> {
  ChatMessageCopyWith<$R, ChatMessage, $Out> get $asChatMessage =>
      $base.as((v, t, t2) => _ChatMessageCopyWithImpl(v, t, t2));
}

abstract class ChatMessageCopyWith<$R, $In extends ChatMessage, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? text, String? deviceFingerprint, String? senderAlias, int? timestamp, bool? isMine});
  ChatMessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatMessageCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ChatMessage, $Out>
    implements ChatMessageCopyWith<$R, ChatMessage, $Out> {
  _ChatMessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatMessage> $mapper = ChatMessageMapper.ensureInitialized();
  @override
  $R call({String? id, String? text, String? deviceFingerprint, String? senderAlias, int? timestamp, bool? isMine}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (text != null) #text: text,
        if (deviceFingerprint != null) #deviceFingerprint: deviceFingerprint,
        if (senderAlias != null) #senderAlias: senderAlias,
        if (timestamp != null) #timestamp: timestamp,
        if (isMine != null) #isMine: isMine,
      }));
  @override
  ChatMessage $make(CopyWithData data) => ChatMessage(
      id: data.get(#id, or: $value.id),
      text: data.get(#text, or: $value.text),
      deviceFingerprint: data.get(#deviceFingerprint, or: $value.deviceFingerprint),
      senderAlias: data.get(#senderAlias, or: $value.senderAlias),
      timestamp: data.get(#timestamp, or: $value.timestamp),
      isMine: data.get(#isMine, or: $value.isMine));

  @override
  ChatMessageCopyWith<$R2, ChatMessage, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ChatMessageCopyWithImpl($value, $cast, t);
}
