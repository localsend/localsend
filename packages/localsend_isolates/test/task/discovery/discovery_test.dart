// Regression test: a staged scan dispatched while the discovery is still
// starting used to be dropped silently. The app's first automatic scan races
// the discovery startup (the listener is dispatched un-awaited at app start),
// and a dropped scan is only recoverable on a LAN, where the startup
// announcement makes every peer register again — over a tailnet nothing
// re-finds a peer until the user manually rescans.
//
// Needs no Rust dylib: the scan must wait before it ever reaches the bridge.
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_isolates/src/task/discovery/discovery.dart';
import 'package:refena_flutter/refena_flutter.dart';

void main() {
  test('a staged scan waits for the discovery to start instead of being dropped', () async {
    final container = RefenaContainer();
    const startTimeout = Duration(milliseconds: 200);
    final service = DiscoveryService(container, startTimeout: startTimeout);

    final stopwatch = Stopwatch()..start();
    await service.discoverStaged(
      favorites: const [],
      networkInterfaces: const [],
      port: 53317,
      https: true,
      grace: Duration.zero,
    );
    stopwatch.stop();

    expect(
      stopwatch.elapsed,
      greaterThanOrEqualTo(startTimeout),
      reason: 'a scan arriving while the discovery is starting must wait for it, not be silently dropped',
    );
  });
}
