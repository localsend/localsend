import 'package:localsend_app/model/state/server/server_state.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// Having this class allows us to have one parameter to access all relevant server methods.
class ServerUtils {
  /// The ref to the provider.
  Ref Function() refFunc;
  Ref get ref => refFunc();

  /// The current server state.
  /// This should be used within route controllers because it is guaranteed to be online and therefore non-null.
  ServerState Function() getState;

  /// The current server state or null.
  /// This should be used outside of routes because the server may be offline.
  ServerState? Function() getStateOrNull;

  /// Updates the server state.
  void Function(ServerState? Function(ServerState? oldState) builder) setState;

  ServerUtils({
    required this.refFunc,
    required this.getState,
    required this.getStateOrNull,
    required this.setState,
  });
}
