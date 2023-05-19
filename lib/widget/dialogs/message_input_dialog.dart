import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:routerino/routerino.dart';

class MessageInputDialog extends StatefulWidget {
  final String? initialText;

  const MessageInputDialog({this.initialText});

  @override
  State<MessageInputDialog> createState() => _MessageInputDialogState();
}

class _MessageInputDialogState extends State<MessageInputDialog> {
  final _textController = TextEditingController();
  bool _multiline = false;

  @override
  void initState() {
    super.initState();
    _textController.text = widget.initialText ?? '';
    _multiline = _textController.text.contains('\n');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.messageInput.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            key: ValueKey('m-$_multiline'),
            controller: _textController,
            keyboardType: _multiline ? TextInputType.multiline : TextInputType.text,
            maxLines: _multiline ? null : 1,
            autofocus: true,
            onFieldSubmitted: _multiline ? null : (s) => context.pop(s),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(t.dialogs.messageInput.multiline),
              Checkbox(
                value: _multiline,
                onChanged: (b) {
                  setState(() {
                    _multiline = b == true;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).brightness == Brightness.dark ? Theme.of(context).buttonTheme.colorScheme!.onPrimary : null,
          ),
          onPressed: () => context.pop(),
          child: Text(t.general.cancel),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).buttonTheme.colorScheme!.primary,
            foregroundColor: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
          ),
          onPressed: () => context.pop(_textController.text),
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}
