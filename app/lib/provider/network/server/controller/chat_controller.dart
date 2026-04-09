import 'dart:convert';
import 'dart:io';

import 'package:common/api_route_builder.dart';
import 'package:common/model/dto/chat_message_dto.dart';
import 'package:localsend_app/provider/network/chat_provider.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/util/simple_server.dart';
import 'package:logging/logging.dart';

final _logger = Logger('ChatController');

/// Handles incoming chat messages from other devices.
class ChatController {
  final ServerUtils server;

  ChatController(this.server);

  /// Installs the chat route on the server.
  void installRoutes({
    required SimpleServerRouteBuilder router,
  }) {
    router.post(ApiRoute.chat.v2, (HttpRequest request) async {
      return await _chatHandler(request: request);
    });
  }

  Future<void> _chatHandler({
    required HttpRequest request,
  }) async {
    final ChatMessageDto dto;
    try {
      final payload = await request.readAsString();
      dto = ChatMessageDto.fromJson(jsonDecode(payload));
    } catch (e) {
      _logger.warning('Failed to parse chat message', e);
      return await request.respondJson(400, message: 'Request body malformed');
    }

    server.ref.notifier(chatProvider).receiveMessage(dto);
    return await request.respondJson(200);
  }
}
