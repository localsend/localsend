import 'package:flutter/foundation.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:localsend_isolates/util/future_queue.dart';
import 'package:logging/logging.dart';

final _logger = Logger('ForegroundService');

const _channelId = 'localsend_foreground_service';
const _serviceId = 1;

/// Notifications cannot sensibly be redrawn as often as transfer progress arrives.
const _updateInterval = Duration(milliseconds: 500);

/// An Android foreground service that keeps the app process alive.
class ForegroundService {
  ForegroundService._();

  /// Start, update and stop must not overlap, otherwise they would read a [_running] flag that
  /// a still pending action is about to change.
  static final _queue = FutureQueue(
    onError: (e, st) => _logger.warning('Foreground service operation failed', e, st),
  );

  static bool _initialized = false;
  static bool _running = false;
  static DateTime? _lastUpdate;
  static String? _lastTitle;
  static String? _lastText;

  /// The service exists on Android only. On iOS the app keeps running in the background anyway,
  /// and on desktop there is nothing to keep alive.
  static bool get _isSupported => defaultTargetPlatform == TargetPlatform.android;

  /// Whether the service is currently keeping the process alive.
  static bool get isRunning => _running;

  /// Whether [updateNotification] would actually forward an update right now.
  /// Lets callers skip building a text that gets throttled away anyway.
  static bool get shouldUpdateNotification {
    if (!_isSupported || !_running) {
      return false;
    }
    final lastUpdate = _lastUpdate;
    return lastUpdate == null || DateTime.now().difference(lastUpdate) >= _updateInterval;
  }

  /// Starts the service and shows the notification. Does nothing if it is already running.
  ///
  /// [channelName] is shown in the Android notification settings and is only read the first time
  /// the service starts, because the notification channel is created once per app installation.
  static void start({
    required String channelName,
    required String title,
    required String text,
  }) {
    if (!_isSupported) {
      return;
    }

    _lastUpdate = null;
    _lastTitle = null;
    _lastText = null;
    _queue.add(() async {
      if (_running) {
        return;
      }

      await _requestNotificationPermission();
      _init(channelName: channelName);

      final result = await FlutterForegroundTask.startService(
        serviceId: _serviceId,
        serviceTypes: const [ForegroundServiceTypes.dataSync],
        notificationTitle: title,
        notificationText: text,
      );

      if (result is ServiceRequestFailure) {
        // Most likely the app was in the background (Android 12+ forbids starting a foreground
        // service from there). Whatever the service was meant to protect is unaffected.
        _logger.warning('Could not start the foreground service', result.error);
        return;
      }

      _running = true;
    });
  }

  /// Updates the notification.
  /// Throttled to [_updateInterval]; calls before the service is running are dropped.
  ///
  /// The [title] can change while the service runs, because what the service is keeping alive
  /// may change without it ever stopping.
  static void updateNotification({required String title, required String text}) {
    if (!_isSupported) {
      return;
    }

    final now = DateTime.now();
    final lastUpdate = _lastUpdate;
    if (lastUpdate != null && now.difference(lastUpdate) < _updateInterval) {
      return;
    }
    _lastUpdate = now;

    if (title == _lastTitle && text == _lastText) {
      return;
    }
    _lastTitle = title;
    _lastText = text;

    _queue.add(() async {
      if (!_running) {
        return;
      }

      final result = await FlutterForegroundTask.updateService(notificationTitle: title, notificationText: text);
      if (result is ServiceRequestFailure) {
        _logger.warning('Could not update the foreground service', result.error);
      }
    });
  }

  /// Stops the service and removes the notification. Does nothing if it is not running.
  static void stop() {
    if (!_isSupported) {
      return;
    }

    _lastUpdate = null;
    _lastTitle = null;
    _lastText = null;
    _queue.add(() async {
      if (!_running) {
        return;
      }

      _running = false;
      final result = await FlutterForegroundTask.stopService();
      if (result is ServiceRequestFailure) {
        _logger.warning('Could not stop the foreground service', result.error);
      }
    });
  }

  static void _init({required String channelName}) {
    if (_initialized) {
      return;
    }
    _initialized = true;

    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: _channelId,
        channelName: channelName,
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
        onlyAlertOnce: true,
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: false,
        playSound: false,
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        // The work happens in the other isolates, so the service has nothing to do on its own.
        eventAction: ForegroundTaskEventAction.nothing(),
        autoRunOnBoot: false,
        autoRunOnMyPackageReplaced: false,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  /// Android 13+ needs this permission to show the notification.
  /// The service itself runs either way, so a missing permission is not treated as an error.
  ///
  /// Must not overlap with another permission request: Android cancels the pending dialog and
  /// reports an empty result, which the plugin surfaces as a `PermissionRequestCancelledException`.
  static Future<void> _requestNotificationPermission() async {
    try {
      // Only ask while the user has not decided yet. Once permanently denied, the permission can
      // only be changed in the system settings and asking again silently resolves to denied.
      if (await FlutterForegroundTask.checkNotificationPermission() == NotificationPermission.denied) {
        await FlutterForegroundTask.requestNotificationPermission();
      }
    } catch (e) {
      _logger.warning('Could not request the notification permission', e);
    }
  }
}
