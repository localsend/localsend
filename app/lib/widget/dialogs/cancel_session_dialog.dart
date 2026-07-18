import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/widget/dialogs/custom_bottom_sheet.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

class CancelSessionDialog extends StatelessWidget {
  const CancelSessionDialog();

  @override
  Widget build(BuildContext context) {
    final colorMode = context.watch(settingsProvider.select((state) => state.colorMode));

    return CustomBottomSheet(
      title: t.dialogs.cancelSession.title,
      description: t.dialogs.cancelSession.content,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => context.pop(false),
            child: Text('${t.general.continueStr}  ${t.general.transfer}'),
          ),
          ElevatedButton.icon(
            onPressed: () => context.pop(true),
            style: ElevatedButton.styleFrom(
              elevation: colorMode == ColorMode.yaru ? 0 : null,
                backgroundColor: colorMode == ColorMode.yaru ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.error,
                foregroundColor: colorMode == ColorMode.yaru ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.onError,
            ),
            icon: const Icon(Icons.close),
            label: Text(t.general.abort),
          ),
        ],
      ),
    );
  }
}
