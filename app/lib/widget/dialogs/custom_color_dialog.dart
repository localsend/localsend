import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:refena_flutter/addons.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

/// Lets the user pick a color visually or enter a HEX code (RRGGBB).
/// Pops with the selected [Color] or null when cancelled.
class CustomColorDialog extends StatefulWidget {
  final Color initialColor;

  const CustomColorDialog({required this.initialColor});

  @override
  State<CustomColorDialog> createState() => _CustomColorDialogState();
}

class _CustomColorDialogState extends State<CustomColorDialog> {
  late Color _color = widget.initialColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.settingsTab.general.colorOptions.custom),
      content: SingleChildScrollView(
        child: ColorPicker(
          color: _color,
          onColorChanged: (color) => setState(() => _color = color),
          pickersEnabled: const {
            ColorPickerType.primary: false,
            ColorPickerType.accent: false,
            ColorPickerType.wheel: true,
          },
          showColorCode: true, // editable field, so manual HEX input stays possible
          colorCodeHasColor: true,
          enableShadesSelection: false,
          copyPasteBehavior: const ColorPickerCopyPasteBehavior(
            copyFormat: ColorPickerCopyFormat.hexRRGGBB,
            parseShortHexCode: true,
          ),
        ),
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
          onPressed: () => context.global.dispatch(NavigateAction.pop(_color)),
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}
