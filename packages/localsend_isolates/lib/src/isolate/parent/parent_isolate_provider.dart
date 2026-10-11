import 'package:dart_mappable/dart_mappable.dart';
import 'package:localsend_isolates/src/isolate/child/discovery_isolate.dart';
import 'package:localsend_isolates/src/isolate/child/main.dart';
import 'package:localsend_isolates/src/isolate/child/server_isolate.dart';
import 'package:localsend_isolates/src/isolate/child/sync_provider.dart';
import 'package:localsend_isolates/src/isolate/child/upload_isolate.dart';
import 'package:localsend_isolates/src/isolate/dto/send_to_isolate_data.dart';
import 'package:logging/logging.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:typed_isolates/typed_isolates.dart';

part 'parent_isolate_provider.mapper.dart';

/// Holds the state of the parent isolate that is visible in the main Flutter isolate.
/// The [ParentIsolateState.syncState] is synchronized with all child isolates.
/// Additionally, holds the objects to communicate with the child isolates.
@MappableClass()
class ParentIsolateState with ParentIsolateStateMappable {
  final SyncState syncState;
  final IsolateConnector<IsolateTaskStreamResult<DiscoveryResult>, SendToIsolateData<IsolateTask<DiscoveryTask>>>? discovery;
  final IsolateConnector<IsolateTaskStreamResult<HttpUploadEvent>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>? httpUpload;
  final IsolateConnector<IsolateTaskStreamResult<HttpServerEvent>, SendToIsolateData<IsolateTask<BaseHttpServerTask>>>? httpServer;

  ParentIsolateState({
    required this.syncState,
    required this.discovery,
    required this.httpUpload,
    required this.httpServer,
  });

  static ParentIsolateState initial(SyncState syncState) => ParentIsolateState(
    syncState: syncState,
    discovery: null,
    httpUpload: null,
    httpServer: null,
  );

  @override
  String toString() {
    return 'ParentIsolateState(syncState: $syncState)';
  }
}

final parentIsolateProvider = ReduxProvider<IsolateController, ParentIsolateState>((ref) {
  throw 'Not initialized';
});

class IsolateController extends ReduxNotifier<ParentIsolateState> {
  final ParentIsolateState initialState;

  IsolateController({
    required this.initialState,
  });

  @override
  ParentIsolateState init() => initialState;
}

/// Starts the required isolates.
/// Should be called by the main isolate.
class IsolateSetupAction extends AsyncReduxAction<IsolateController, ParentIsolateState> {
  @override
  Future<ParentIsolateState> reduce() async {
    final discovery =
        await TypedIsolates.startIsolate<IsolateTaskStreamResult<DiscoveryResult>, SendToIsolateData<IsolateTask<DiscoveryTask>>, InitialData>(
          task: setupDiscoveryIsolate,
          param: InitialData(
            syncState: state.syncState,
            logLevel: Logger.root.level,
          ),
        );

    final httpUpload =
        await TypedIsolates.startIsolate<IsolateTaskStreamResult<HttpUploadEvent>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>, InitialData>(
          task: setupHttpUploadIsolate,
          param: InitialData(
            syncState: state.syncState,
            logLevel: Logger.root.level,
          ),
        );

    final httpServer =
        await TypedIsolates.startIsolate<IsolateTaskStreamResult<HttpServerEvent>, SendToIsolateData<IsolateTask<BaseHttpServerTask>>, InitialData>(
          task: setupHttpServerIsolate,
          param: InitialData(
            syncState: state.syncState,
            logLevel: Logger.root.level,
          ),
        );

    return state.copyWith(
      discovery: discovery,
      httpUpload: httpUpload,
      httpServer: httpServer,
    );
  }
}

class IsolateDisposeAction extends ReduxAction<IsolateController, ParentIsolateState> {
  @override
  ParentIsolateState reduce() {
    state.discovery?.isolate.kill();
    state.httpUpload?.isolate.kill();
    state.httpServer?.isolate.kill();
    return state;
  }
}
