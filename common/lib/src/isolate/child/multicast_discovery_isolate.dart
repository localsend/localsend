import 'package:common/model/device.dart';
import 'package:common/src/discovery/multicast_discovery.dart';
import 'package:common/src/isolate/child/main.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:meta/meta.dart';

/// Sends an announcement to all devices to all network interfaces.
/// They will respond with their device information.
class MulticastAnnouncementTask {
  static const instance = MulticastAnnouncementTask._();

  const MulticastAnnouncementTask._();
}

@internal
Future<void> setupMulticastDiscoveryIsolate(
  Stream<SendToIsolateData<MulticastAnnouncementTask>> receiveFromMain,
  void Function(Device) sendToMain,
  InitialData initialData,
) async {
  await setupChildIsolateHelper(
    debugLabel: 'MulticastDiscoveryIsolate',
    receiveFromMain: receiveFromMain,
    sendToMain: sendToMain,
    initialData: initialData,
    init: () async {
      isolateContainer.read(multicastDiscoveryProvider).startListener().listen((event) {
        sendToMain(event);
      });
    },
    handler: (_) async {
      await isolateContainer.read(multicastDiscoveryProvider).sendAnnouncement();
    },
  );
}
