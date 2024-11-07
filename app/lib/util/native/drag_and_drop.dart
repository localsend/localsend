import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:flutter/material.dart';
import 'package:refena_flutter/refena_flutter.dart';

final dropTextProvider =
    ReduxProvider<DropTextProvider, String?>((ref) => DropTextProvider());

class DropTextProvider extends ReduxNotifier<String?> {
  @override
  String? init() => null; // null means no text is dropped
}

class DropTextAction extends ReduxAction<DropTextProvider, String?> {
  final String? pastedText;

  DropTextAction(this.pastedText);

  @override
  String? reduce() => pastedText; // Update the state to the dropped text
}

class DroppableWrapper extends StatelessWidget {
  final void Function(String) onDropText;
  final Widget child;

  const DroppableWrapper({
    required this.onDropText,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropRegion(
      formats: Formats.standardFormats,
      hitTestBehavior: HitTestBehavior.opaque,
      onDropOver: (event) {
        final item = event.session.items.first;
        if (item.canProvide(Formats.plainText)) {
          return DropOperation.copy;
        }
        return DropOperation.none;
      },
      onPerformDrop: (event) async {
        final item = event.session.items.first;
        final reader = item.dataReader!;

        if (reader.canProvide(Formats.plainText)) {
          reader.getValue<String>(Formats.plainText, (value) {
            if (value != null) {
              onDropText(value);
            }
          });
        }
      },
      child: child,
    );
  }
}
