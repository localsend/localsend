import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/state/send/web/web_send_state.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

class ZoomDialog extends StatelessWidget {
  final String label;
  final bool listenIncomingWebSendRequests;
  final String? pin;

  const ZoomDialog({
    required this.label,
    this.listenIncomingWebSendRequests = false,
    this.pin,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * .80;
    final fontSize = width / 400 * 48;

    final WebSendState? webSendState;
    if (listenIncomingWebSendRequests) {
      webSendState = context.ref.watch(serverProvider.select((s) => s?.webSendState));
    } else {
      webSendState = null;
    }

    return AlertDialog(
      title: Text(t.dialogs.zoom.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.fill,
              clipBehavior: Clip.antiAlias,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (pin != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.fill,
                clipBehavior: Clip.antiAlias,
                child: Text('🔑 $pin', textAlign: TextAlign.center, style: const TextStyle(fontSize: 100)),
              ),
            ),
          if (listenIncomingWebSendRequests && webSendState != null)
            Builder(
              builder: (context) {
                final pending = webSendState?.sessions.values.fold<int>(0, (prev, curr) => prev + (curr.responseHandler != null ? 1 : 0)) ?? 0;
                if (pending != 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      t.webSharePage.pendingRequests(n: pending),
                      style: TextStyle(color: Theme.of(context).colorScheme.warning),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(t.general.close),
        ),
      ],
    );
  }
}
