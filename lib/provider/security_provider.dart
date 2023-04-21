import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/model/persistence/stored_security_context.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/util/security_helper.dart';

/// This provider manages the [StoredSecurityContext].
/// It contains all the security related data for HTTPS communication.
final securityProvider = NotifierProvider<SecurityNotifier, StoredSecurityContext>(() {
  return SecurityNotifier();
});

class SecurityNotifier extends Notifier<StoredSecurityContext> {
  late PersistenceService _service;

  SecurityNotifier();

  @override
  StoredSecurityContext build() {
    _service = ref.watch(persistenceProvider);
    return _service.getSecurityContext();
  }

  /// Generates a new [StoredSecurityContext] and persists it.
  Future<void> reset() async {
    final securityContext = generateSecurityContext();
    await _service.setSecurityContext(securityContext);
    state = securityContext;
  }
}
