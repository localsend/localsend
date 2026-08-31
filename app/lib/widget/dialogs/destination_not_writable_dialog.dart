import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:routerino/routerino.dart';

/// Shown when an incoming transfer (or a settings change) targets a
/// destination directory LocalSend cannot write to.
class DestinationNotWritableDialog extends StatelessWidget {
  final String destination;
  final String? hint;

  const DestinationNotWritableDialog({super.key, required this.destination, this.hint});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.destinationNotWritable.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.dialogs.destinationNotWritable.content(path: destination),
            style: const TextStyle(fontSize: 14),
          ),
          if (hint != null) ...[
            const SizedBox(height: 8),
            Text(hint!, style: const TextStyle(fontSize: 13)),
          ],
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

/// Shows the dialog, appending the Flatpak hint when running sandboxed.
Future<void> showDestinationNotWritableDialog(String destination) async {
  String? hint;
  if (await File('/.flatpak-info').exists()) {
    hint = t.dialogs.destinationNotWritable.flatpakHint;
  }
  // ignore: use_build_context_synchronously
  await Routerino.context.push(
    () => DestinationNotWritableDialog(destination: destination, hint: hint),
  );
}
