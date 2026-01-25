import 'dart:async';

import 'package:logging/logging.dart';

import 'wakelock_service.dart';

final _logger = Logger('TransferWakelock');

class TransferWakelockController {
  final WakeLockService _service;
  final bool _enabledForPlatform;

  int _activeTransfers = 0;
  bool _wakelockEnabled = false;
  bool _disposed = false;

  TransferWakelockController({
    required WakeLockService service,
    required bool enabledForPlatform,
  }) : _service = service,
       _enabledForPlatform = enabledForPlatform;

  void setActiveTransfers(int count) {
    if (_disposed) {
      return;
    }

    final normalized = count < 0 ? 0 : count;
    if (normalized == _activeTransfers) {
      return;
    }

    _activeTransfers = normalized;
    _sync();
  }

  Future<void> dispose() async {
    if (_disposed) {
      return;
    }
    _disposed = true;

    if (_enabledForPlatform && _wakelockEnabled) {
      _logger.info('Disabling wakelock on dispose.');
      _wakelockEnabled = false;
      await _service.disable();
    }
  }

  void _sync() {
    if (!_enabledForPlatform) {
      return;
    }

    final shouldEnable = _activeTransfers > 0;
    if (shouldEnable == _wakelockEnabled) {
      return;
    }

    _wakelockEnabled = shouldEnable;
    if (shouldEnable) {
      _logger.info('Enabling wakelock (activeTransfers=$_activeTransfers).');
      unawaited(_service.enable());
    } else {
      _logger.info('Disabling wakelock (activeTransfers=$_activeTransfers).');
      unawaited(_service.disable());
    }
  }
}
