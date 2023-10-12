import 'package:localsend_app/model/persistence/stored_security_context.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/util/security_helper.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// This provider manages the [StoredSecurityContext].
/// It contains all the security related data for HTTPS communication.
final securityProvider = ReduxProvider<SecurityService, StoredSecurityContext>((ref) {
  return SecurityService(ref.read(persistenceProvider));
});

class SecurityService extends ReduxNotifier<StoredSecurityContext> {
  final PersistenceService _persistence;

  SecurityService(this._persistence);

  @override
  StoredSecurityContext init() {
    return _persistence.getSecurityContext();
  }
}

/// Generates a new [StoredSecurityContext] and persists it.
class ResetSecurityContextAction extends AsyncReduxAction<SecurityService, StoredSecurityContext> {
  @override
  Future<StoredSecurityContext> reduce() async {
    final securityContext = generateSecurityContext();
    await notifier._persistence.setSecurityContext(securityContext);
    return securityContext;
  }
}
