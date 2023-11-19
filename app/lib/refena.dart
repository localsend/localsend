import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/logging/discovery_logs_provider.dart';
import 'package:localsend_app/provider/progress_provider.dart';
import 'package:logging/logging.dart';
import 'package:refena/src/provider/base_provider.dart';
import 'package:refena/src/provider/watchable.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:refena_inspector_client/refena_inspector_client.dart';

final _logger = Logger('Refena');

class CustomRefenaObserver extends RefenaMultiObserver {
  CustomRefenaObserver()
      : super(observers: [
          RefenaDebugObserver(
            onLine: (line) => _logger.info(line),
            exclude: _exclude,
          ),
          RefenaTracingObserver(
            limit: 100,
            exclude: _exclude,
          ),
          RefenaInspectorObserver(),
        ]);
}

bool _exclude(RefenaEvent event) {
  return switch (event) {
    ChangeEvent() => event.notifier is DiscoveryLogger || event.notifier is LocalIpService || event.notifier is ProgressNotifier,
    ActionDispatchedEvent() => event.action.runtimeType.toString() == '_FetchLocalIpAction',
    ActionFinishedEvent() => event.action.runtimeType.toString() == '_FetchLocalIpAction',
    _ => false,
  };
}

extension RefExt on Ref {
  /// Similar to [Ref.read], but instead of returning the state right away,
  /// it returns a [StateAccessor] that can be used to get the **latest** state later.
  ///
  /// This is useful if you need to use the latest value of a [ViewProvider],
  /// but you can't use [Ref.watch].
  StateAccessor<T> accessor<T>(ViewProvider<T> provider) {
    return StateAccessor<T>(
      ref: this,
      provider: provider,
    );
  }
}

class StateAccessor<T> {
  final Ref ref;
  final ViewProvider<T> provider;

  const StateAccessor({
    required this.ref,
    required this.provider,
  });

  /// Returns the latest state of the provider.
  T get state => ref.read(provider);
}
