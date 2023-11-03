import 'package:localsend_app/gen/strings.g.dart';

void initI18n() {
  // Register default plural resolver
  for (final locale in AppLocale.values) {
    if ([AppLocale.en, AppLocale.de].contains(locale)) {
      continue;
    }

    LocaleSettings.setPluralResolver(
      locale: locale,
      cardinalResolver: (n, {zero, one, two, few, many, other}) {
        if (n == 0) {
          return zero ?? other ?? n.toString();
        }
        if (n == 1) {
          return one ?? other ?? n.toString();
        }
        return other ?? n.toString();
      },
      ordinalResolver: (n, {zero, one, two, few, many, other}) {
        return other ?? n.toString();
      },
    );
  }
}
