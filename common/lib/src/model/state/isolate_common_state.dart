import 'package:common/src/model/stored_security_context.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'isolate_common_state.mapper.dart';

/// The state that is synced across all isolates.
@MappableClass()
class IsolateCommonState with IsolateCommonStateMappable {
  final StoredSecurityContext? securityContext;

  const IsolateCommonState({
    required this.securityContext,
  });
}
