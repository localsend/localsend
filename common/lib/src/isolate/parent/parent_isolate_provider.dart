import 'package:common/model/device.dart';
import 'package:common/src/isolate/child/http_scan_discovery_isolate.dart';
import 'package:common/src/isolate/child/http_target_discovery_isolate.dart';
import 'package:common/src/isolate/child/main.dart';
import 'package:common/src/isolate/child/multicast_discovery_isolate.dart';
import 'package:common/src/isolate/child/sync_provider.dart';
import 'package:common/src/isolate/child/upload_isolate.dart';
import 'package:common/src/isolate/dto/isolate_task.dart';
import 'package:common/src/isolate/dto/isolate_task_result.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:common/src/util/isolate_helper.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:logging/logging.dart';
import 'package:refena/refena.dart';

part 'parent_isolate_provider.mapper.dart';

const _uploadIsolateCount = 2;

/// Holds the state of the parent isolate that is visible in the main Flutter isolate.
/// The [ParentIsolateState.syncState] is synchronized with all child isolates.
/// Additionally, holds the objects to communicate with the child isolates.
@MappableClass()
class ParentIsolateState with ParentIsolateStateMappable {
  final SyncState syncState;
  final IsolateConnector<IsolateTaskStreamResult<Device>, SendToIsolateData<IsolateTask<HttpScanTask>>>? httpScanDiscovery;
  final IsolateConnector<IsolateTaskResult<Device>, SendToIsolateData<IsolateTask<HttpTargetTask>>>? httpTargetDiscovery;
  final IsolateConnector<Device, SendToIsolateData<MulticastTask>>? multicastDiscovery;
  final List<IsolateConnector<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>>> httpUpload;
  int get uploadIsolateCount => httpUpload.length;

  ParentIsolateState({
    required this.syncState,
    required this.httpScanDiscovery,
    required this.httpTargetDiscovery,
    required this.multicastDiscovery,
    required this.httpUpload,
  });

  static ParentIsolateState initial(SyncState syncState) => ParentIsolateState(
        syncState: syncState,
        httpScanDiscovery: null,
        httpTargetDiscovery: null,
        multicastDiscovery: null,
        httpUpload: [],
      );

  @override
  String toString() {
    return 'ParentIsolateState(syncState: $syncState, httpTargetDiscovery: $httpTargetDiscovery)';
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
  /// If provided, file paths starting with "content://" will be resolved using this resolver.
  final UriContentStreamResolver? uriContentStreamResolver;

  IsolateSetupAction({
    required this.uriContentStreamResolver,
  });

  @override
  Future<ParentIsolateState> reduce() async {
    final httpScanDiscovery = await startIsolate<IsolateTaskStreamResult<Device>, SendToIsolateData<IsolateTask<HttpScanTask>>, InitialData>(
      task: setupHttpScanDiscoveryIsolate,
      param: InitialData(
        syncState: state.syncState,
        logLevel: Logger.root.level,
      ),
    );

    final httpTargetDiscovery = await startIsolate<IsolateTaskResult<Device>, SendToIsolateData<IsolateTask<HttpTargetTask>>, InitialData>(
      task: setupHttpTargetDiscoveryIsolate,
      param: InitialData(
        syncState: state.syncState,
        logLevel: Logger.root.level,
      ),
    );

    final multicastDiscovery = await startIsolate<Device, SendToIsolateData<MulticastTask>, InitialData>(
      task: setupMulticastDiscoveryIsolate,
      param: InitialData(
        syncState: state.syncState,
        logLevel: Logger.root.level,
      ),
    );

    final httpUploadIsolates = List.generate(
      _uploadIsolateCount,
      (index) async {
        final httpUpload = await startIsolate<IsolateTaskStreamResult<double>, SendToIsolateData<IsolateTask<BaseHttpUploadTask>>, InitialData>(
          task: setupHttpUploadIsolate,
          param: InitialData(
            syncState: state.syncState,
            logLevel: Logger.root.level,
          ),
        );

        if (uriContentStreamResolver != null) {
          httpUpload.sendToIsolate(SendToIsolateData(
            syncState: null,
            data: IsolateTask(
              id: -1,
              data: HttpUploadSetContentStreamResolverTask(resolver: uriContentStreamResolver!),
            ),
          ));
        }

        return httpUpload;
      },
      growable: false,
    );

    return state.copyWith(
      httpScanDiscovery: httpScanDiscovery,
      httpTargetDiscovery: httpTargetDiscovery,
      multicastDiscovery: multicastDiscovery,
      httpUpload: await Future.wait(httpUploadIsolates),
    );
  }
}

class IsolateDisposeAction extends ReduxAction<IsolateController, ParentIsolateState> {
  @override
  ParentIsolateState reduce() {
    state.httpScanDiscovery?.isolate.kill();
    state.httpTargetDiscovery?.isolate.kill();
    state.multicastDiscovery?.isolate.kill();
    for (final httpUpload in state.httpUpload) {
      httpUpload.isolate.kill();
    }
    return state;
  }
}
