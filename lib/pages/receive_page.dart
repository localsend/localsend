import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/util/ip_helper.dart';
import 'package:localsend_app/widget/device_bage.dart';

class ReceivePage extends ConsumerWidget {
  const ReceivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempRequest = ref.watch(serverProvider)?.tempRequest;
    if (tempRequest == null) {
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
                    Icon(tempRequest.sender.deviceType.icon, size: 64),
                    const SizedBox(height: 10),
                    Text(
                      tempRequest.sender.alias,
                      style: const TextStyle(fontSize: 48),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DeviceBadge(
                          color: Theme.of(context).colorScheme.tertiaryContainer,
                          label: '#${tempRequest.sender.ip.visualId}',
                        ),
                        if (tempRequest.sender.deviceModel != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: DeviceBadge(
                              color: Theme.of(context).colorScheme.tertiaryContainer,
                              label: tempRequest.sender.deviceModel!,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      t.receivePage.subTitle(n: tempRequest.files.length),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
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
                      ref.read(serverProvider.notifier).acceptFileRequest(tempRequest.files.values.map((f) => f.id).toSet());
                      context.pop();
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
