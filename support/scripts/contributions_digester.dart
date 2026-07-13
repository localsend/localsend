import 'dart:io';

/// Used to make the changes in the Github Releases shorter.
/// Aggregates documentation and i18n PRs to "i18n: @user1, @user2".
/// Keeps other contributions (PRs) as is.
void main() {
  final contributions = File('contributions.txt').readAsLinesSync();
  final newContributions = <String>[];
  final documentations = <String>{}; // list of "@user"
  final translators = <String>{}; // list of "@user"
  for (String pr in contributions) {
    final originalPr = pr;
    pr = pr.toLowerCase();
    if (pr.contains('@dependabot')) {
      continue;
    }

    if (pr.contains('i18n') || pr.contains('translation') || pr.contains('translator') || pr.contains('translate') || pr.contains('language')) {
      translators.add('@' + originalPr.split(' @').last);
    } else if (pr.contains('readme') || pr.contains('contributing')) {
      documentations.add('@' + originalPr.split(' @').last);
    } else {
      newContributions.add(originalPr);
    }
  }

  final content = newContributions.join('\n') + '\n' + '* docs: ${documentations.join(', ')}' + '\n' + '* i18n: ${translators.join(', ')}';
  print('Content: $content');

  File('contributions_digested.txt').writeAsStringSync(content);
  print('Finish!');
}
