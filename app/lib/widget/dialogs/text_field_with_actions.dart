import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:routerino/routerino.dart';

/// A [AlertDialog] on all devices.
/// The button opens a dialog box with actions.
class TextFieldWithActions extends StatefulWidget {
  final String name;
  final TextEditingController controller;
  final bool allowEmpty;

  /// Called while typing. Cancellation does not undo this callback's effects.
  final ValueChanged<String>? onChanged;

  /// Called on confirmation. Cancellation always restores the original text in the controller.
  final ValueChanged<String>? onSubmitted;
  final List<Widget> actions;

  const TextFieldWithActions({
    required this.name,
    required this.controller,
    this.allowEmpty = true,
    this.onChanged,
    this.onSubmitted,
    required this.actions,
  });

  @override
  State<TextFieldWithActions> createState() => _TextFieldWithActionsState();
}

class _TextFieldWithActionsState extends State<TextFieldWithActions> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
        shape: RoundedRectangleBorder(borderRadius: Theme.of(context).inputDecorationTheme.borderRadius),
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      onPressed: () async {
        final originalText = widget.controller.text;
        final confirmedText = await showDialog<String>(
          context: context,
          builder: (dialogContext) {
            return AlertDialog(
              title: Text(widget.name),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Display actions inside the dialog
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widget.actions,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: widget.controller,
                    textAlign: TextAlign.center,
                    onChanged: widget.onChanged,
                    autofocus: true,
                    onFieldSubmitted: (text) {
                      if (widget.allowEmpty || text.trim().isNotEmpty) {
                        dialogContext.pop(text);
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => dialogContext.pop(),
                  child: Text(t.general.cancel),
                ),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: widget.controller,
                  builder: (context, value, child) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(dialogContext).colorScheme.primary,
                      foregroundColor: Theme.of(dialogContext).colorScheme.onPrimary,
                    ),
                    onPressed: widget.allowEmpty || value.text.trim().isNotEmpty ? () => dialogContext.pop(widget.controller.text) : null,
                    child: Text(t.general.confirm),
                  ),
                ),
              ],
            );
          },
        );
        if (!mounted) {
          return;
        }
        setState(() {
          if (confirmedText != null) {
            widget.controller.text = confirmedText;
          } else {
            widget.controller.text = originalText;
          }
        });
        if (confirmedText != null) {
          widget.onSubmitted?.call(confirmedText);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          widget.controller.text,
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
