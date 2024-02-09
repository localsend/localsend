import 'package:common/src/model/state/isolate_common_state.dart';
import 'package:common/src/model/state/isolate_managed_state.dart';
import 'package:common/src/model/state/isolate_manager_state.dart';
import 'package:common/src/model/state/isolate_state.dart';
import 'package:common/src/model/state/isolate_sync_dto.dart';
import 'package:common/src/util/id_provider.dart';
import 'package:common/src/util/isolate_helper.dart';
import 'package:refena/refena.dart';

final _idProvider = IdProvider();

final isolateManagerProvider = ReduxProvider((ref) {
  return IsolateManager();
});

class IsolateManager extends ReduxNotifier<IsolateManagerState> {
  @override
  IsolateManagerState init() => IsolateManagerState(
        commonState: IsolateCommonState(
          securityContext: null,
        ),
        isolateStates: {},
        currentIsolateState: null,
      );
}

/// Starts the required isolates.
/// Should be called by the main isolate.
class IsolateSetupAction extends AsyncReduxAction<IsolateManager, IsolateManagerState> {
  @override
  Future<IsolateManagerState> reduce() async {
    final communication = await startIsolate<Object, IsolateSyncDto, IsolateSyncDto>(task: _task);
    final isolateId = _idProvider.getNextId();
    return state.copyWith(
      isolateStates: {
        isolateId: IsolateManagedState(
          communication: communication,
          isolateState: IsolateState(
            isolateId: isolateId,
            isolateType: IsolateType.multicast,
          ),
        ),
      },
    );
  }
}

Future<void> _task(
  Stream<IsolateSyncDto> receiveFromMain,
  void Function(Object) sendToMain,
  IsolateSyncDto? initialData,
) async {

}

// class _IsolateSetupWorkerAction extends ReduxAction<IsolateManager, IsolateManagerState> {
//   @override
//   IsolateManagerState reduce() {
//     return state;
//   }
// }
