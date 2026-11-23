import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/model/changelog.dart';
import 'package:localsend_app/util/system_date_time_formatter.dart';
import 'package:localsend_app/widget/device_bage.dart';

class ChangelogReleaseCard extends StatelessWidget {
  final EdgeInsets margin;
  final Widget child;

  const ChangelogReleaseCard({this.margin = EdgeInsets.zero, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Theme.of(context).colorScheme.secondaryContainerIfDark,
      child: child,
    );
  }
}

class ChangelogReleaseTitle extends StatelessWidget {
  final ChangelogRelease release;
  final String title;

  const ChangelogReleaseTitle({required this.release, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final date = release.date;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        if (date != null) Text(SystemDateTimeFormatter.date(context, date), style: textTheme.bodyMedium),
      ],
    );
  }
}

const _scopeLabels = {
  'android': 'Android',
  'ios': 'iOS',
  'macos': 'macOS',
  'mac': 'macOS',
  'windows': 'Windows',
  'linux': 'Linux',
  'cli': 'CLI',
  'desktop': 'Desktop',
  'mobile': 'Mobile',
  'i18n': 'Translation',
};

class ChangelogReleaseBody extends StatelessWidget {
  final ChangelogRelease release;

  const ChangelogReleaseBody({required this.release, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    // 'monospace' is a generic family only on Android and Linux.
    final codeStyle = TextStyle(
      fontFamily: switch (theme.platform) {
        TargetPlatform.iOS || TargetPlatform.macOS => 'Menlo',
        TargetPlatform.windows => 'Consolas',
        _ => 'monospace',
      },
    );
    final scopeBadgeColor = Color.lerp(colors.secondaryContainer, Colors.white, 0.3)!;
    // The changelog is only available in English, so it is laid out left-to-right in every locale.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (release.notes.isNotEmpty) Text(release.notes),
          for (final (category, icon, label) in [
            (ChangelogCategory.feature, Icons.auto_awesome, 'New features'),
            (ChangelogCategory.security, Icons.shield_outlined, 'Security'),
            (ChangelogCategory.performance, Icons.speed, 'Performance'),
            (ChangelogCategory.fix, Icons.bug_report_outlined, 'Bug fixes'),
            (ChangelogCategory.other, Icons.more_horiz, 'Other'),
          ])
            if (release.entries.any((entry) => entry.category == category)) ...[
              Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 2),
                child: Row(
                  children: [
                    Icon(icon, size: 18, color: colors.primary),
                    const SizedBox(width: 8),
                    Text(label, style: theme.textTheme.titleSmall?.copyWith(color: colors.primary)),
                  ],
                ),
              ),
              for (final entry in release.entries)
                if (entry.category == category)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('•'),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                for (final scope in entry.scopes)
                                  _badge(_scopeLabels[scope.toLowerCase()] ?? scope, scopeBadgeColor, colors.onSecondaryContainer),
                                if (entry.breaking) _badge('Breaking change', colors.warning.withValues(alpha: 0.15), colors.warning),
                                ..._spansWithInlineCode(entry.text, codeStyle),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
        ],
      ),
    );
  }
}

InlineSpan _badge(String label, Color backgroundColor, Color foregroundColor) {
  return WidgetSpan(
    alignment: PlaceholderAlignment.middle,
    child: Padding(
      padding: const EdgeInsets.only(right: 6),
      child: DeviceBadge(backgroundColor: backgroundColor, foregroundColor: foregroundColor, label: label),
    ),
  );
}

List<InlineSpan> _spansWithInlineCode(String text, TextStyle codeStyle) {
  return [
    for (final (index, segment) in text.split('`').indexed) TextSpan(text: segment, style: index.isOdd ? codeStyle : null),
  ];
}
