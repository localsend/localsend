import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/changelog.dart';
import 'package:localsend_app/widget/changelog_release.dart';
import 'package:routerino/routerino.dart';

class WhatsNewDialog extends StatelessWidget {
  final ChangelogRelease release;

  const WhatsNewDialog({required this.release, super.key});

  /// Returns whether the user asked to see the full changelog.
  static Future<bool> open(BuildContext context, ChangelogRelease release) async {
    final showChangelog = await showDialog<bool>(
      context: context,
      builder: (_) => WhatsNewDialog(release: release),
    );
    return showChangelog ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ChangelogReleaseCard(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ChangelogReleaseTitle(
                  release: release,
                  title: t.whatsNewPage.title(version: release.version),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: ChangelogReleaseBody(release: release),
                  ),
                ),
                const SizedBox(height: 16),
                OverflowBar(
                  alignment: MainAxisAlignment.end,
                  overflowAlignment: OverflowBarAlignment.end,
                  spacing: 8,
                  children: [
                    TextButton(
                      onPressed: () => context.pop(true),
                      child: Text(t.changelogPage.title),
                    ),
                    FilledButton(
                      onPressed: () => context.pop(false),
                      child: Text(t.general.close),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
