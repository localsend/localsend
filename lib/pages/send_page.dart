import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:localsend_app/widget/list_tile/device_list_tile.dart';

class SendPage extends ConsumerStatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SendPage> createState() => _SendPageState();
}

class _SendPageState extends ConsumerState<SendPage> {
  Device? _myDevice;
  Device? _targetDevice;

  // show name of sender after a delay
  bool _showName = false;

  @override
  void initState() {
    super.initState();

    sleepAsync(500).then((value) {
      if (mounted) {
        setState(() => _showName = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final sendState = ref.watch(sendProvider);
    if (sendState == null && _myDevice == null && _targetDevice == null) {
      return Scaffold(
        body: Container(),
      );
    }
    final myDevice = ref.watch(deviceInfoProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Hero(
                      tag: 'this-device',
                      child: DeviceListTile(
                        device: myDevice,
                        thisDevice: !_showName,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Icon(Icons.arrow_downward),
                    const SizedBox(height: 20),
                    Hero(
                      tag: 'device-${(sendState?.target ?? _targetDevice)?.ip}',
                      child: DeviceListTile(
                        device: sendState?.target ?? _targetDevice!,
                      ),
                    ),
                  ],
                ),
              ),
              if (sendState != null)
                ...[
                  if (sendState.status == SessionStatus.waiting)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(t.sendPage.waiting, textAlign: TextAlign.center),
                    )
                  else if (sendState.status == SessionStatus.declined)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(t.sendPage.rejected, style: const TextStyle(color: Colors.orange), textAlign: TextAlign.center),
                    ),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _myDevice = myDevice;
                          _targetDevice = sendState.target;
                        });
                        ref.read(sendProvider.notifier).cancel();
                        context.pop();
                      },
                      icon: Icon(sendState.status == SessionStatus.declined ? Icons.check_circle : Icons.close),
                      label: Text(sendState.status == SessionStatus.declined ? t.general.close : t.general.cancel),
                    ),
                  ),
                ],
            ],
          ),
        ),
      ),
    );
  }
}
