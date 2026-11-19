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

  Future<void> update(Object page, {required bool active}) {
    final wasActive = _activePages.isNotEmpty;
    if (active) {
      _activePages.add(page);
    } else {
      _activePages.remove(page);
    }

    final enable = _activePages.isNotEmpty;
    if (enable != wasActive) {
      // On Linux, disabling before the portal returns its inhibit handle is a no-op.
      _pending = _pending.then((_) async {
        try {
          await _toggle(enable: enable);
        } catch (error, stackTrace) {
          _logger.warning(
            'Could not update the transfer wake lock',
            error,
            stackTrace,
          );
        }
      });
    }
    return _pending;
  }
}
