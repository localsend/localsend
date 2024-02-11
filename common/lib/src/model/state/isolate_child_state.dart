import 'package:common/src/model/state/isolate_common_state.dart';
import 'package:common/src/model/state/isolate_state.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'isolate_child_state.mapper.dart';

@MappableClass()
class IsolateChildState with IsolateChildStateMappable {
  final IsolateCommonState commonState;

  /// The current isolate state.
  final IsolateState isolateState;

  const IsolateChildState({
    required this.commonState,
    required this.isolateState,
  });
}
