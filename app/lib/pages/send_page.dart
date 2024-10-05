import 'dart:async';

import 'package:common/model/device.dart';
import 'package:common/model/session_status.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/favorites_provider.dart';
import 'package:localsend_app/provider/network/send_provider.dart';
import 'package:localsend_app/util/favorites.dart';
import 'package:localsend_app/util/native/taskbar_helper.dart';
import 'package:localsend_app/widget/animations/initial_fade_transition.dart';
import 'package:localsend_app/widget/animations/initial_slide_transition.dart';
import 'package:localsend_app/widget/dialogs/error_dialog.dart';
import 'package:localsend_app/widget/list_tile/device_list_tile.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

class SendPage extends StatefulWidget {
  final bool showAppBar;
  final bool closeSessionOnClose;
  final String sessionId;

  const SendPage({
    required this.showAppBar,
    required this.closeSessionOnClose,
    required this.sessionId,
  });

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> with Refena {
  Device? _myDevice;
  Device? _targetDevice;

  @override
  void dispose() {
    super.dispose();
    unawaited(TaskbarHelper.clearProgressBar());
  }

  void _cancel() {
    // the state will be lost so we store them temporarily (only for UI)
    final myDevice = ref.read(deviceFullInfoProvider);
    final sendState = ref.read(sendProvider)[widget.sessionId];
    if (sendState == null) {
      return;
    }

    setState(() {
      _myDevice = myDevice;
      _targetDevice = sendState.target;
    });
    ref.notifier(sendProvider).cancelSession(widget.sessionId);
  }

  @override
  Widget build(BuildContext context) {
    final sendState = ref.watch(sendProvider.select((state) => state[widget.sessionId]), listener: (prev, next) {
      final prevStatus = prev[widget.sessionId]?.status;
      final nextStatus = next[widget.sessionId]?.status;
      if (prevStatus != nextStatus) {
        // ignore: discarded_futures
        TaskbarHelper.visualizeStatus(nextStatus);
      }
    });
    if (sendState == null && _myDevice == null && _targetDevice == null) {
      return Scaffold(
        body: Container(),
      );
    }
    final myDevice = ref.watch(deviceFullInfoProvider);
    final targetDevice = sendState?.target ?? _targetDevice!;
    final targetFavoriteEntry = ref.watch(favoritesProvider.select((state) => state.findDevice(targetDevice)));
    final waiting = sendState?.status == SessionStatus.waiting;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && widget.closeSessionOnClose) {
          _cancel();
        }
      },
      canPop: true,
      child: Scaffold(
        appBar: widget.showAppBar ? AppBar() : null,
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
                          InitialSlideTransition(
                            origin: const Offset(0, -1),
                            duration: const Duration(milliseconds: 400),
                            child: DeviceListTile(
                              device: myDevice,
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
                            tag: 'device-${targetDevice.ip}',
                            child: DeviceListTile(
                              device: targetDevice,
                              nameOverride: targetFavoriteEntry?.alias,
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
                            switch (sendState.status) {
                              SessionStatus.waiting => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Text(t.sendPage.waiting, textAlign: TextAlign.center),
                                ),
                              SessionStatus.declined => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    t.sendPage.rejected,
                                    style: TextStyle(color: Theme.of(context).colorScheme.warning),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              SessionStatus.tooManyAttempts => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    t.sendPage.tooManyAttempts,
                                    style: TextStyle(color: Theme.of(context).colorScheme.warning),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              SessionStatus.recipientBusy => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    t.sendPage.busy,
                                    style: TextStyle(color: Theme.of(context).colorScheme.warning),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              SessionStatus.finishedWithErrors => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(t.general.error, style: TextStyle(color: Theme.of(context).colorScheme.warning)),
                                      if (sendState.errorMessage != null)
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Theme.of(context).colorScheme.warning,
                                          ),
                                          onPressed: () async => showDialog(
                                            context: context,
                                            builder: (_) => ErrorDialog(error: sendState.errorMessage!),
                                          ),
                                          child: const Icon(Icons.info),
                                        ),
                                    ],
                                  ),
                                ),
                              _ => const SizedBox(),
                            },
                            Center(
                              child: FilledButton.icon(
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
