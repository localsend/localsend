// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_message_dto.dart';

class ChatMessageDtoMapper extends ClassMapperBase<ChatMessageDto> {
  ChatMessageDtoMapper._();

  static ChatMessageDtoMapper? _instance;
  static ChatMessageDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatMessageDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatMessageDto';

  static String _$id(ChatMessageDto v) => v.id;
  static const Field<ChatMessageDto, String> _f$id = Field('id', _$id);
  static String _$text(ChatMessageDto v) => v.text;
  static const Field<ChatMessageDto, String> _f$text = Field('text', _$text);
  static String _$senderAlias(ChatMessageDto v) => v.senderAlias;
  static const Field<ChatMessageDto, String> _f$senderAlias = Field('senderAlias', _$senderAlias);
  static String _$senderFingerprint(ChatMessageDto v) => v.senderFingerprint;
  static const Field<ChatMessageDto, String> _f$senderFingerprint = Field('senderFingerprint', _$senderFingerprint);
  static int _$timestamp(ChatMessageDto v) => v.timestamp;
  static const Field<ChatMessageDto, int> _f$timestamp = Field('timestamp', _$timestamp);

  @override
  final MappableFields<ChatMessageDto> fields = const {
    #id: _f$id,
    #text: _f$text,
    #senderAlias: _f$senderAlias,
    #senderFingerprint: _f$senderFingerprint,
    #timestamp: _f$timestamp,
  };

  static ChatMessageDto _instantiate(DecodingData data) {
    return ChatMessageDto(
        id: data.dec(_f$id),
        text: data.dec(_f$text),
        senderAlias: data.dec(_f$senderAlias),
        senderFingerprint: data.dec(_f$senderFingerprint),
        timestamp: data.dec(_f$timestamp));
  }

  @override
  final Function instantiate = _instantiate;

  static ChatMessageDto fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatMessageDto>(map);
  }

  static ChatMessageDto deserialize(String json) {
    return ensureInitialized().decodeJson<ChatMessageDto>(json);
  }
}

mixin ChatMessageDtoMappable {
  String serialize() {
    return ChatMessageDtoMapper.ensureInitialized().encodeJson<ChatMessageDto>(this as ChatMessageDto);
  }

  Map<String, dynamic> toJson() {
    return ChatMessageDtoMapper.ensureInitialized().encodeMap<ChatMessageDto>(this as ChatMessageDto);
  }

  ChatMessageDtoCopyWith<ChatMessageDto, ChatMessageDto, ChatMessageDto> get copyWith =>
      _ChatMessageDtoCopyWithImpl(this as ChatMessageDto, $identity, $identity);
  @override
  String toString() {
    return ChatMessageDtoMapper.ensureInitialized().stringifyValue(this as ChatMessageDto);
  }

  @override
  bool operator ==(Object other) {
    return ChatMessageDtoMapper.ensureInitialized().equalsValue(this as ChatMessageDto, other);
  }

  @override
  int get hashCode {
    return ChatMessageDtoMapper.ensureInitialized().hashValue(this as ChatMessageDto);
  }
}

extension ChatMessageDtoValueCopy<$R, $Out> on ObjectCopyWith<$R, ChatMessageDto, $Out> {
  ChatMessageDtoCopyWith<$R, ChatMessageDto, $Out> get $asChatMessageDto =>
      $base.as((v, t, t2) => _ChatMessageDtoCopyWithImpl(v, t, t2));
}

abstract class ChatMessageDtoCopyWith<$R, $In extends ChatMessageDto, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? text, String? senderAlias, String? senderFingerprint, int? timestamp});
  ChatMessageDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatMessageDtoCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ChatMessageDto, $Out>
    implements ChatMessageDtoCopyWith<$R, ChatMessageDto, $Out> {
  _ChatMessageDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatMessageDto> $mapper = ChatMessageDtoMapper.ensureInitialized();
  @override
  $R call({String? id, String? text, String? senderAlias, String? senderFingerprint, int? timestamp}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (text != null) #text: text,
        if (senderAlias != null) #senderAlias: senderAlias,
        if (senderFingerprint != null) #senderFingerprint: senderFingerprint,
        if (timestamp != null) #timestamp: timestamp,
      }));
  @override
  ChatMessageDto $make(CopyWithData data) => ChatMessageDto(
      id: data.get(#id, or: $value.id),
      text: data.get(#text, or: $value.text),
      senderAlias: data.get(#senderAlias, or: $value.senderAlias),
      senderFingerprint: data.get(#senderFingerprint, or: $value.senderFingerprint),
      timestamp: data.get(#timestamp, or: $value.timestamp));

  @override
  ChatMessageDtoCopyWith<$R2, ChatMessageDto, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ChatMessageDtoCopyWithImpl($value, $cast, t);
}
