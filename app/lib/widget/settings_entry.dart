import 'package:flutter/material.dart';

/// A settings row that associates its visible label with its control in the
/// accessibility tree.
///
/// Most settings have one control, so their semantics are merged into a single
/// node. Screen readers can then announce the setting name together with the
/// control's role, value, state, and actions.
///
/// Set [mergeSemantics] to false when [child] contains multiple independently
/// actionable controls. In that mode, the row is exposed as a named group and
/// each child keeps its own semantics and actions.
class SettingsEntry extends StatelessWidget {
  final String label;
  final Widget child;
  final bool mergeSemantics;

  const SettingsEntry({
    required this.label,
    required this.child,
    this.mergeSemantics = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final row = _buildRow(excludeLabelSemantics: !mergeSemantics);

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: mergeSemantics
          ? MergeSemantics(child: row)
          : Semantics(
              container: true,
              explicitChildNodes: true,
              label: label,
              child: row,
            ),
    );
  }

  Widget _buildRow({required bool excludeLabelSemantics}) {
    final labelWidget = Text(label);

    return Row(
      children: [
        Expanded(
          child: excludeLabelSemantics ? ExcludeSemantics(child: labelWidget) : labelWidget,
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 150,
          child: child,
        ),
      ],
    );
  }
}
