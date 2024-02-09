import 'package:common/src/model/state/isolate_common_state.dart';
import 'package:common/src/model/state/isolate_managed_state.dart';
import 'package:common/src/model/state/isolate_state.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'isolate_manager_state.mapper.dart';

@MappableClass()
class IsolateManagerState with IsolateManagerStateMappable {
  final IsolateCommonState commonState;

  /// Isolate Id -> Isolate State
  /// Non-empty if the current isolate is the main isolate.
  final Map<int, IsolateManagedState> isolateStates;

  /// The current isolate state.
  /// Only non-null if the current isolate is not the main isolate.
  final IsolateState? currentIsolateState;

  const IsolateManagerState({
    required this.commonState,
    required this.isolateStates,
    required this.currentIsolateState,
  });
}
