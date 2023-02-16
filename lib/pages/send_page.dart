import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:localsend_app/widget/animations/initial_fade_transition.dart';
import 'package:localsend_app/widget/dialogs/error_dialog.dart';
import 'package:localsend_app/widget/list_tile/device_list_tile.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:routerino/routerino.dart';

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

    sleepAsync(800).then((value) {
      if (mounted) {
        setState(() => _showName = true);
      }
    });
  }

  void _cancel() {
    // the state will be lost so we store them temporarily (only for UI)
    final myDevice = ref.read(deviceInfoProvider);
    final sendState = ref.read(sendProvider);
    if (sendState == null) {
      return;
    }

    setState(() {
      _myDevice = myDevice;
      _targetDevice = sendState.target;
    });
    ref.read(sendProvider.notifier).cancelSession();
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
    final waiting = sendState?.status == SessionStatus.waiting;

    return WillPopScope(
      onWillPop: () async {
        _cancel();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: ResponsiveListView.defaultMaxWidth),
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
                          const InitialFadeTransition(
                            duration: Duration(milliseconds: 300),
                            delay: Duration(milliseconds: 400),
                            child: Icon(Icons.arrow_downward),
                          ),
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
                      InitialFadeTransition(
                        duration: const Duration(milliseconds: 300),
                        delay: const Duration(milliseconds: 400),
                        child: Column(
                          children: [
                            if (sendState.status == SessionStatus.waiting)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text(t.sendPage.waiting, textAlign: TextAlign.center),
                              )
                            else if (sendState.status == SessionStatus.declined)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text(t.sendPage.rejected, style: const TextStyle(color: Colors.orange), textAlign: TextAlign.center),
                              )
                            else if (sendState.status == SessionStatus.recipientBusy)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text(t.sendPage.busy, style: const TextStyle(color: Colors.orange), textAlign: TextAlign.center),
                              )
                            else if (sendState.status == SessionStatus.finishedWithErrors)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(t.general.error, style: const TextStyle(color: Colors.orange)),
                                    if (sendState.errorMessage != null)
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.orange,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => ErrorDialog(error: sendState.errorMessage!),
                                          );
                                        },
                                        child: const Icon(Icons.info),
                                      ),
                                  ],
                                ),
                              ),
                            Center(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  _cancel();
                                  context.pop();
                                },
                                icon: Icon(waiting ? Icons.close : Icons.check_circle),
                                label: Text(waiting ? t.general.cancel : t.general.close),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
