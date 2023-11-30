import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/state/send/web/web_send_state.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

class QrDialog extends StatelessWidget {
  final String data;
  final bool listenIncomingWebSendRequests;

  const QrDialog({
    required this.data,
    this.listenIncomingWebSendRequests = false,
  });

  @override
  Widget build(BuildContext context) {
    final WebSendState? webSendState;
    if (listenIncomingWebSendRequests) {
      webSendState = context.ref.watch(serverProvider.select((s) => s?.webSendState));
    } else {
      webSendState = null;
    }

    return AlertDialog(
      title: Text(t.dialogs.qr.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              height: 200,
              child: PrettyQrView.data(
                errorCorrectLevel: QrErrorCorrectLevel.Q,
                data: data,
                decoration: PrettyQrDecoration(
                  shape: PrettyQrSmoothSymbol(
                    roundFactor: 0,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(data, textAlign: TextAlign.center),
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
        )
      ],
    );
  }
}
