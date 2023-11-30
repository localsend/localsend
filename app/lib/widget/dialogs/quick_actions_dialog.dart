import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/selection/selected_receiving_files_provider.dart';
import 'package:localsend_app/widget/labeled_checkbox.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';
import 'package:uuid/uuid.dart';

enum _QuickAction {
  counter,
  random;

  String get label {
    switch (this) {
      case _QuickAction.counter:
        return t.dialogs.quickActions.counter;
      case _QuickAction.random:
        return t.dialogs.quickActions.random;
    }
  }
}

class QuickActionsDialog extends StatefulWidget {
  const QuickActionsDialog({super.key});

  @override
  State<QuickActionsDialog> createState() => _QuickActionsDialogState();
}

class _QuickActionsDialogState extends State<QuickActionsDialog> with Refena {
  _QuickAction _action = _QuickAction.counter;

  // counter
  String _prefix = '';
  bool _padZero = false;
  bool _sortBeforehand = false;

  // random
  final _randomUuid = const Uuid().v4();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.quickActions.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToggleButtons(
            isSelected: [_action == _QuickAction.counter, _action == _QuickAction.random],
            onPressed: (int index) {
              setState(() {
                if (index == 0) {
                  _action = _QuickAction.counter;
                } else {
                  _action = _QuickAction.random;
                }
              });
            },
            borderRadius: BorderRadius.circular(10),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            children: _QuickAction.values.map((mode) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(mode.label),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          if (_action == _QuickAction.counter) ...[
            Text(t.dialogs.quickActions.prefix),
            const SizedBox(height: 5),
            TextField(
              autofocus: true,
              onChanged: (s) {
                setState(() {
                  _prefix = s;
                });
              },
            ),
            const SizedBox(height: 10),
            LabeledCheckbox(
              label: t.dialogs.quickActions.padZero,
              value: _padZero,
              onChanged: (b) {
                setState(() {
                  _padZero = b == true;
                });
              },
            ),
            const SizedBox(height: 5),
            LabeledCheckbox(
              label: t.dialogs.quickActions.sortBeforeCount,
              value: _sortBeforehand,
              onChanged: (b) {
                setState(() {
                  _sortBeforehand = b == true;
                });
              },
            ),
            const SizedBox(height: 10),
            if (_padZero) Text('${t.general.example}: ${_prefix}04.jpg') else Text('${t.general.example}: ${_prefix}4.jpg'),
          ],
          if (_action == _QuickAction.random) Text('${t.general.example}: $_randomUuid.jpg'),
        ],
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
          onPressed: () {
            switch (_action) {
              case _QuickAction.counter:
                ref.notifier(selectedReceivingFilesProvider).applyCounter(
                      prefix: _prefix,
                      padZero: _padZero,
                      sortFirst: _sortBeforehand,
                    );
                break;
              case _QuickAction.random:
                ref.notifier(selectedReceivingFilesProvider).applyRandom();
                break;
            }
            context.pop();
          },
          child: Text(t.general.confirm),
        ),
      ],
    );
  }
}
