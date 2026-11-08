import 'dart:io';
import 'dart:isolate';

import 'package:localsend_app/provider/local_ip_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

void main() {
  test('Windows Wi-Fi refresh keeps the caller responsive and shares a pending lookup', () async {
    final directory = await Directory.systemTemp.createTemp('localsend-wifi-test');
    addTearDown(() => directory.delete(recursive: true));
    final ready = ReceivePort();
    addTearDown(ready.close);
    final release = File('${directory.path}/release');
    final service = LocalIpService(SettingsService(MockPersistenceService()), windowsWifiIp: _blockingLookup(ready.sendPort, release.path));

    final first = service.lookupWifiIp();
    final second = service.lookupWifiIp();
    final worker = await ready.first.timeout(const Duration(seconds: 10));
    await release.create();

    expect(await first, '198.51.100.42');
    expect(worker, isNot(Isolate.current.debugName));
    expect(second, same(first));
    final next = service.lookupWifiIp();
    expect(next, isNot(same(first)));
    expect(await next, '198.51.100.42');
  }, skip: !Platform.isWindows);

  test('Windows Wi-Fi refresh uses the native network plugin from the worker', () async {
    final service = LocalIpService(SettingsService(MockPersistenceService()));

    expect(await service.lookupWifiIp(), anyOf(isNull, matches(RegExp(r'^\d+\.\d+\.\d+\.\d+$'))));
  }, skip: !Platform.isWindows);

  test('Windows Wi-Fi refresh can retry a failed worker lookup', () async {
    final service = LocalIpService(SettingsService(MockPersistenceService()), windowsWifiIp: _failedLookup);
    final first = service.lookupWifiIp();
    await expectLater(first, throwsStateError);

    final next = service.lookupWifiIp();
    expect(next, isNot(same(first)));
    await expectLater(next, throwsStateError);
  }, skip: !Platform.isWindows);

  test('Windows Wi-Fi refresh stops waiting without starting another worker', () async {
    final directory = await Directory.systemTemp.createTemp('localsend-wifi-timeout');
    addTearDown(() => directory.delete(recursive: true));
    final ready = ReceivePort();
    addTearDown(ready.close);
    final release = File('${directory.path}/release');
    final service = LocalIpService(SettingsService(MockPersistenceService()), windowsWifiIp: _blockingLookup(ready.sendPort, release.path));

    final first = service.lookupWifiIp();
    try {
      await ready.first.timeout(const Duration(seconds: 10));
      expect(await first.timeout(const Duration(seconds: 4)), isNull);
      expect(service.lookupWifiIp(), same(first));
    } finally {
      await release.create();
    }

    final deadline = Stopwatch()..start();
    while (identical(service.lookupWifiIp(), first) && deadline.elapsed < const Duration(seconds: 5)) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
    expect(await service.lookupWifiIp(), '198.51.100.42');
  }, skip: !Platform.isWindows);

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

Future<String?> Function() _blockingLookup(SendPort ready, String releasePath) => () {
  ready.send(Isolate.current.debugName);
  final release = File(releasePath);
  final deadline = Stopwatch()..start();
  while (!release.existsSync() && deadline.elapsed < const Duration(seconds: 5)) {
    sleep(const Duration(milliseconds: 10));
  }
  return Future.value(release.existsSync() ? '198.51.100.42' : null);
};

Future<String?> _failedLookup() => throw StateError('adapter unavailable');
