import 'package:common/src/isolate_child_controller.dart';
import 'package:common/src/model/state/isolate_common_state.dart';
import 'package:common/src/model/state/isolate_parent_state.dart';
import 'package:common/src/model/state/isolate_ref_state.dart';
import 'package:common/src/model/state/isolate_state.dart';
import 'package:common/src/model/state/isolate_sync_dto.dart';
import 'package:common/src/model/stored_security_context.dart';
import 'package:common/src/util/id_provider.dart';
import 'package:common/src/util/isolate_helper.dart';
import 'package:refena/refena.dart';

final _idProvider = IdProvider();

final isolateParentProvider = ReduxProvider<IsolateParentController, IsolateParentState>((ref) {
  return IsolateParentController();
});

class IsolateParentController extends ReduxNotifier<IsolateParentState> {
  @override
  IsolateParentState init() => IsolateParentState(
        commonState: IsolateCommonState(
          securityContext: null,
        ),
        isolateStates: {},
      );
}

/// Starts the required isolates.
/// Should be called by the main isolate.
class IsolateSetupAction extends AsyncReduxAction<IsolateParentController, IsolateParentState> {
  @override
  Future<IsolateParentState> reduce() async {
    final isolateId = _idProvider.getNextId();
    final isolateState = IsolateState(
      isolateId: isolateId,
      isolateType: IsolateType.multicast,
    );
    final initialData = IsolateSyncDto(
      isolateState: isolateState,
      isolateCommonState: state.commonState,
    );
    final communication = await startIsolate<Object, IsolateSyncDto, IsolateSyncDto>(
      task: setupChildIsolate,
      param: initialData,
    );
    return state.copyWith(
      isolateStates: {
        isolateId: IsolateRefState(
          communication: communication,
          isolateState: isolateState,
        ),
      },
    );
  }
}

/// Publishes the new security context to all isolates.
class IsolateSyncSecurityContextAction extends ReduxAction<IsolateParentController, IsolateParentState> {
  final StoredSecurityContext securityContext;

  IsolateSyncSecurityContextAction({
    required this.securityContext,
  });

  @override
  IsolateParentState reduce() {
    final commonState = state.commonState.copyWith(
      securityContext: securityContext,
    );

    for (final isolateState in state.isolateStates.values) {
      isolateState.communication.sendToIsolate(IsolateSyncDto(
        isolateState: isolateState.isolateState,
        isolateCommonState: commonState,
      ));
    }

    return state.copyWith(
      commonState: commonState,
    );
  }
}
