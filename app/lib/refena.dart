import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:refena_inspector_client/refena_inspector_client.dart';

final _logger = Logger('Refena');

class CustomRefenaObserver extends RefenaMultiObserver {
  CustomRefenaObserver()
      : super(observers: [
          RefenaDebugObserver(
            onLine: (line) => _logger.info(line),
            exclude: (event) {
              return event is ChangeEvent &&
                  (event.notifier.runtimeType == DiscoveryLogsNotifier ||
                      event.notifier.runtimeType == NetworkStateNotifier ||
                      event.notifier.runtimeType == ProgressNotifier);
            },
          ),
          RefenaTracingObserver(
            limit: 100,
            exclude: (event) {
              return event is ChangeEvent &&
                  (event.notifier.runtimeType == DiscoveryLogsNotifier ||
                      event.notifier.runtimeType == NetworkStateNotifier ||
                      event.notifier.runtimeType == ProgressNotifier);
            },
          ),
          RefenaInspectorObserver(),
        ]);
}
