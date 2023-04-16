import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/session_status.dart';
import 'package:localsend_app/pages/progress_page.dart';
import 'package:localsend_app/pages/receive_options_page.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/ip_helper.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/ui/snackbar.dart';
import 'package:localsend_app/widget/device_bage.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:routerino/routerino.dart';
import 'package:url_launcher/url_launcher.dart';

class ReceivePage extends ConsumerStatefulWidget {
  const ReceivePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReceivePage> createState() => _ReceivePageState();
}

class _ReceivePageState extends ConsumerState<ReceivePage> {
  String? _message;
  bool _isLink = false;
  bool _showFullIp = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => _init());
  }

  Future<void> _init() async {
    final receiveSession = ref.watch(serverProvider)?.session;
    if (receiveSession == null) {
      return;
    }

    ref.read(selectedReceivingFilesProvider.notifier).init(receiveSession.files.values.map((f) => f.file).toList());
    setState(() {
      // show message if there is only one text file
      _message = receiveSession.message;
      _isLink = _message != null && (_message!.startsWith('http://') || _message!.startsWith('https'));
    });
  }

  void _acceptNothing(WidgetRef ref) {
    ref.read(serverProvider.notifier).acceptFileRequest({});
  }

  void _accept(WidgetRef ref) {
    final selectedFiles = ref.read(selectedReceivingFilesProvider);
    ref.read(serverProvider.notifier).acceptFileRequest(selectedFiles);
  }

  void _decline(WidgetRef ref) {
    ref.read(serverProvider.notifier).declineFileRequest();
  }

  @override
  Widget build(BuildContext context) {
    final receiveSession = ref.watch(serverProvider)?.session;
    if (receiveSession == null) {
      // when declining/accepting the request, there is a short frame where tempRequest is null
      return Scaffold(
        body: Container(),
      );
    }
    final selectedFiles = ref.watch(selectedReceivingFilesProvider);

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
              child: Builder(
                builder: (context) {
                  final height = MediaQuery.of(context).size.height;
                  final smallUi = _message != null && height < 600;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: smallUi ? 20 : 30),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!smallUi)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Icon(receiveSession.sender.deviceType.icon, size: 64),
                                ),
                              FittedBox(
                                child: Text(
                                  receiveSession.sender.alias,
                                  style: TextStyle(fontSize: smallUi ? 32 : 48),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() => _showFullIp = !_showFullIp);
                                    },
                                    child: DeviceBadge(
                                      color: Theme.of(context).colorScheme.tertiaryContainer,
                                      label: _showFullIp ? receiveSession.sender.ip : '#${receiveSession.sender.ip.visualId}',
                                    ),
                                  ),
                                  if (receiveSession.sender.deviceModel != null)
                                    ...[
                                      const SizedBox(width: 10),
                                      DeviceBadge(
                                        color: Theme.of(context).colorScheme.tertiaryContainer,
                                        label: receiveSession.sender.deviceModel!,
                                      ),
                                    ],
                                ],
                              ),
                              const SizedBox(height: 40),
                              Text(
                                _message != null
                                    ? (_isLink ? t.receivePage.subTitleLink : t.receivePage.subTitleMessage)
                                    : t.receivePage.subTitle(n: receiveSession.files.length),
                                style: smallUi ? null : Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                              if (_message != null)
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
                                                _message!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            unawaited(
                                              Clipboard.setData(ClipboardData(text: _message)),
                                            );
                                            if (checkPlatformIsDesktop()) {
                                              context.showSnackBar(t.general.copiedToClipboard);
                                            }
                                            _acceptNothing(ref);
                                            context.pop();
                                          },
                                          child: Text(t.general.copy),
                                        ),
                                        if (_isLink)
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Theme.of(context).buttonTheme.colorScheme!.primary,
                                                foregroundColor: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                                              ),
                                              onPressed: () {
                                                unawaited(launchUrl(Uri.parse(_message!)));
                                                _acceptNothing(ref);
                                                context.pop();
                                              },
                                              child: Text(t.general.open),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        if (receiveSession.status == SessionStatus.waiting && _message == null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                foregroundColor: Theme.of(context).colorScheme.onSurface,
                              ),
                              onPressed: () async {
                                await context.push(() => const ReceiveOptionsPage());
                              },
                              icon: const Icon(Icons.settings),
                              label: Text(t.receiveOptionsPage.title),
                            ),
                          ),
                        if (receiveSession.status == SessionStatus.canceledBySender) ...[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              t.receivePage.canceled,
                              style: TextStyle(color: Theme.of(context).colorScheme.warning),
                              textAlign: TextAlign.center,
                            ),
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
                        ] else if (_message != null)
                          Center(
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                foregroundColor: Theme.of(context).colorScheme.onSurface,
                              ),
                              onPressed: () {
                                _acceptNothing(ref);
                                context.pop();
                              },
                              icon: const Icon(Icons.close),
                              label: Text(t.general.close),
                            ),
                          )
                        else
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).colorScheme.error,
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
                                onPressed: selectedFiles.isEmpty
                                    ? null
                                    : () async {
                                        final sessionId = ref.read(serverProvider)?.session?.sessionId;
                                        if (sessionId == null) {
                                          return;
                                        }
                                        _accept(ref);
                                        await context.pushAndRemoveUntilImmediately(
                                          removeUntil: ReceivePage,
                                          builder: () => ProgressPage(
                                            showAppBar: false,
                                            closeSessionOnClose: true,
                                            sessionId: sessionId,
                                          ),
                                        );
                                      },
                                icon: const Icon(Icons.check_circle),
                                label: Text(t.general.accept),
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
