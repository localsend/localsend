import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:routerino/routerino.dart';

class PinDialog extends StatefulWidget {
  final String? pin;

  const PinDialog({this.pin, super.key});

  @override
  State<PinDialog> createState() => _PinDialogState();
}

class _PinDialogState extends State<PinDialog> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.pin ?? nanoid(alphabet: Alphabet.noDoppelganger, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.pin.title),
      content: TextFormField(
        controller: _textController,
        autofocus: true,
        onFieldSubmitted: (value) => context.pop(value),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(t.general.cancel),
        ),
        FilledButton(
          onPressed: () => context.pop(_textController.text),
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}
