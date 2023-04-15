import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:localsend_app/util/ui/snackbar.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';

enum _ServerState { initializing, running, error, stopping }

class WebSharePage extends ConsumerStatefulWidget {
  final List<CrossFile> files;

  const WebSharePage(this.files);

  @override
  ConsumerState<WebSharePage> createState() => _WebSharePageState();
}

class _WebSharePageState extends ConsumerState<WebSharePage> {
  _ServerState _stateEnum = _ServerState.initializing;
  String? _initializedError;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  void _init() async {
    await sleepAsync(500);
    final settings = ref.read(settingsProvider);
    try {
      await ref.read(serverProvider.notifier).restartServer(
        alias: settings.alias,
        port: settings.port,
        https: false, // always start unencrypted
      );
      await ref.read(serverProvider.notifier).initializeWebSend(widget.files);
      setState(() {
        _stateEnum = _ServerState.running;
      });
    } catch (e) {
      if (context.mounted) {
        setState(() {
          _stateEnum = _ServerState.error;
          _initializedError = e.toString();
        });
      }
    }
  }

  /// Web share uses unencrypted http, so we need to revert to the previous state.
  Future<void> _revertServerState() async {
    await ref.read(serverProvider.notifier).restartServerFromSettings();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _stateEnum = _ServerState.stopping;
        });
        await sleepAsync(250);
        await _revertServerState();
        await sleepAsync(250);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.webSharePage.title),
        ),
        body: Builder(
          builder: (context) {
            if (_stateEnum != _ServerState.running) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_stateEnum == _ServerState.initializing || _stateEnum == _ServerState.stopping) ...[
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        _stateEnum == _ServerState.initializing ? t.webSharePage.loading : t.webSharePage.stopping,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ]
                  else if (_initializedError != null) ...[
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(t.webSharePage.error, style: Theme.of(context).textTheme.titleLarge),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SelectableText(_initializedError!, style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ],
              );
            }

            final serverState = ref.watch(serverProvider)!;
            final webSendState = serverState.webSendState!;
            final networkState = ref.watch(networkStateProvider);

            return ResponsiveListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              children: [
                Text(t.webSharePage.openLink(n: networkState.localIps.length), style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...networkState.localIps.map((ip) {
                          final url = 'http://$ip:${serverState.port}';
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                SelectableText(
                                  url,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () async {
                                    await Clipboard.setData(ClipboardData(text: url));
                                    if (mounted && checkPlatformIsDesktop()) {
                                      context.showSnackBar(t.general.copiedToClipboard);
                                    }
                                  },
                                  child: const Icon(Icons.content_copy, size: 16),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(t.webSharePage.requests, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                if (webSendState.sessions.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(t.webSharePage.noRequests),
                  ),
                ...webSendState.sessions.entries.map((entry) {
                  final session = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(session.deviceInfo, style: Theme.of(context).textTheme.bodyLarge),
                                  const SizedBox(height: 5),
                                  Text(session.ip, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey)),
                                ],
                              ),
                            ),

                            if (session.responseHandler != null)
                              ...[
                                TextButton(
                                  onPressed: () {
                                    ref.read(serverProvider.notifier).declineWebSendRequest(session.sessionId);
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Theme.of(context).colorScheme.error,
                                  ),
                                  child: const Icon(Icons.close),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ref.read(serverProvider.notifier).acceptWebSendRequest(session.sessionId);
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Theme.of(context).colorScheme.primary,
                                  ),
                                  child: const Icon(Icons.check_circle),
                                ),
                              ]
                            else
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  t.general.accepted,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                Text(t.webSharePage.hint, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
              ],
            );
          }
        ),
      ),
    );
  }
}
