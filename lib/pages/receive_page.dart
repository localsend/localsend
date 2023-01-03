import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/file_type.dart';
import 'package:localsend_app/model/server/receive_state.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/util/ip_helper.dart';
import 'package:localsend_app/widget/device_bage.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:routerino/routerino.dart';

class ReceivePage extends ConsumerWidget {
  const ReceivePage({Key? key}) : super(key: key);

  void _acceptNothing(WidgetRef ref, ReceiveState receiveState) {
    ref.read(serverProvider.notifier).acceptFileRequest({});
  }

  void _acceptAll(WidgetRef ref, ReceiveState receiveState) {
    ref.read(serverProvider.notifier).acceptFileRequest(receiveState.files.values.map((f) => f.file.id).toSet());
  }

  void _decline(WidgetRef ref) {
    ref.read(serverProvider.notifier).declineFileRequest();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiveState = ref.watch(serverProvider)?.receiveState;
    if (receiveState == null) {
      // when declining/accepting the request, there is a short frame where tempRequest is null
      return Scaffold(
        body: Container(),
      );
    }

    final firstFile = receiveState.files.values.first.file;
    // show message if there is only one text file
    final message = receiveState.files.length == 1 && firstFile.fileType == FileType.text && firstFile.preview != null ? firstFile.preview : null;

    return WillPopScope(
      onWillPop: () async {
        _decline(ref);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: ResponsiveListView.defaultMaxWidth),
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
                            message != null ? t.receivePage.subTitleMessage : t.receivePage.subTitle(n: receiveState.files.length),
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                          ),
                          if (message != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                    height: 100,
                                    child: Card(
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: SelectableText(
                                            message,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(text: message));
                                    },
                                    child: Text(t.general.copy),
                                  ),
                                )
                              ],
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
                    else if (message != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: Theme.of(context).colorScheme.onSurface,
                            ),
                            onPressed: () {
                              _acceptNothing(ref, receiveState);
                              context.pop();
                            },
                            icon: const Icon(Icons.close),
                            label: Text(t.general.close),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).buttonTheme.colorScheme!.primary,
                              foregroundColor: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                            ),
                            onPressed: () {
                              _acceptAll(ref, receiveState);
                              context.pushAndRemoveUntilImmediately(
                                removeUntil: ReceivePage,
                                builder: () => const ProgressPage(),
                              );
                            },
                            icon: const Icon(Icons.save),
                            label: Text(t.general.save),
                          ),
                        ],
                      )
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
                              _decline(ref);
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
                              _acceptAll(ref, receiveState);
                              context.pushAndRemoveUntilImmediately(
                                removeUntil: ReceivePage,
                                builder: () => const ProgressPage(),
                              );
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
          ),
        ),
      ),
    );
  }
}
