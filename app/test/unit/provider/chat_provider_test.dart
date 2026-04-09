import 'package:common/model/dto/chat_message_dto.dart';
import 'package:localsend_app/model/state/chat/chat_state.dart';
import 'package:localsend_app/provider/network/chat_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';

void main() {
  late RefenaContainer ref;

  setUp(() {
    ref = RefenaContainer();
  });

  tearDown(() {
    ref.dispose();
  });

  ChatMessageDto _createDto({
    String id = 'msg-1',
    String text = 'Hello',
    String senderAlias = 'Device A',
    String senderFingerprint = 'fp-a',
    int timestamp = 1000,
  }) {
    return ChatMessageDto(
      id: id,
      text: text,
      senderAlias: senderAlias,
      senderFingerprint: senderFingerprint,
      timestamp: timestamp,
    );
  }

  test('receiveMessage adds a message with isMine=false to the correct fingerprint bucket', () {
    final notifier = ref.notifier(chatProvider);
    final dto = _createDto();

    notifier.receiveMessage(dto);

    final state = ref.read(chatProvider);
    expect(state.messages.containsKey('fp-a'), isTrue);
    expect(state.messages['fp-a']!.length, 1);
    expect(state.messages['fp-a']!.first.isMine, isFalse);
    expect(state.messages['fp-a']!.first.text, 'Hello');
    expect(state.messages['fp-a']!.first.id, 'msg-1');
  });

  test('addOwnMessage adds a message with isMine=true to the correct fingerprint bucket', () {
    final notifier = ref.notifier(chatProvider);

    notifier.addOwnMessage('Hi there', 'fp-b', 'Me');

    final state = ref.read(chatProvider);
    expect(state.messages.containsKey('fp-b'), isTrue);
    expect(state.messages['fp-b']!.length, 1);
    expect(state.messages['fp-b']!.first.isMine, isTrue);
    expect(state.messages['fp-b']!.first.text, 'Hi there');
    expect(state.messages['fp-b']!.first.senderAlias, 'Me');
  });

  test('multiple messages for the same fingerprint are stored in order', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(_createDto(id: 'msg-1', text: 'First', timestamp: 1000));
    notifier.receiveMessage(_createDto(id: 'msg-2', text: 'Second', timestamp: 2000));
    notifier.receiveMessage(_createDto(id: 'msg-3', text: 'Third', timestamp: 3000));

    final state = ref.read(chatProvider);
    final messages = state.messages['fp-a']!;
    expect(messages.length, 3);
    expect(messages[0].text, 'First');
    expect(messages[1].text, 'Second');
    expect(messages[2].text, 'Third');
  });

  test('messages for different fingerprints are stored in separate buckets', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(_createDto(id: 'msg-1', senderFingerprint: 'fp-a', text: 'From A'));
    notifier.receiveMessage(_createDto(id: 'msg-2', senderFingerprint: 'fp-b', text: 'From B'));

    final state = ref.read(chatProvider);
    expect(state.messages.length, 2);
    expect(state.messages['fp-a']!.length, 1);
    expect(state.messages['fp-a']!.first.text, 'From A');
    expect(state.messages['fp-b']!.length, 1);
    expect(state.messages['fp-b']!.first.text, 'From B');
  });

  test('markAsRead resets unread count', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(_createDto(id: 'msg-1'));
    notifier.receiveMessage(_createDto(id: 'msg-2'));
    expect(ref.read(chatProvider).unreadCount, 2);

    notifier.markAsRead('fp-a');
    expect(ref.read(chatProvider).unreadCount, 0);
  });

  test('clearChat removes all messages for a given fingerprint without affecting others', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(_createDto(id: 'msg-1', senderFingerprint: 'fp-a'));
    notifier.receiveMessage(_createDto(id: 'msg-2', senderFingerprint: 'fp-b'));

    notifier.clearChat('fp-a');

    final state = ref.read(chatProvider);
    expect(state.messages.containsKey('fp-a'), isFalse);
    expect(state.messages.containsKey('fp-b'), isTrue);
    expect(state.messages['fp-b']!.length, 1);
  });

  test('state is immutable - original state object is not modified', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(_createDto(id: 'msg-1'));
    final stateAfterFirst = ref.read(chatProvider);

    notifier.receiveMessage(_createDto(id: 'msg-2'));
    final stateAfterSecond = ref.read(chatProvider);

    // Original state object should still have 1 message
    expect(stateAfterFirst.messages['fp-a']!.length, 1);
    // New state object should have 2 messages
    expect(stateAfterSecond.messages['fp-a']!.length, 2);
    // They should be different objects
    expect(identical(stateAfterFirst, stateAfterSecond), isFalse);
  });

  test('init returns empty ChatState', () {
    final state = ref.read(chatProvider);
    expect(state.messages, isEmpty);
    expect(state.unreadCount, 0);
  });

  test('receiveMessage increments unreadCount', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(_createDto(id: 'msg-1'));
    expect(ref.read(chatProvider).unreadCount, 1);

    notifier.receiveMessage(_createDto(id: 'msg-2'));
    expect(ref.read(chatProvider).unreadCount, 2);
  });

  test('addOwnMessage does not increment unreadCount', () {
    final notifier = ref.notifier(chatProvider);

    notifier.addOwnMessage('Hi', 'fp-a', 'Me');
    expect(ref.read(chatProvider).unreadCount, 0);
  });
}
