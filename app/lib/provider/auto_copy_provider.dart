import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

final autoCopyToClipboardProvider = NotifierProvider<_AutoCopyService, bool>(
  (ref) => _AutoCopyService(ref.read(persistenceProvider)),
);

class _AutoCopyService extends PureNotifier<bool> {
  final PersistenceService _persistence;

  _AutoCopyService(this._persistence);

  @override
  bool init() => _persistence.isAutoCopyToClipboard();

  Future<void> set(bool value) async {
    await _persistence.setAutoCopyToClipboard(value);
    state = value;
  }
}
