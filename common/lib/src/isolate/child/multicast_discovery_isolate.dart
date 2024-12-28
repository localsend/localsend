import 'package:common/model/device.dart';
import 'package:common/src/isolate/child/main.dart';
import 'package:common/src/isolate/dto/send_to_isolate_data.dart';
import 'package:common/src/task/discovery/multicast_discovery.dart';
import 'package:meta/meta.dart';

sealed class MulticastTask {}

/// Sends an announcement to all devices to all network interfaces.
/// They will respond with their device information.
///
/// This is not wrapped in an [IsolateTask] because
/// - (1) it is not important if the device was found by this specific announcement or another one
/// - (2) it is not 100% accurate to know if a device was found by this announcement or another one
class MulticastAnnouncementTask implements MulticastTask {
  static const instance = MulticastAnnouncementTask._();

  const MulticastAnnouncementTask._();
}

/// Restarts the listener.
class MulticastRestartListenerTask implements MulticastTask {
  static const instance = MulticastRestartListenerTask._();

  const MulticastRestartListenerTask._();
}

@internal
Future<void> setupMulticastDiscoveryIsolate(
  Stream<SendToIsolateData<MulticastTask>> receiveFromMain,
  void Function(Device) sendToMain,
  InitialData initialData,
) async {
  await setupChildIsolateHelper(
    debugLabel: 'MulticastDiscoveryIsolate',
    receiveFromMain: receiveFromMain,
    sendToMain: sendToMain,
    initialData: initialData,
    init: (ref) async {
      ref.read(multicastDiscoveryProvider).startListener().listen((event) {
        sendToMain(event);
      });
    },
    handler: (ref, task) async {
      switch (task) {
        case MulticastAnnouncementTask():
          await ref.read(multicastDiscoveryProvider).sendAnnouncement();
          break;
        case MulticastRestartListenerTask():
          ref.read(multicastDiscoveryProvider).restartListener();
          break;
      }
    },
  );
}
