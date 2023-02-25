import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/tabs/troubleshoot_tab.dart';

/// This is just a wrapper around [TroubleshootTab].
class TroubleshootPage extends StatelessWidget {
  const TroubleshootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.troubleshootTab.title),
      ),
      body: const TroubleshootTab(showTitle: false),
    );
  }
}
