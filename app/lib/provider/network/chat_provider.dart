import 'dart:convert';
import 'dart:io';

import 'package:common/api_route_builder.dart';
import 'package:common/model/device.dart';
import 'package:common/model/dto/chat_message_dto.dart';
import 'package:localsend_app/model/state/chat/chat_message.dart';
import 'package:localsend_app/model/state/chat/chat_state.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final _logger = Logger('ChatProvider');

final chatProvider = NotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends Notifier<ChatState> {
  @override
  ChatState init() => const ChatState();

  /// Adds an incoming message from another device.
  void receiveMessage(ChatMessageDto dto) {
    final message = ChatMessage(
      id: dto.id,
      text: dto.text,
      deviceFingerprint: dto.senderFingerprint,
      senderAlias: dto.senderAlias,
      timestamp: dto.timestamp,
      isMine: false,
    );

    final fingerprint = dto.senderFingerprint;
    final existingMessages = state.messages[fingerprint] ?? [];
    final updatedMessages = [...existingMessages, message];

    state = ChatState(
      messages: {
        ...state.messages,
        fingerprint: updatedMessages,
      },
      unreadCount: state.unreadCount + 1,
    );
  }

  /// Adds a message sent by the local user.
  void addOwnMessage(String text, String deviceFingerprint, String senderAlias) {
    final message = ChatMessage(
      id: _uuid.v4(),
      text: text,
      deviceFingerprint: deviceFingerprint,
      senderAlias: senderAlias,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      isMine: true,
    );

    final existingMessages = state.messages[deviceFingerprint] ?? [];
    final updatedMessages = [...existingMessages, message];

    state = ChatState(
      messages: {
        ...state.messages,
        deviceFingerprint: updatedMessages,
      },
      unreadCount: state.unreadCount,
    );
  }

  /// Sends a chat message to a target device via HTTP POST.
  Future<void> sendMessage(Device target, String text) async {
    final deviceInfo = ref.read(deviceFullInfoProvider);
    final dto = ChatMessageDto(
      id: _uuid.v4(),
      text: text,
      senderAlias: deviceInfo.alias,
      senderFingerprint: deviceInfo.fingerprint,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );

    final url = ApiRoute.chat.target(target);
    final uri = Uri.parse(url);
    final httpClient = HttpClient()..badCertificateCallback = (cert, host, port) => true;
    try {
      final request = await httpClient.postUrl(uri);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(dto.toJson()));
      final response = await request.close();
      if (response.statusCode == 200) {
        addOwnMessage(text, target.fingerprint, deviceInfo.alias);
      } else {
        _logger.warning('Failed to send chat message: ${response.statusCode}');
        throw Exception('Failed to send message: HTTP ${response.statusCode}');
      }
    } finally {
      httpClient.close();
    }
  }

  /// Resets unread count for a specific device conversation.
  void markAsRead(String fingerprint) {
    // Count unread messages for the given fingerprint (received messages only)
    final messagesForDevice = state.messages[fingerprint] ?? [];
    final unreadForDevice = messagesForDevice.where((m) => !m.isMine).length;
    final newUnreadCount = (state.unreadCount - unreadForDevice).clamp(0, state.unreadCount);

    state = ChatState(
      messages: state.messages,
      unreadCount: newUnreadCount,
    );
  }

  /// Removes all messages for a specific device.
  void clearChat(String fingerprint) {
    final newMessages = {
      for (final entry in state.messages.entries)
        if (entry.key != fingerprint) entry.key: entry.value,
    };

    state = ChatState(
      messages: newMessages,
      unreadCount: state.unreadCount,
    );
  }
}
