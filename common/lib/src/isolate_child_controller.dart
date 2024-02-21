import 'package:common/src/model/state/isolate_child_state.dart';
import 'package:common/src/model/state/isolate_sync_dto.dart';
import 'package:meta/meta.dart';
import 'package:refena/refena.dart';

@internal
final isolateContainer = RefenaContainer();

/// Contains the state of the child isolate.
final isolateChildProvider = ReduxProvider<IsolateChildController, IsolateChildState>((ref) {
  throw 'Not initialized';
});

class IsolateChildController extends ReduxNotifier<IsolateChildState> {
  final IsolateChildState initialState;

  IsolateChildController({
    required this.initialState,
  });

  @override
  IsolateChildState init() => initialState;
}

@internal
Future<void> setupChildIsolate(
  Stream<IsolateSyncDto> receiveFromMain,
  void Function(Object) sendToMain,
  IsolateSyncDto? initialData,
) async {
  final commonState = initialData!.isolateCommonState;
  final isolateState = initialData.isolateState;
  isolateContainer.set(
    isolateChildProvider.overrideWithNotifier(
      (ref) => IsolateChildController(
        initialState: IsolateChildState(
          commonState: commonState,
          isolateState: isolateState,
        ),
      ),
    ),
  );
}
