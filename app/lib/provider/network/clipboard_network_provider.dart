import 'dart:convert';
import 'package:common/api_route_builder.dart';
import 'package:common/model/device.dart';
import 'package:common/model/dto/clipboard_dto.dart';
import 'package:common/model/clipboard_data.dart' as clipboard_model;
import 'package:localsend_app/provider/http_provider.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:rhttp/rhttp.dart';

final _logger = Logger('ClipboardNetwork');

/// Provider for clipboard network operations
final clipboardNetworkProvider = NotifierProvider<ClipboardNetworkNotifier, ClipboardNetworkState>((ref) {
  return ClipboardNetworkNotifier();
});

class ClipboardNetworkState {
  final bool isSending;
  final bool isReceiving;
  final String? lastError;

  const ClipboardNetworkState({
    this.isSending = false,
    this.isReceiving = false,
    this.lastError,
  });

  ClipboardNetworkState copyWith({
    bool? isSending,
    bool? isReceiving,
    String? lastError,
  }) {
    return ClipboardNetworkState(
      isSending: isSending ?? this.isSending,
      isReceiving: isReceiving ?? this.isReceiving,
      lastError: lastError ?? this.lastError,
    );
  }
}

class ClipboardNetworkNotifier extends Notifier<ClipboardNetworkState> {
  @override
  ClipboardNetworkState init() => const ClipboardNetworkState();

  /// Send clipboard data to a remote device
  Future<void> sendClipboard(clipboard_model.ClipboardData data, Device target) async {
    setSending(true);
    clearError();

    try {
      final clipboardDto = ClipboardDto.fromClipboardData(data);
      final request = SendClipboardRequest(clipboardData: clipboardDto);

      final client = ref.read(httpProvider).longLiving;
      final response = await client.post(
        ApiRoute.clipboardSend.target(target),
        body: HttpBody.json(request.toJson()),
      );

      if (response.statusCode == 200) {
        _logger.info('Clipboard data sent successfully to ${target.alias}');
      } else {
        throw Exception('Failed to send clipboard data: ${response.statusCode}');
      }
    } catch (e) {
      _logger.severe('Error sending clipboard data: $e');
      setError(e.toString());
    } finally {
      setSending(false);
    }
  }

  /// Receive clipboard data from a remote device
  Future<clipboard_model.ClipboardData?> receiveClipboard(Device target) async {
    setReceiving(true);
    clearError();

    try {
      final request = ReceiveClipboardRequest(deviceId: target.signalingId ?? target.fingerprint);

      final client = ref.read(httpProvider).longLiving;
      final response = await client.post(
        ApiRoute.clipboardReceive.target(target),
        body: HttpBody.json(request.toJson()),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body) as Map<String, dynamic>;
        final responseDto = ReceiveClipboardResponse.fromJson(responseData);
        
        if (responseDto.success && responseDto.clipboardData != null) {
          final clipboardData = responseDto.clipboardData!.toClipboardData();
          _logger.info('Clipboard data received successfully from ${target.alias}');
          return clipboardData;
        } else {
          _logger.warning('No clipboard data available from ${target.alias}');
          return null;
        }
      } else {
        throw Exception('Failed to receive clipboard data: ${response.statusCode}');
      }
    } catch (e) {
      _logger.severe('Error receiving clipboard data: $e');
      setError(e.toString());
      return null;
    } finally {
      setReceiving(false);
    }
  }

  /// Set sending state
  void setSending(bool isSending) {
    state = state.copyWith(isSending: isSending);
  }

  /// Set receiving state
  void setReceiving(bool isReceiving) {
    state = state.copyWith(isReceiving: isReceiving);
  }

  /// Set error
  void setError(String error) {
    state = state.copyWith(lastError: error);
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(lastError: null);
  }
}

// Request/Response DTOs for clipboard network operations
class SendClipboardRequest {
  final ClipboardDto clipboardData;

  SendClipboardRequest({required this.clipboardData});

  Map<String, dynamic> toJson() {
    return {
      'clipboardData': clipboardData.toJson(),
    };
  }
}

class ReceiveClipboardRequest {
  final String deviceId;

  ReceiveClipboardRequest({required this.deviceId});

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
    };
  }
}

class ReceiveClipboardResponse {
  final bool success;
  final ClipboardDto? clipboardData;
  final String? message;

  ReceiveClipboardResponse({
    required this.success,
    this.clipboardData,
    this.message,
  });

  factory ReceiveClipboardResponse.fromJson(Map<String, dynamic> json) {
    return ReceiveClipboardResponse(
      success: json['success'] as bool,
      clipboardData: json['clipboardData'] != null 
          ? ClipboardDtoMapper.fromJson(json['clipboardData'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
    );
  }
}

