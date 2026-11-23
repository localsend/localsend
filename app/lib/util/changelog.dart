import 'dart:convert';

import 'package:localsend_app/model/changelog.dart';

final _heading = RegExp(r'^(\S+)(?: \((.+)\))?');
final _entry = RegExp(r'^(\w+)(?:\((.+?)\))?(!)?: (.+)$');

const _categories = {
  'feat': ChangelogCategory.feature,
  'i18n': ChangelogCategory.feature,
  'security': ChangelogCategory.security,
  'perf': ChangelogCategory.performance,
  'fix': ChangelogCategory.fix,
};

List<ChangelogRelease> parseChangelog(String markdown) {
  return [
    for (final section in markdown.split(RegExp(r'^## ', multiLine: true)).skip(1)) _parseRelease(const LineSplitter().convert(section.trim())),
  ];
}

ChangelogRelease _parseRelease(List<String> lines) {
  final heading = _heading.firstMatch(lines.first)!;
  final notes = <String>[];
  final entries = <String>[];
  for (final line in lines.skip(1).where((line) => line.isNotEmpty)) {
    if (line.startsWith('- ')) {
      entries.add(line.substring(2));
    } else if (line.startsWith(' ') && entries.isNotEmpty) {
      // An indented line continues the entry above it.
      entries.last = '${entries.last} ${line.trim()}';
    } else {
      notes.add(line);
    }
  }
  return ChangelogRelease(
    version: heading.group(1)!,
    date: DateTime.tryParse(heading.group(2) ?? ''),
    notes: notes.join('\n'),
    entries: entries.map(_parseEntry).toList(),
  );
}

ChangelogEntry _parseEntry(String entry) {
  final match = _entry.firstMatch(entry);
  if (match == null) {
    return ChangelogEntry(category: ChangelogCategory.other, scopes: const [], breaking: false, text: entry);
  }
  final type = match.group(1)!;
  final category = _categories[type];
  return ChangelogEntry(
    category: category ?? ChangelogCategory.other,
    scopes: [
      // A translation is a feature to the user, the badge keeps the context that the `i18n:` prefix gave.
      if (type == 'i18n') type,
      ...?match.group(2)?.split(',').map((scope) => scope.trim()),
    ],
    breaking: match.group(3) != null,
    // Types without a group of their own (e.g. `docs:`) keep their prefix, the text is not self-explanatory without it.
    text: category == null ? '$type: ${match.group(4)}' : match.group(4)!,
  );
}

/// Whether [version] is a later release than [other], for dotted numeric versions such as `1.19.0`.
bool isNewerVersion(String version, String other) {
  final [a, b] = [
    for (final v in [version, other]) v.split('.').map((part) => int.tryParse(part) ?? 0).toList(),
  ];
  for (var i = 0; i < a.length && i < b.length; i++) {
    if (a[i] != b[i]) {
      return a[i] > b[i];
    }
  }
  return a.length > b.length;
}
