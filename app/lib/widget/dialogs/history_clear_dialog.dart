import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:routerino/routerino.dart';

class HistoryClearDialog extends StatelessWidget {
  const HistoryClearDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.historyClearDialog.title),
      content: Text(t.dialogs.historyClearDialog.content),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(t.general.cancel),
        ),
        FilledButton(
          onPressed: () => context.pop(true),
          child: Text(t.general.delete),
        ),
      ],
    );
  }
}
