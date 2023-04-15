import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';

enum _ServerState { initializing, running, error, stopping }

class WebSharePage extends ConsumerStatefulWidget {
  const WebSharePage({Key? key}) : super(key: key);

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
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        _stateEnum == _ServerState.initializing ? t.webSharePage.loading : t.webSharePage.stopping,
                        style: Theme.of(context).textTheme.headlineSmall,
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

            return ResponsiveListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              children: [
                Text(t.webSharePage.hint, textAlign: TextAlign.center),
                const SizedBox(height: 5),
              ],
            );
          }
        ),
      ),
    );
  }
}
