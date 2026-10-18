import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:routerino/routerino.dart';

class MessageInputDialog extends StatefulWidget {
  final String? initialText;

  /// Called with the current text on every change, so callers can persist a
  /// draft that survives the dialog being dismissed by unrelated navigation.
  final ValueChanged<String>? onChanged;

  const MessageInputDialog({this.initialText, this.onChanged});

  @override
  State<MessageInputDialog> createState() => _MessageInputDialogState();
}

class _MessageInputDialogState extends State<MessageInputDialog> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.initialText ?? '';
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.messageInput.title),
      content: TextFormField(
        controller: _textController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        autofocus: true,
        onChanged: widget.onChanged,
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(t.general.cancel),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () => context.pop(_textController.text),
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}
