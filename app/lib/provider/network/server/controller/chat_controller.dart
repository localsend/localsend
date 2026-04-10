import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:common/api_route_builder.dart';
import 'package:common/model/dto/chat_message_dto.dart';
import 'package:localsend_app/provider/network/chat_provider.dart';
import 'package:localsend_app/provider/network/nearby_devices_provider.dart';
import 'package:localsend_app/provider/network/server/controller/common.dart';
import 'package:localsend_app/provider/network/server/server_utils.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/simple_server.dart';
import 'package:logging/logging.dart';

final _logger = Logger('ChatController');

/// Maximum chat message body size in bytes to guard against memory exhaustion.
const _maxChatBodyBytes = 16 * 1024; // 16 KB

/// Maximum text length for a single chat message.
const _maxChatTextLength = 4096;

/// Handles incoming chat messages from other devices.
class ChatController {
  final ServerUtils server;

  ChatController(this.server);

  /// Installs the chat route on the server.
  ///
  /// [fingerprint] is the local device's certificate fingerprint, used to
  /// short-circuit self-discovery loops without calling back into the server
  /// provider from the request handler.
  void installRoutes({
    required SimpleServerRouteBuilder router,
    required String fingerprint,
  }) {
    router.post(ApiRoute.chat.v2, (HttpRequest request) async {
      return await _chatHandler(request: request, ownFingerprint: fingerprint);
    });
  }

  Future<void> _chatHandler({
    required HttpRequest request,
    required String ownFingerprint,
  }) async {
    // Enforce PIN if the receiver has one configured (same gate as prepareUpload).
    final pinCorrect = await checkPin(
      server: server,
      pin: server.ref.read(settingsProvider).receivePin,
      pinAttempts: server.getState().pinAttempts,
      request: request,
    );
    if (!pinCorrect) {
      return;
    }

    // Guard against unbounded request bodies (basic DoS protection).
    final contentLength = request.contentLength;
    if (contentLength > _maxChatBodyBytes) {
      return await request.respondJson(413, message: 'Request body too large');
    }

    final ChatMessageDto dto;
    try {
      final payload = await request.readAsString();
      if (payload.length > _maxChatBodyBytes) {
        return await request.respondJson(413, message: 'Request body too large');
      }
      dto = ChatMessageDto.fromJson(jsonDecode(payload));
    } catch (e) {
      _logger.warning('Failed to parse chat message', e);
      return await request.respondJson(400, message: 'Request body malformed');
    }

    // Validate message text length.
    if (dto.text.isEmpty || dto.text.length > _maxChatTextLength) {
      return await request.respondJson(400, message: 'Invalid message length');
    }

    // Reject messages that claim to come from this device itself.
    if (dto.senderFingerprint == ownFingerprint) {
      return await request.respondJson(412, message: 'Self-discovered');
    }

    // Verify the sender's fingerprint matches a known nearby device to prevent
    // arbitrary LAN attackers from impersonating contacts. This ties chat to the
    // existing discovery/register handshake.
    final knownDevices = server.ref.read(nearbyDevicesProvider).devices.values;
    final knownDevice = knownDevices.firstWhereOrNull(
      (d) => d.fingerprint == dto.senderFingerprint,
    );
    if (knownDevice == null) {
      _logger.warning('Rejecting chat message from unknown fingerprint: ${dto.senderFingerprint} (ip=${request.ip})');
      return await request.respondJson(403, message: 'Sender not registered');
    }

    // Verify the claimed sender IP matches the known device IP to further
    // harden against spoofing on the local network.
    if (knownDevice.ip != null && knownDevice.ip != request.ip) {
      _logger.warning('Sender IP mismatch: claimed=${knownDevice.ip} actual=${request.ip}');
      return await request.respondJson(403, message: 'Sender IP mismatch');
    }

    server.ref.notifier(chatProvider).receiveMessage(dto);
    return await request.respondJson(200);
  }
}
