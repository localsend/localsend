import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/home_page_controller.dart';
import 'package:localsend_app/util/native/file_picker.dart';
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

        LogicalKeySet(LogicalKeyboardKey.escape): _PopPageIntent(),

        // Control+V and Command+V
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyV): _PasteIntent(),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyV): _PasteIntent(),
      },
      child: Actions(
        actions: {
          _ExitAppIntent: CallbackAction(onInvoke: (_) => exit(0)),
          _PopPageIntent: CallbackAction(onInvoke: (_) async => Navigator.of(Routerino.context).maybePop()),
          _PasteIntent: CallbackAction(
            onInvoke: (_) async {
              await context.global.dispatchAsync(PickFileAction(option: FilePickerOption.clipboard, context: context));
              if (context.mounted) {
                context.redux(homePageControllerProvider).dispatch(ChangeTabAction(HomeTab.send));
              }
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

class _OpenSettingsIntent extends Intent {}

bool _ignoreMetaLast = false;
bool _isFakeMetaKey() {
  // https://github.com/localsend/localsend/issues/2037
  // We can detect the "fake" meta key by checking if the last key was a meta key
  // because the real meta key should be the first key pressed.
  if (_ignoreMetaLast) {
    final lastKey = HardwareKeyboard.instance.logicalKeysPressed.lastOrNull;
    if (lastKey?.isMeta ?? false) {
      return true;
    }
  } else {
    final firstKey = HardwareKeyboard.instance.logicalKeysPressed.firstOrNull;

    if (firstKey?.isMeta ?? false) {
      _ignoreMetaLast = true;
    }
  }

  return false;
}

extension on LogicalKeyboardKey {
  bool get isMeta => this == LogicalKeyboardKey.meta || this == LogicalKeyboardKey.metaLeft || this == LogicalKeyboardKey.metaRight;
}
