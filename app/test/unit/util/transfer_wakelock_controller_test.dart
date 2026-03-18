import 'package:localsend_app/util/wakelock/transfer_wakelock_controller.dart';
import 'package:localsend_app/util/wakelock/wakelock_service.dart';
import 'package:test/test.dart';

class FakeWakeLockService implements WakeLockService {
  int enableCalls = 0;
  int disableCalls = 0;

  @override
  Future<void> enable() async {
    enableCalls += 1;
  }

  @override
  Future<void> disable() async {
    disableCalls += 1;
  }
}

void main() {
  test('enables only once when transfers start', () {
    final service = FakeWakeLockService();
    final controller = TransferWakelockController(
      service: service,
      enabledForPlatform: true,
    );

    controller.setActiveTransfers(1);
    controller.setActiveTransfers(2);

    expect(service.enableCalls, 1);
    expect(service.disableCalls, 0);
  });

  test('disables when last transfer ends', () {
    final service = FakeWakeLockService();
    final controller = TransferWakelockController(
      service: service,
      enabledForPlatform: true,
    );

    controller.setActiveTransfers(1);
    controller.setActiveTransfers(0);

    expect(service.enableCalls, 1);
    expect(service.disableCalls, 1);
  });

  test('disables on dispose when active', () async {
    final service = FakeWakeLockService();
    final controller = TransferWakelockController(
      service: service,
      enabledForPlatform: true,
    );

    controller.setActiveTransfers(1);
    await controller.dispose();

    expect(service.enableCalls, 1);
    expect(service.disableCalls, 1);
  });

  test('does not disable again on dispose when already idle', () async {
    final service = FakeWakeLockService();
    final controller = TransferWakelockController(
      service: service,
      enabledForPlatform: true,
    );

    controller.setActiveTransfers(1);
    controller.setActiveTransfers(0);
    await controller.dispose();

    expect(service.enableCalls, 1);
    expect(service.disableCalls, 1);
  });
}
