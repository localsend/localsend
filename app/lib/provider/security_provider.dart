import 'package:localsend_app/model/persistence/stored_security_context.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/util/security_helper.dart';
import 'package:riverpie_flutter/riverpie_flutter.dart';

/// This provider manages the [StoredSecurityContext].
/// It contains all the security related data for HTTPS communication.
final securityProvider = NotifierProvider<SecurityNotifier, StoredSecurityContext>((read) {
  return SecurityNotifier();
});

class SecurityNotifier extends Notifier<StoredSecurityContext> {
  late PersistenceService _service;

  SecurityNotifier();

  @override
  StoredSecurityContext init() {
    _service = ref.read(persistenceProvider);
    return _service.getSecurityContext();
  }

  /// Generates a new [StoredSecurityContext] and persists it.
  Future<void> reset() async {
    final securityContext = generateSecurityContext();
    await _service.setSecurityContext(securityContext);
    state = securityContext;
  }
}
