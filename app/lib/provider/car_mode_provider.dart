import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';

/// User preference for the car dashboard.
///
/// `null` means "detect automatically".
final carModeProvider = NotifierProvider<CarModeService, bool?>(
  (ref) => CarModeService(ref.read(persistenceProvider)),
);

class CarModeService extends PureNotifier<bool?> {
  final PersistenceService _persistence;

  CarModeService(this._persistence);

  @override
  bool? init() => _persistence.getCarModeOverride();

  /// Stores the user choice.
  ///
  /// When the choice matches the auto-detected value, the override is removed
  /// so that the dashboard follows the screen again.
  Future<void> setEnabled(bool enabled, {required bool matchesAuto}) async {
    final value = matchesAuto ? null : enabled;
    await _persistence.setCarModeOverride(value);
    state = value;
  }
}
