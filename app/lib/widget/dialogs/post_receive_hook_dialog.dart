import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/widget/dialogs/alert_dialog.dart';
import 'package:routerino/routerino.dart';

class PostReceiveHookDialog extends StatefulWidget {
  final String? initialCommand;

  const PostReceiveHookDialog({super.key, this.initialCommand});

  static Future<String?> open(BuildContext context, {String? initialCommand}) {
    return showDialog<String>(
      context: context,
      builder: (_) => PostReceiveHookDialog(initialCommand: initialCommand),
    );
  }

  @override
  State<PostReceiveHookDialog> createState() => _PostReceiveHookDialogState();
}

class _PostReceiveHookDialogState extends State<PostReceiveHookDialog> {
  late TextEditingController _controller;
  bool _enabled = false;

  @override
  void initState() {
    super.initState();
    _enabled = widget.initialCommand != null && widget.initialCommand!.trim().isNotEmpty;
    _controller = TextEditingController(text: widget.initialCommand ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return AlertDialog(
      title: Text(t.settingsTab.receive.postReceiveHook),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text(t.settingsTab.receive.postReceiveHookEnable),
              value: _enabled,
              onChanged: (value) {
                setState(() {
                  _enabled = value;
                  if (!value) {
                    _controller.clear();
                  }
                });
              },
            ),
            if (_enabled) ...[
              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: t.settingsTab.receive.postReceiveHookCommand,
                  hintText: 'pwsh -File C:\\Scripts\\Process-File.ps1',
                  border: const OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              Text(
                t.settingsTab.receive.postReceiveHookVariables,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEnvVar('LOCALSEND_FILE_PATH', t.settingsTab.receive.postReceiveHookVarPath),
                      _buildEnvVar('LOCALSEND_ORIGINAL_NAME', t.settingsTab.receive.postReceiveHookVarName),
                      _buildEnvVar('LOCALSEND_SENDER_ALIAS', t.settingsTab.receive.postReceiveHookVarAlias),
                      _buildEnvVar('LOCALSEND_FILE_SIZE', t.settingsTab.receive.postReceiveHookVarSize),
                      _buildEnvVar('LOCALSEND_FILE_TYPE', t.settingsTab.receive.postReceiveHookVarType),
                      _buildEnvVar('LOCALSEND_SAVED_TO_GALLERY', t.settingsTab.receive.postReceiveHookVarGallery),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                t.settingsTab.receive.postReceiveHookWarning,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.error,
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Routerino.context.pop(),
          child: Text(t.general.cancel),
        ),
        TextButton(
          onPressed: () {
            final command = _enabled ? _controller.text.trim() : '';
            Routerino.context.pop(command);
          },
          child: Text(t.general.save),
        ),
      ],
    );
  }

  Widget _buildEnvVar(String name, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
          children: [
            TextSpan(text: name, style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' - $description'),
          ],
        ),
      ),
    );
  }
}
