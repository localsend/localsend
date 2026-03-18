import 'package:wakelock_plus/wakelock_plus.dart';

abstract class WakeLockService {
  Future<void> enable();
  Future<void> disable();
}

class WakelockPlusService implements WakeLockService {
  @override
  Future<void> enable() {
    return WakelockPlus.enable();
  }

  @override
  Future<void> disable() {
    return WakelockPlus.disable();
  }
}
