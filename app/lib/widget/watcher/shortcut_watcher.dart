import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:routerino/routerino.dart';

class ShortcutWatcher extends StatelessWidget {
  final Widget child;

  const ShortcutWatcher({required this.child});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        // The select button on AndroidTV needs this to work
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),

        // Add Control+Q binding for Linux
        // https://github.com/localsend/localsend/issues/194
        if (checkPlatform([TargetPlatform.linux])) LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyQ): _ExitAppIntent(),

        LogicalKeySet(LogicalKeyboardKey.escape): _PopPageIntent(),
      },
      child: Actions(
        actions: {
          _ExitAppIntent: CallbackAction(onInvoke: (_) => exit(0)),
          _PopPageIntent: CallbackAction(onInvoke: (_) async => Navigator.of(Routerino.context).maybePop()),
        },
        child: child,
      ),
    );
  }
}

class _ExitAppIntent extends Intent {}

class _PopPageIntent extends Intent {}
