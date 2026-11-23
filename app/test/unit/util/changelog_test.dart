import 'package:localsend_app/model/changelog.dart';
import 'package:localsend_app/util/changelog.dart';
import 'package:test/test.dart';

void main() {
  test('parseChangelog splits releases into categorized entries', () {
    final releases = parseChangelog('''
## 1.19.0 (2026-11-21)

- feat(cli)!: replace `--file` with the `send` command (@otanim)
- fix(android, ios): keep file names
  when saving (@Tienisto)
- i18n: add Kyrgyz (@nidara-duo)

## 1.18.1

Android+iOS only hotfix update.

- Initial Release
''');

    expect(releases.map((r) => r.version), ['1.19.0', '1.18.1']);
    expect(releases[0].date, DateTime(2026, 11, 21));
    expect(releases[1].date, null);
    expect(releases[1].notes, 'Android+iOS only hotfix update.');

    final [feature, fix, i18n] = releases[0].entries;
    expect((feature.category, feature.breaking), (ChangelogCategory.feature, true));
    expect(feature.scopes, ['cli']);
    expect(feature.text, 'replace `--file` with the `send` command (@otanim)');
    expect((fix.category, fix.breaking), (ChangelogCategory.fix, false));
    expect(fix.scopes, ['android', 'ios']);
    expect(fix.text, 'keep file names when saving (@Tienisto)');
    expect((i18n.category, i18n.text), (ChangelogCategory.feature, 'add Kyrgyz (@nidara-duo)'));
    expect(i18n.scopes, ['i18n']);
    expect((releases[1].entries.single.category, releases[1].entries.single.text), (ChangelogCategory.other, 'Initial Release'));
  });

  test('isNewerVersion compares numerically', () {
    expect(isNewerVersion('1.10.0', '1.9.2'), true);
    expect(isNewerVersion('1.19.0', '1.19.0'), false);
    expect(isNewerVersion('1.18.2', '1.19.0'), false);
  });
}
