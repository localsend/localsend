import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/nearby_devices_provider.dart';
import 'package:localsend_app/widget/device_widget.dart';

class SendPage extends ConsumerStatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SendPage> createState() => _SendPageState();
}

class _SendPageState extends ConsumerState<SendPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final devices = ref.watch(nearbyDevicesProvider);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      children: [
        ...devices.when(
          data: (data) {
            return data.map((device) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: DeviceWidget(device: device),
              );
            });
          },
          error: (e, st) {
            return [
              Center(
                child: Text(e.toString()),
              ),
            ];
          },
          loading: () {
            return [
              const Center(
                child: CircularProgressIndicator(),
              ),
            ];
          },
        ),
      ],
    );
  }
}
