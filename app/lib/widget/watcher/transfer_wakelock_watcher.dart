import 'dart:async';

import 'package:common/model/session_status.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/wakelock/transfer_wakelock_controller.dart';
import 'package:localsend_app/util/wakelock/wakelock_service.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _logger = Logger('TransferWakelockWatcher');

class TransferWakelockWatcher extends StatefulWidget {
  final Widget child;

  const TransferWakelockWatcher({
    required this.child,
    super.key,
  });

  @override
  State<TransferWakelockWatcher> createState() => _TransferWakelockWatcherState();
}

class _TransferWakelockWatcherState extends State<TransferWakelockWatcher> with Refena {
  late final TransferWakelockController _controller;
  int _lastActiveTransfers = 0;

  @override
  void initState() {
    super.initState();
    _controller = TransferWakelockController(
      service: WakelockPlusService(),
      enabledForPlatform: checkPlatform([TargetPlatform.iOS]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sendSessions = ref.watch(sendProvider);
    final serverState = ref.watch(serverProvider);

    final activeTransfers = _countActiveTransfers(sendSessions, serverState);
    if (activeTransfers != _lastActiveTransfers) {
      _lastActiveTransfers = activeTransfers;
      _logger.info('Active transfers changed: $activeTransfers');
    }
    _controller.setActiveTransfers(activeTransfers);

    return widget.child;
  }

  @override
  void dispose() {
    unawaited(_controller.dispose());
    super.dispose();
  }
}

int _countActiveTransfers(Map<String, SendSessionState> sendSessions, ServerState? serverState) {
  final activeSend = sendSessions.values.where((session) => session.status == SessionStatus.sending).length;
  final activeReceive = serverState?.session?.status == SessionStatus.sending ? 1 : 0;
  return activeSend + activeReceive;
}
