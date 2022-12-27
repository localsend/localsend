import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/util/ip_helper.dart';
import 'package:localsend_app/widget/device_bage.dart';
import 'package:routerino/routerino.dart';

class ReceivePage extends ConsumerWidget {
  const ReceivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiveState = ref.watch(serverProvider)?.receiveState;
    if (receiveState == null) {
      // when declining/accepting the request, there is a short frame where tempRequest is null
      return Scaffold(
        body: Container(),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(receiveState.sender.deviceType.icon, size: 64),
                    const SizedBox(height: 10),
                    Text(
                      receiveState.sender.alias,
                      style: const TextStyle(fontSize: 48),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DeviceBadge(
                          color: Theme.of(context).colorScheme.tertiaryContainer,
                          label: '#${receiveState.sender.ip.visualId}',
                        ),
                        if (receiveState.sender.deviceModel != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: DeviceBadge(
                              color: Theme.of(context).colorScheme.tertiaryContainer,
                              label: receiveState.sender.deviceModel!,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      t.receivePage.subTitle(n: receiveState.files.length),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              if (receiveState.status == SessionStatus.canceledBySender)
                ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(t.receivePage.canceled, style: const TextStyle(color: Colors.orange), textAlign: TextAlign.center),
                  ),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ref.read(serverProvider.notifier).closeSession();
                        context.pop();
                      },
                      icon: const Icon(Icons.check_circle),
                      label: Text(t.general.close),
                    ),
                  ),
                ]
              else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).buttonTheme.colorScheme!.error,
                      foregroundColor: Colors.white, // wrong in dark mode, so we hard code this
                    ),
                    onPressed: () {
                      ref.read(serverProvider.notifier).declineFileRequest();
                      context.pop();
                    },
                    icon: const Icon(Icons.close),
                    label: Text(t.general.decline),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).buttonTheme.colorScheme!.primary,
                        foregroundColor: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                    ),
                    onPressed: () {
                      ref.read(serverProvider.notifier).acceptFileRequest(receiveState.files.values.map((f) => f.file.id).toSet());
                      context.pushImmediately(() => const ProgressPage());
                    },
                    icon: const Icon(Icons.check_circle),
                    label: Text(t.general.accept),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
