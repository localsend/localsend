import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:workmanager/workmanager.dart';

final _logger = Logger('BackgroundWorkManager');

const _taskName = 'org.localsend.localsend_ng.keepalive';
const _periodicInterval = Duration(minutes: 15);

@pragma('vm:entry-point')
void _callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    // WorkManager periodic wakeup: the main app's server may still be alive.
    // This task's purpose is simply to keep the process scheduled in Android's
    // job queue so the OS doesn't forget about us entirely. If the app process
    // is already running, this is a no-op.
    return true;
  });
}

Future<void> registerPeriodicWakeup() async {
  if (defaultTargetPlatform != TargetPlatform.android) {
    return;
  }

  try {
    await Workmanager().initialize(_callbackDispatcher);
    await Workmanager().registerPeriodicTask(
      _taskName,
      _taskName,
      frequency: _periodicInterval,
      constraints: Constraints(networkType: NetworkType.connected),
      existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
    );
    _logger.info('WorkManager periodic task registered');
  } catch (e) {
    _logger.warning('Failed to register WorkManager task', e);
  }
}

Future<void> cancelPeriodicWakeup() async {
  if (defaultTargetPlatform != TargetPlatform.android) {
    return;
  }

  try {
    await Workmanager().cancelByUniqueName(_taskName);
    _logger.info('WorkManager periodic task cancelled');
  } catch (e) {
    _logger.warning('Failed to cancel WorkManager task', e);
  }
}
