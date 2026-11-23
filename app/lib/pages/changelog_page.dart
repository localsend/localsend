import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/changelog.dart';
import 'package:localsend_app/widget/changelog_release.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';

class ChangelogPage extends StatelessWidget {
  const ChangelogPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.changelogPage.title),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString(Assets.changelog), // ignore: discarded_futures
        builder: (context, data) {
          if (!data.hasData) {
            return Container();
          }
          final releases = parseChangelog(data.data!);
          return ResponsiveListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: releases.length,
            itemBuilder: (context, index) {
              final release = releases[index];
              return ChangelogReleaseCard(
                margin: const EdgeInsets.only(bottom: 10),
                child: ExpansionTile(
                  // Restores the expansion when the card is scrolled out of view and back.
                  key: PageStorageKey(release.version),
                  initiallyExpanded: index == 0,
                  shape: const Border(),
                  collapsedShape: const Border(),
                  title: ChangelogReleaseTitle(release: release, title: release.version),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  children: [ChangelogReleaseBody(release: release)],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
