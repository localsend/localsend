import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/util/native/file_picker.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/widget/watcher/window_watcher.dart';
import 'package:refena_flutter/refena_flutter.dart';
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
        // Add Command+W to close the window for macOS
        if (checkPlatform([TargetPlatform.macOS])) LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyW): _CloseWindowIntent(),

        LogicalKeySet(LogicalKeyboardKey.escape): _PopPageIntent(),

        // Control+V and Command+V
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyV): _PasteIntent(),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyV): _PasteIntent(),

      },
      child: Actions(
        actions: {
          _ExitAppIntent: CallbackAction(onInvoke: (_) => exit(0)),
          _PopPageIntent: CallbackAction(
              onInvoke: (_) async =>
                  Navigator.of(Routerino.context).maybePop()),
          _PasteIntent: CallbackAction(onInvoke: (_) async {
            await context.ref.dispatchAsync(PickFileAction(
                option: FilePickerOption.clipboard, context: context));
            return null;
          }),
          _CloseWindowIntent: CallbackAction<_CloseWindowIntent>(
            onInvoke: (_) async {
              await WindowWatcher.closeWindow(context);
              return null;
            },
          ),
        },
        child: child,
      ),
    );
  }
}

class _ExitAppIntent extends Intent {}

class _PopPageIntent extends Intent {}

class _PasteIntent extends Intent {}

class _CloseWindowIntent extends Intent {}
