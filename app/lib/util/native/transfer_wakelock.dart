import 'package:logging/logging.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final _logger = Logger('TransferWakelock');

/// Holds the shared platform wake lock while any progress page has an active transfer.
class TransferWakelock {
  TransferWakelock({
    Future<void> Function({required bool enable}) toggle = WakelockPlus.toggle,
  }) : _toggle = toggle;

  final Future<void> Function({required bool enable}) _toggle;
  final _activePages = Set<Object>.identity();
  Future<void> _pending = Future.value();
  bool _enabled = false;

  Future<void> update(Object page, {required bool active}) {
    final wasActive = _activePages.isNotEmpty;
    if (active) {
      _activePages.add(page);
    } else {
      _activePages.remove(page);
    }

    final enable = _activePages.isNotEmpty;
    if (enable && wasActive) {
      return _pending;
    }

    // Wait for the previous toggle so a release can use the Linux portal handle
    // and a later idle update can retry if that release failed.
    _pending = _pending.then((_) async {
      if (enable == _enabled) {
        return;
      }
      try {
        await _toggle(enable: enable);
        _enabled = enable;
      } catch (error, stackTrace) {
        _logger.warning(
          'Could not update the transfer wake lock',
          error,
          stackTrace,
        );
      }
    });
    return _pending;
  }
}
