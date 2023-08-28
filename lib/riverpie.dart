import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:logging/logging.dart';
import 'package:riverpie_flutter/riverpie_flutter.dart';

final _logger = Logger('Riverpie');

class CustomRiverpieObserver extends RiverpieMultiObserver {
  CustomRiverpieObserver()
      : super(observers: [
          RiverpieDebugObserver(
            onLine: (line) => _logger.info(line),
            exclude: (event) {
              return event is ChangeEvent &&
                  (event.notifier.runtimeType == DiscoveryLogsNotifier ||
                      event.notifier.runtimeType == NetworkStateNotifier ||
                      event.notifier.runtimeType == ProgressNotifier);
            },
          ),
          RiverpieTracingObserver(
            limit: 100,
            exclude: (event) {
              return event is ChangeEvent &&
                  (event.notifier.runtimeType == DiscoveryLogsNotifier ||
                      event.notifier.runtimeType == NetworkStateNotifier ||
                      event.notifier.runtimeType == ProgressNotifier);
            },
          ),
        ]);
}
