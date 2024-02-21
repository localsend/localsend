import 'package:common/src/model/state/isolate_common_state.dart';
import 'package:common/src/model/state/isolate_ref_state.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'isolate_parent_state.mapper.dart';

@MappableClass()
class IsolateParentState with IsolateParentStateMappable {
  final IsolateCommonState commonState;

  /// Isolate Id -> Isolate State
  final Map<int, IsolateRefState> isolateStates;

  const IsolateParentState({
    required this.commonState,
    required this.isolateStates,
  });
}
