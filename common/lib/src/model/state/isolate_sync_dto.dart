import 'package:common/src/model/state/isolate_common_state.dart';
import 'package:common/src/model/state/isolate_state.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'isolate_sync_dto.mapper.dart';

@MappableClass()
class IsolateSyncDto with IsolateSyncDtoMappable {
  final IsolateState isolateState;
  final IsolateCommonState isolateCommonState;

  const IsolateSyncDto({
    required this.isolateState,
    required this.isolateCommonState,
  });
}
