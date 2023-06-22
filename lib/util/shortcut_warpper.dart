import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShortcutWrapper extends StatelessWidget {
  final Widget child;
  final Map<LogicalKeySet, Intent> additionalShortcuts;

  ShortcutWrapper({
    required this.child,
    this.additionalShortcuts = const {},
  });

  @override
  Widget build(BuildContext context) {
    final shortcuts = {
      LogicalKeySet(LogicalKeyboardKey.escape): ActivateIntent(),
      ...additionalShortcuts,
    };

    return Shortcuts(
      shortcuts: shortcuts,
      child: Actions(
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (ActivateIntent intent) => Navigator.pop(context),
          ),
        },
        child: Focus(
          autofocus: true,
          child: child,
        ),
      ),
    );
  }
}
