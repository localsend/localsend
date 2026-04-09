// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_state.dart';

class ChatStateMapper extends ClassMapperBase<ChatState> {
  ChatStateMapper._();

  static ChatStateMapper? _instance;
  static ChatStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatStateMapper._());
      ChatMessageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChatState';

  static Map<String, List<ChatMessage>> _$messages(ChatState v) => v.messages;
  static const Field<ChatState, Map<String, List<ChatMessage>>> _f$messages =
      Field('messages', _$messages, opt: true, def: const {});
  static int _$unreadCount(ChatState v) => v.unreadCount;
  static const Field<ChatState, int> _f$unreadCount =
      Field('unreadCount', _$unreadCount, opt: true, def: 0);

  @override
  final MappableFields<ChatState> fields = const {
    #messages: _f$messages,
    #unreadCount: _f$unreadCount,
  };

  static ChatState _instantiate(DecodingData data) {
    return ChatState(
      messages: data.dec(_f$messages),
      unreadCount: data.dec(_f$unreadCount),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatState>(map);
  }

  static ChatState deserialize(String json) {
    return ensureInitialized().decodeJson<ChatState>(json);
  }
}

mixin ChatStateMappable {
  String serialize() {
    return ChatStateMapper.ensureInitialized().encodeJson<ChatState>(this as ChatState);
  }

  Map<String, dynamic> toJson() {
    return ChatStateMapper.ensureInitialized().encodeMap<ChatState>(this as ChatState);
  }

  ChatStateCopyWith<ChatState, ChatState, ChatState> get copyWith =>
      _ChatStateCopyWithImpl(this as ChatState, $identity, $identity);
  @override
  String toString() {
    return ChatStateMapper.ensureInitialized().stringifyValue(this as ChatState);
  }

  @override
  bool operator ==(Object other) {
    return ChatStateMapper.ensureInitialized().equalsValue(this as ChatState, other);
  }

  @override
  int get hashCode {
    return ChatStateMapper.ensureInitialized().hashValue(this as ChatState);
  }
}

extension ChatStateValueCopy<$R, $Out> on ObjectCopyWith<$R, ChatState, $Out> {
  ChatStateCopyWith<$R, ChatState, $Out> get $asChatState =>
      $base.as((v, t, t2) => _ChatStateCopyWithImpl(v, t, t2));
}

abstract class ChatStateCopyWith<$R, $In extends ChatState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, List<ChatMessage>, ObjectCopyWith<$R, List<ChatMessage>, List<ChatMessage>>> get messages;
  $R call({Map<String, List<ChatMessage>>? messages, int? unreadCount});
  ChatStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ChatState, $Out>
    implements ChatStateCopyWith<$R, ChatState, $Out> {
  _ChatStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatState> $mapper = ChatStateMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, List<ChatMessage>, ObjectCopyWith<$R, List<ChatMessage>, List<ChatMessage>>> get messages =>
      MapCopyWith($value.messages, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(messages: v));
  @override
  $R call({Map<String, List<ChatMessage>>? messages, int? unreadCount}) => $apply(FieldCopyWithData({
        if (messages != null) #messages: messages,
        if (unreadCount != null) #unreadCount: unreadCount,
      }));
  @override
  ChatState $make(CopyWithData data) => ChatState(
      messages: data.get(#messages, or: $value.messages),
      unreadCount: data.get(#unreadCount, or: $value.unreadCount));

  @override
  ChatStateCopyWith<$R2, ChatState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ChatStateCopyWithImpl($value, $cast, t);
}
