import 'package:common/model/device.dart';
import 'package:common/model/stored_security_context.dart';
import 'package:common/src/isolate/child/http_scan_discovery_isolate.dart';
import 'package:common/src/isolate/child/http_target_discovery_isolate.dart';
import 'package:common/src/isolate/child/main.dart';
import 'package:common/src/isolate/child/multicast_discovery_isolate.dart';
import 'package:common/src/isolate/child/sync_provider.dart';
import 'package:common/src/isolate/dto/isolate_task.dart';
import 'package:common/src/isolate/dto/isolate_task_result.dart';
import 'package:common/src/isolate/dto/isolate_task_stream_result.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:common/src/util/isolate_helper.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:logging/logging.dart';
import 'package:refena/refena.dart';

part 'parent_isolate_provider.mapper.dart';

/// Holds the state of the parent isolate that is visible in the main Flutter isolate.
/// The [ParentIsolateState.syncState] is synchronized with all child isolates.
/// Additionally, holds the objects to communicate with the child isolates.
@MappableClass()
class ParentIsolateState with ParentIsolateStateMappable {
  final SyncState syncState;
  final IsolateCommunication<IsolateTaskStreamResult<Device>, SendToIsolateData<IsolateTask<HttpScanTask>>>? httpScanDiscovery;
  final IsolateCommunication<IsolateTaskResult<Device?>, SendToIsolateData<IsolateTask<HttpTargetTask>>>? httpTargetDiscovery;
  final IsolateCommunication<Device, SendToIsolateData<Object>>? multicastDiscovery;

  ParentIsolateState({
    required this.syncState,
    required this.httpScanDiscovery,
    required this.httpTargetDiscovery,
    required this.multicastDiscovery,
  });

  static ParentIsolateState initial(SyncState syncState) => ParentIsolateState(
        syncState: syncState,
        httpScanDiscovery: null,
        httpTargetDiscovery: null,
        multicastDiscovery: null,
      );

  @override
  String toString() {
    return 'ParentIsolateState(syncState: $syncState, httpTargetDiscovery: $httpTargetDiscovery)';
  }
}

final parentIsolateProvider = ReduxProvider<ParentIsolateController, ParentIsolateState>((ref) {
  throw 'Not initialized';
});

class ParentIsolateController extends ReduxNotifier<ParentIsolateState> {
  final ParentIsolateState initialState;

  ParentIsolateController({
    required this.initialState,
  });

  @override
  ParentIsolateState init() => initialState;
}

/// Starts the required isolates.
/// Should be called by the main isolate.
class IsolateSetupAction extends AsyncReduxAction<ParentIsolateController, ParentIsolateState> {
  @override
  Future<ParentIsolateState> reduce() async {
    final httpScanDiscovery = await startIsolate<IsolateTaskStreamResult<Device>, SendToIsolateData<IsolateTask<HttpScanTask>>, InitialData>(
      task: setupHttpScanDiscoveryIsolate,
      param: InitialData(
        syncState: state.syncState,
        logLevel: Logger.root.level,
      ),
    );

    final httpTargetDiscovery = await startIsolate<IsolateTaskResult<Device?>, SendToIsolateData<IsolateTask<HttpTargetTask>>, InitialData>(
      task: setupHttpTargetDiscoveryIsolate,
      param: InitialData(
        syncState: state.syncState,
        logLevel: Logger.root.level,
      ),
    );

    final multicastDiscovery = await startIsolate<Device, SendToIsolateData<Object>, InitialData>(
      task: setupMulticastDiscoveryIsolate,
      param: InitialData(
        syncState: state.syncState,
        logLevel: Logger.root.level,
      ),
    );

    return state.copyWith(
      httpScanDiscovery: httpScanDiscovery,
      httpTargetDiscovery: httpTargetDiscovery,
      multicastDiscovery: multicastDiscovery,
    );
  }
}

/// Publishes the new security context to all child isolates.
class IsolateSyncSecurityContextAction extends ReduxAction<ParentIsolateController, ParentIsolateState> {
  final StoredSecurityContext securityContext;

  IsolateSyncSecurityContextAction({
    required this.securityContext,
  });

  @override
  ParentIsolateState reduce() {
    dispatch(_PublishSyncStateAction(
      syncState: state.syncState.copyWith(
        securityContext: securityContext,
      ),
    ));
    return state;
  }
}

/// Publishes the new [SyncState] to all child isolates.
class _PublishSyncStateAction extends ReduxAction<ParentIsolateController, ParentIsolateState> {
  final SyncState syncState;

  _PublishSyncStateAction({
    required this.syncState,
  });

  @override
  ParentIsolateState reduce() {
    state.httpScanDiscovery?.sendToIsolate(SendToIsolateData(
      syncState: syncState,
      data: null,
    ));
    state.httpTargetDiscovery?.sendToIsolate(SendToIsolateData(
      syncState: syncState,
      data: null,
    ));

    return state.copyWith(
      syncState: syncState,
    );
  }
}
