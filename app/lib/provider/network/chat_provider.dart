import 'package:common/api_route_builder.dart';
import 'package:common/model/device.dart';
import 'package:common/model/dto/chat_message_dto.dart';
import 'package:localsend_app/model/state/chat/chat_message.dart';
import 'package:localsend_app/model/state/chat/chat_state.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/util/rhttp.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final _logger = Logger('ChatProvider');

/// Network timeout for sending a chat message.
/// Chat is low-latency so a short timeout is appropriate.
const _sendTimeout = Duration(seconds: 10);

final chatProvider = NotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends Notifier<ChatState> {
  @override
  ChatState init() => const ChatState();

  /// Adds an incoming message from another device.
  /// Deduplicates on message id so network retransmits don't produce duplicate
  /// bubbles.
  void receiveMessage(ChatMessageDto dto) {
    final fingerprint = dto.senderFingerprint;
    final existingMessages = state.messages[fingerprint] ?? const <ChatMessage>[];

    // Drop if we have already seen this message id from this device.
    if (existingMessages.any((m) => m.id == dto.id)) {
      return;
    }

    final message = ChatMessage(
      id: dto.id,
      text: dto.text,
      deviceFingerprint: fingerprint,
      senderAlias: dto.senderAlias,
      timestamp: dto.timestamp,
      isMine: false,
    );

    state = ChatState(
      messages: {
        ...state.messages,
        fingerprint: [...existingMessages, message],
      },
      unreadCount: state.unreadCount + 1,
    );
  }

  /// Adds a message sent by the local user to the state.
  ///
  /// Normally called internally by [sendMessage] after a successful HTTP post;
  /// exposed publicly so unit tests can assert state transitions without
  /// having to mock the HTTP client.
  void addOwnMessage(String text, String deviceFingerprint, String senderAlias) {
    final message = ChatMessage(
      id: _uuid.v4(),
      text: text,
      deviceFingerprint: deviceFingerprint,
      senderAlias: senderAlias,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      isMine: true,
    );

    final existingMessages = state.messages[deviceFingerprint] ?? const <ChatMessage>[];

    state = ChatState(
      messages: {
        ...state.messages,
        deviceFingerprint: [...existingMessages, message],
      },
      unreadCount: state.unreadCount,
    );
  }

  /// Sends a chat message to a target device.
  ///
  /// Uses the project-standard rhttp client (via [RhttpWrapper]) so the code
  /// path works on all platforms (including Flutter web), respects the app's
  /// self-signed certificate pinning, and applies a real timeout.
  ///
  /// Throws on failure — the caller is responsible for surfacing the error to
  /// the user.
  Future<void> sendMessage(Device target, String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      return;
    }

    final deviceInfo = ref.read(deviceFullInfoProvider);
    final securityContext = ref.read(securityProvider);

    final dto = ChatMessageDto(
      id: _uuid.v4(),
      text: trimmed,
      senderAlias: deviceInfo.alias,
      senderFingerprint: deviceInfo.fingerprint,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );

    final url = ApiRoute.chat.target(target);
    final client = RhttpWrapper.create(_sendTimeout, securityContext);

    try {
      await client.post(
        uri: url,
        json: dto.toJson(),
      );
      addOwnMessage(trimmed, target.fingerprint, deviceInfo.alias);
    } catch (e, st) {
      _logger.warning('Failed to send chat message to ${target.alias}', e, st);
      rethrow;
    }
  }

  /// Resets unread count after the user has viewed a conversation.
  ///
  /// Tracks per-device "last read timestamp" so the unread counter only counts
  /// messages received after the last time the user opened the chat.
  void markAsRead(String fingerprint) {
    final messagesForDevice = state.messages[fingerprint] ?? const <ChatMessage>[];
    final lastRead = state.lastReadTimestamps[fingerprint] ?? 0;

    // Count how many received messages are newer than the last-read watermark —
    // these are the ones currently contributing to unreadCount.
    final unreadForDevice = messagesForDevice
        .where((m) => !m.isMine && m.timestamp > lastRead)
        .length;

    if (unreadForDevice == 0) {
      return;
    }

    // Advance the watermark to the newest message timestamp we have seen.
    final newestTimestamp = messagesForDevice
        .map((m) => m.timestamp)
        .fold<int>(lastRead, (acc, t) => t > acc ? t : acc);

    state = ChatState(
      messages: state.messages,
      unreadCount: (state.unreadCount - unreadForDevice).clamp(0, state.unreadCount),
      lastReadTimestamps: {
        ...state.lastReadTimestamps,
        fingerprint: newestTimestamp,
      },
    );
  }

  /// Removes all messages for a specific device and the matching unread count.
  void clearChat(String fingerprint) {
    final messagesForDevice = state.messages[fingerprint] ?? const <ChatMessage>[];
    final lastRead = state.lastReadTimestamps[fingerprint] ?? 0;
    final unreadForDevice = messagesForDevice
        .where((m) => !m.isMine && m.timestamp > lastRead)
        .length;

    final newMessages = {
      for (final entry in state.messages.entries)
        if (entry.key != fingerprint) entry.key: entry.value,
    };
    final newReadTimestamps = {
      for (final entry in state.lastReadTimestamps.entries)
        if (entry.key != fingerprint) entry.key: entry.value,
    };

    state = ChatState(
      messages: newMessages,
      unreadCount: (state.unreadCount - unreadForDevice).clamp(0, state.unreadCount),
      lastReadTimestamps: newReadTimestamps,
    );
  }
}
