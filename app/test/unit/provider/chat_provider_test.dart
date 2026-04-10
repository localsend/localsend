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

  ChatMessageDto createDto({
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
    notifier.receiveMessage(createDto());

    final state = ref.read(chatProvider);
    expect(state.messages['fp-a']!.single.isMine, isFalse);
    expect(state.messages['fp-a']!.single.text, 'Hello');
    expect(state.messages['fp-a']!.single.id, 'msg-1');
  });

  test('addOwnMessage adds a message with isMine=true to the correct fingerprint bucket', () {
    final notifier = ref.notifier(chatProvider);
    notifier.addOwnMessage('Hi there', 'fp-b', 'Me');

    final state = ref.read(chatProvider);
    expect(state.messages['fp-b']!.single.isMine, isTrue);
    expect(state.messages['fp-b']!.single.text, 'Hi there');
    expect(state.messages['fp-b']!.single.senderAlias, 'Me');
  });

  test('multiple messages for the same fingerprint are stored in order', () {
    final notifier = ref.notifier(chatProvider);
    notifier.receiveMessage(createDto(id: 'msg-1', text: 'First', timestamp: 1000));
    notifier.receiveMessage(createDto(id: 'msg-2', text: 'Second', timestamp: 2000));
    notifier.receiveMessage(createDto(id: 'msg-3', text: 'Third', timestamp: 3000));

    final messages = ref.read(chatProvider).messages['fp-a']!;
    expect(messages.map((m) => m.text).toList(), ['First', 'Second', 'Third']);
  });

  test('messages for different fingerprints are stored in separate buckets', () {
    final notifier = ref.notifier(chatProvider);
    notifier.receiveMessage(createDto(id: 'msg-1', senderFingerprint: 'fp-a', text: 'From A'));
    notifier.receiveMessage(createDto(id: 'msg-2', senderFingerprint: 'fp-b', text: 'From B'));

    final state = ref.read(chatProvider);
    expect(state.messages.length, 2);
    expect(state.messages['fp-a']!.single.text, 'From A');
    expect(state.messages['fp-b']!.single.text, 'From B');
  });

  test('receiveMessage deduplicates on message id', () {
    final notifier = ref.notifier(chatProvider);
    final dto = createDto(id: 'msg-1');

    notifier.receiveMessage(dto);
    notifier.receiveMessage(dto); // duplicate retransmit
    notifier.receiveMessage(dto); // duplicate retransmit again

    final state = ref.read(chatProvider);
    expect(state.messages['fp-a']!.length, 1);
    expect(state.unreadCount, 1);
  });

  test('markAsRead resets unread count and advances read watermark', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(createDto(id: 'msg-1', timestamp: 1000));
    notifier.receiveMessage(createDto(id: 'msg-2', timestamp: 2000));
    expect(ref.read(chatProvider).unreadCount, 2);

    notifier.markAsRead('fp-a');
    final state = ref.read(chatProvider);
    expect(state.unreadCount, 0);
    expect(state.lastReadTimestamps['fp-a'], 2000);
    expect(state.unreadCountFor('fp-a'), 0);
  });

  test('markAsRead only affects the target fingerprint', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(createDto(id: 'a-1', senderFingerprint: 'fp-a'));
    notifier.receiveMessage(createDto(id: 'a-2', senderFingerprint: 'fp-a'));
    notifier.receiveMessage(createDto(id: 'b-1', senderFingerprint: 'fp-b'));
    expect(ref.read(chatProvider).unreadCount, 3);

    notifier.markAsRead('fp-a');
    final state = ref.read(chatProvider);
    expect(state.unreadCount, 1); // only fp-b still unread
    expect(state.unreadCountFor('fp-a'), 0);
    expect(state.unreadCountFor('fp-b'), 1);
  });

  test('messages received after markAsRead count as unread again', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(createDto(id: 'msg-1', timestamp: 1000));
    notifier.markAsRead('fp-a');
    expect(ref.read(chatProvider).unreadCount, 0);

    notifier.receiveMessage(createDto(id: 'msg-2', timestamp: 2000));
    expect(ref.read(chatProvider).unreadCount, 1);
    expect(ref.read(chatProvider).unreadCountFor('fp-a'), 1);
  });

  test('clearChat removes messages and matching unread count for one fingerprint', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(createDto(id: 'a-1', senderFingerprint: 'fp-a'));
    notifier.receiveMessage(createDto(id: 'a-2', senderFingerprint: 'fp-a'));
    notifier.receiveMessage(createDto(id: 'b-1', senderFingerprint: 'fp-b'));
    expect(ref.read(chatProvider).unreadCount, 3);

    notifier.clearChat('fp-a');

    final state = ref.read(chatProvider);
    expect(state.messages.containsKey('fp-a'), isFalse);
    expect(state.messages.containsKey('fp-b'), isTrue);
    expect(state.unreadCount, 1); // only b-1 remains
  });

  test('state is immutable - previous state references are not mutated', () {
    final notifier = ref.notifier(chatProvider);

    notifier.receiveMessage(createDto(id: 'msg-1'));
    final stateAfterFirst = ref.read(chatProvider);

    notifier.receiveMessage(createDto(id: 'msg-2'));
    final stateAfterSecond = ref.read(chatProvider);

    expect(stateAfterFirst.messages['fp-a']!.length, 1);
    expect(stateAfterSecond.messages['fp-a']!.length, 2);
    expect(identical(stateAfterFirst, stateAfterSecond), isFalse);
    expect(identical(stateAfterFirst.messages, stateAfterSecond.messages), isFalse);
  });

  test('init returns empty ChatState', () {
    final state = ref.read(chatProvider);
    expect(state.messages, isEmpty);
    expect(state.unreadCount, 0);
    expect(state.lastReadTimestamps, isEmpty);
  });

  test('receiveMessage increments unreadCount', () {
    final notifier = ref.notifier(chatProvider);
    notifier.receiveMessage(createDto(id: 'msg-1'));
    expect(ref.read(chatProvider).unreadCount, 1);
    notifier.receiveMessage(createDto(id: 'msg-2'));
    expect(ref.read(chatProvider).unreadCount, 2);
  });

  test('addOwnMessage does not increment unreadCount', () {
    final notifier = ref.notifier(chatProvider);
    notifier.addOwnMessage('Hi', 'fp-a', 'Me');
    expect(ref.read(chatProvider).unreadCount, 0);
    expect(ref.read(chatProvider).unreadCountFor('fp-a'), 0);
  });
}
