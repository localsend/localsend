enum ChangelogCategory { feature, security, performance, fix, other }

class ChangelogEntry {
  final ChangelogCategory category;

  /// The platforms or components the entry is limited to, e.g. `android` and `ios` for `fix(android, ios): ...`.
  final List<String> scopes;

  final bool breaking;
  final String text;

  const ChangelogEntry({required this.category, required this.scopes, required this.breaking, required this.text});
}

class ChangelogRelease {
  final String version;
  final DateTime? date;

  /// Free text between the heading and the entries.
  final String notes;

  final List<ChangelogEntry> entries;

  const ChangelogRelease({required this.version, required this.date, required this.notes, required this.entries});
}
