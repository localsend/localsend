import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

const receivingTileChannel = MethodChannel('org.localsend.localsend_app/receiving_tile');
final _logger = Logger('ReceivingTile');

Future<bool> isReceivingEnabled() async {
  if (!Platform.isAndroid) {
    return true;
  }
  try {
    return await receivingTileChannel.invokeMethod<bool>('isReceivingEnabled') ?? true;
  } catch (e) {
    _logger.warning('Could not read Quick Settings receiving state', e);
    return true;
  }
}

void updateReceivingTile(bool receiving) {
  if (!Platform.isAndroid) {
    return;
  }
  unawaited(
    receivingTileChannel.invokeMethod<void>('setReceivingState', receiving).catchError((Object e) {
      _logger.warning('Could not update Quick Settings tile', e);
    }),
  );
}

Future<void> showIncomingRequest({
  required String sessionId,
  required String sender,
  required int fileCount,
  String? fileName,
  Uint8List? previewBytes,
}) async {
  if (!Platform.isAndroid) return;
  try {
    await receivingTileChannel.invokeMethod<void>('showIncomingRequest', {
      'sessionId': sessionId,
      'sender': sender,
      'fileCount': fileCount,
      'fileName': fileName,
      'previewBytes': previewBytes,
    });
  } catch (e) {
    _logger.warning('Could not show incoming request', e);
  }
}

void dismissIncomingRequest(String sessionId) {
  if (!Platform.isAndroid) return;
  unawaited(receivingTileChannel.invokeMethod<void>('dismissIncomingRequest', sessionId));
}

Future<void> showCompletedFile({required String entryId, required String fileName, required String sender}) async {
  if (!Platform.isAndroid) return;
  try {
    await receivingTileChannel.invokeMethod<void>('showCompletedFile', {
      'entryId': entryId,
      'fileName': fileName,
      'sender': sender,
    });
  } catch (e) {
    _logger.warning('Could not show completed file notification', e);
  }
}
