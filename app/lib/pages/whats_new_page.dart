import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:refena_flutter/addons.dart';
import 'package:refena_flutter/refena_flutter.dart';

class WhatsNewPage extends StatelessWidget {
  final String version;
  final WhatsNewStrings strings;

  const WhatsNewPage({
    super.key,
    required this.version,
    required this.strings,
  });

  static WhatsNewPage? fromLastVersion({required String? lastVersion}) {
    return switch (lastVersion) {
      null => WhatsNewPage(version: '1.18.0', strings: t.whatsNewPage.changes.v1_18_0),
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.whatsNewPage.title(version: version)),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          for (final change in strings.changes)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('- $change'),
            ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              onPressed: () => context.global.dispatch(NavigateAction.pop()),
              icon: Icon(Icons.done),
              label: Text(t.general.done),
            ),
          ),
        ],
      ),
    );
  }
}
