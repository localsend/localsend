import 'dart:io';

import 'package:flutter/material.dart';
import 'package:legalize/legalize.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/file_path_helper.dart';
import 'package:routerino/routerino.dart';

class FileNameInputDialog extends StatefulWidget {
  final String originalName;
  final String initialName;

  const FileNameInputDialog({required this.originalName, required this.initialName});

  @override
  State<FileNameInputDialog> createState() => _FileNameInputDialogState();
}

class _FileNameInputDialogState extends State<FileNameInputDialog> {
  final _textController = TextEditingController();
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _textController.text = widget.initialName;
  }

  bool _validate(String input) {
    if (_textController.text.isEmpty) {
      setState(() {
        _errorMessage = t.sanitization.empty;
      });
      return false;
    }

    if (!isValidFilename(input, os: Platform.operatingSystem)) {
      setState(() {
        _errorMessage = t.sanitization.invalid;
      });
      return false;
    }

    if (_errorMessage.isNotEmpty) {
      setState(() {
        _errorMessage = '';
      });
    }

    return true;
  }

  void _submit() {
    if (mounted) {
      String input = _textController.text.trim();

      if (!_validate(_textController.text)) {
        return;
      }

      if (!input.contains('.') && widget.originalName.contains('.')) {
        // user forgot extension, we fix it
        input = input.withExtension(widget.originalName.extension);
      }
      context.pop(input);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.fileNameInput.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.dialogs.fileNameInput.original(original: widget.originalName)),
          const SizedBox(height: 10),
          TextFormField(
            controller: _textController,
            autofocus: true,
            onChanged: (value) => _validate(value.trim()),
            onFieldSubmitted: (_) => _submit,
          ),
          const SizedBox(height: 5),
          Visibility(
            visible: _errorMessage.isNotEmpty,
            child: Text(_errorMessage, style: TextStyle(color: Theme.of(context).colorScheme.warning)),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => context.pop(), child: Text(t.general.cancel)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: _submit,
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}
