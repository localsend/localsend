import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

void main() {
  test('should keep one connectivity listener when reinitialized', () async {
    var listenCount = 0;
    final subscriptionCanceled = Completer<void>();
    final connectivityChanges = StreamController<List<ConnectivityResult>>.broadcast(
      onListen: () => listenCount++,
      onCancel: () {
        if (!subscriptionCanceled.isCompleted) {
          subscriptionCanceled.complete();
        }
      },
    );
    addTearDown(connectivityChanges.close);
    final notifier = _TestLocalIpService(
      SettingsService(MockPersistenceService()),
      connectivityChangesFactory: () => connectivityChanges.stream,
    );
    final service = ReduxNotifier.test(
      redux: notifier,
    );

    service.dispatch(_InitLocalIpActionWithoutFetch());
    service.dispatch(_InitLocalIpActionWithoutFetch());

    expect(listenCount, 1);

    notifier.disposeForTest();
    await subscriptionCanceled.future;
    expect(connectivityChanges.hasListener, isFalse);
  });

  group('rankIpAddresses', () {
    test('should only sort list if no primary', () {
      expect(rankIpAddresses(['123.456', '222.1', '321.222'], null), ['123.456', '321.222', '222.1']);
    });

    test('should only take primary', () {
      expect(rankIpAddresses([], '123.123'), ['123.123']);
    });

    test('should sort primary first', () {
      expect(rankIpAddresses(['123.456', '222.1', '321.222'], '123.123'), ['123.123', '123.456', '321.222', '222.1']);
    });

    test('should sort primary first and remove duplicates', () {
      expect(rankIpAddresses(['123.456', '123.123', '222.1', '222.1', '321.222'], '123.123'), ['123.123', '123.456', '321.222', '222.1']);
    });
  });
}

class _InitLocalIpActionWithoutFetch extends InitLocalIpAction {
  @override
  void after() {}
}

class _TestLocalIpService extends LocalIpService {
  _TestLocalIpService(
    super.settingsService, {
    required super.connectivityChangesFactory,
  });

  void disposeForTest() => dispose();
}
