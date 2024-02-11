import 'package:common/src/model/state/isolate_state.dart';
import 'package:common/src/util/isolate_helper.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'isolate_ref_state.mapper.dart';

/// Contains not only the state of the child isolate but also the communication channel.
/// This state is owned by the parent isolate.
@MappableClass()
class IsolateRefState with IsolateRefStateMappable {
  final IsolateCommunication communication;
  final IsolateState isolateState;

  const IsolateRefState({
    required this.communication,
    required this.isolateState,
  });
}
