import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';

class ChangelogPage extends StatelessWidget {
  const ChangelogPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.changelogPage.title),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString(Assets.changelog),
        builder: (context, data) {
          if (!data.hasData) {
            return Container();
          }
          return Markdown(
            data: data.data!,
          );
        }
      ),
    );
  }
}
