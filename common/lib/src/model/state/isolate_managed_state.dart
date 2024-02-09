import 'package:common/src/model/state/isolate_state.dart';
import 'package:common/src/util/isolate_helper.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'isolate_managed_state.mapper.dart';

@MappableClass()
class IsolateManagedState with IsolateManagedStateMappable {
  final IsolateCommunication communication;
  final IsolateState isolateState;

  const IsolateManagedState({
    required this.communication,
    required this.isolateState,
  });
}
