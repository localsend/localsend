import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/src/isolate/child/main.dart';
import 'package:localsend_isolates/src/isolate/dto/send_to_isolate_data.dart';
import 'package:localsend_isolates/src/task/discovery/discovery.dart';
import 'package:typed_isolates/typed_isolates.dart';

sealed class DiscoveryTask {}

/// A result sent from the discovery isolate to the main isolate,
/// routed to the task that requested it.
sealed class DiscoveryResult {}

/// A confirmed device, emitted on the [DiscoveryListenTask] stream.
class DiscoveryDeviceResult implements DiscoveryResult {
  final Device device;

  DiscoveryDeviceResult({
    required this.device,
  });
}

/// The retained confirmations of one stored device, answering a
/// [DiscoveryDeviceLogsTask].
class DiscoveryDeviceLogsResult implements DiscoveryResult {
  final List<DeviceLog> logs;

  DiscoveryDeviceLogsResult({
    required this.logs,
  });
}

/// Starts the discovery and streams every confirmed device.
/// The stream never completes; it survives [DiscoveryRestartTask]s.
class DiscoveryListenTask implements DiscoveryTask {}

/// Sends an announcement to all devices on all network interfaces.
/// They will respond by registering with this device's HTTP server.
class DiscoveryAnnouncementTask implements DiscoveryTask {}

/// Restarts the discovery, e.g. after the port or the network settings changed.
class DiscoveryRestartTask implements DiscoveryTask {}

/// Scans the subnet of one network interface over HTTP.
/// Completes (without events) when the scan is finished; the found devices
/// arrive on the [DiscoveryListenTask] stream.
class DiscoverySubnetScanTask implements DiscoveryTask {
  final String networkInterface;
  final int port;
  final bool https;

  DiscoverySubnetScanTask({
    required this.networkInterface,
    required this.port,
    required this.https,
  });
}

/// Discovers devices in stages, cheapest first: announcement and favorite
/// probes right away, a subnet scan only when nothing was confirmed within
/// the grace period.
/// Completes (without events) when every stage has finished; the found
/// devices arrive on the [DiscoveryListenTask] stream.
class DiscoveryStagedScanTask implements DiscoveryTask {
  final List<(String, int)> favorites;
  final List<String> networkInterfaces;
  final int port;
  final bool https;
  final Duration grace;

  DiscoveryStagedScanTask({
    required this.favorites,
    required this.networkInterfaces,
    required this.port,
    required this.https,
    required this.grace,
  });
}

/// Feeds a device confirmed outside of the discovery into the store, e.g. one
/// that registered with this device's HTTP server. The device comes back on
/// the [DiscoveryListenTask] stream.
class DiscoveryAddDeviceTask implements DiscoveryTask {
  final Device device;

  DiscoveryAddDeviceTask({
    required this.device,
  });
}

/// Fetches the retained confirmations of a stored device, oldest first.
/// Answered with one [DiscoveryDeviceLogsResult]; the logs are empty when
/// the fingerprint is unknown.
class DiscoveryDeviceLogsTask implements DiscoveryTask {
  final String fingerprint;

  DiscoveryDeviceLogsTask({
    required this.fingerprint,
  });
}

Future<void> setupDiscoveryIsolate(
  Stream<SendToIsolateData<IsolateTask<DiscoveryTask>>> receiveFromMain,
  void Function(IsolateTaskStreamResult<DiscoveryResult>) sendToMain,
  InitialData initialData,
) async {
  await setupChildIsolateHelper(
    debugLabel: 'DiscoveryIsolate',
    receiveFromMain: receiveFromMain,
    sendToMain: sendToMain,
    initialData: initialData,
    handler: (ref, task) async {
      switch (task.data) {
        case DiscoveryListenTask():
          await for (final device in ref.read(discoveryProvider).startListener()) {
            sendToMain(
              IsolateTaskStreamResult.event(
                id: task.id,
                data: DiscoveryDeviceResult(device: device),
              ),
            );
          }
          return;
        case DiscoveryAnnouncementTask():
          await ref.read(discoveryProvider).sendAnnouncement();
          break;
        case DiscoveryRestartTask():
          ref.read(discoveryProvider).restartListener();
          break;
        case DiscoverySubnetScanTask data:
          await ref
              .read(discoveryProvider)
              .scanSubnet(
                networkInterface: data.networkInterface,
                port: data.port,
                https: data.https,
              );
          break;
        case DiscoveryStagedScanTask data:
          await ref
              .read(discoveryProvider)
              .discoverStaged(
                favorites: data.favorites,
                networkInterfaces: data.networkInterfaces,
                port: data.port,
                https: data.https,
                grace: data.grace,
              );
          break;
        case DiscoveryAddDeviceTask data:
          await ref.read(discoveryProvider).addDevice(data.device);
          break;
        case DiscoveryDeviceLogsTask data:
          final logs = await ref.read(discoveryProvider).deviceLogs(data.fingerprint);
          sendToMain(
            IsolateTaskStreamResult.event(
              id: task.id,
              data: DiscoveryDeviceLogsResult(logs: logs),
            ),
          );
          break;
      }
      sendToMain(
        IsolateTaskStreamResult.done(
          id: task.id,
        ),
      );
    },
  );
}
