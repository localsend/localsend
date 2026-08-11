import 'package:localsend_app/gen/strings.g.dart';

Future<void> initI18n() async {
  // Register default plural resolver
  for (final locale in AppLocale.values) {
    if ([AppLocale.en, AppLocale.de].contains(locale)) {
      continue;
    }

    await LocaleSettings.setPluralResolver(
      locale: locale,
      cardinalResolver: (n, {zero, one, two, few, many, other}) {
        if (n == 0) {
          return zero ?? other ?? n.toString();
        }
        if (n == 1) {
          return one ?? other ?? n.toString();
        }
        if (locale == AppLocale.he && n == 2) {
          return two ?? other ?? n.toString();
        }
        return other ?? n.toString();
      },
      ordinalResolver: (n, {zero, one, two, few, many, other}) {
        return other ?? n.toString();
      },
    );
  }
}

extension AppLocaleExt on AppLocale {
  /// The name of the locale in its own language.
  String getLocaleName() {
    return switch (this) {
      AppLocale.en => 'English',
      AppLocale.ar => 'العربية',
      AppLocale.az => 'Azərbaycanca',
      AppLocale.bg => 'Български',
      AppLocale.bn => 'বাংলা',
      AppLocale.ca => 'Català',
      AppLocale.cs => 'Česky',
      AppLocale.da => 'Dansk',
      AppLocale.de => 'Deutsch',
      AppLocale.el => 'Ελληνικά',
      AppLocale.et => 'Eesti keel',
      AppLocale.eu => 'Euskara',
      AppLocale.fa => 'فارسی',
      AppLocale.fi => 'Suomi',
      AppLocale.fr => 'Français',
      AppLocale.gl => 'Galego',
      AppLocale.gu => 'ગુજરાતી',
      AppLocale.he => 'עברית',
      AppLocale.hi => 'हिन्दी',
      AppLocale.hu => 'Magyar',
      AppLocale.id => 'Bahasa Indonesia',
      AppLocale.it => 'Italiano',
      AppLocale.ja => '日本語',
      AppLocale.km => 'ភាសាខ្មែរ',
      AppLocale.ko => '한국어',
      AppLocale.lo => 'ລາວ',
      AppLocale.ml => 'മലയാളം',
      AppLocale.mn => 'Монгол',
      AppLocale.ms => 'Bahasa Melayu',
      AppLocale.ne => 'नेपाली',
      AppLocale.nl => 'Nederlands',
      AppLocale.pl => 'Polski',
      AppLocale.ro => 'Română',
      AppLocale.ru => 'Русский',
      AppLocale.si => 'සිංහල',
      AppLocale.sk => 'Slovenčina',
      AppLocale.sl => 'Slovenščina',
      AppLocale.sr => 'Srpski (latinica)',
      AppLocale.sv => 'Svenska',
      AppLocale.ta => 'தமிழ்',
      AppLocale.th => 'ไทย',
      AppLocale.tr => 'Türkçe',
      AppLocale.uk => 'Українська',
      AppLocale.ur => 'اردو',
      AppLocale.uz => 'Oʻzbekcha',
      AppLocale.vi => 'Tiếng Việt',
      AppLocale.enIn => 'English (India)',
      AppLocale.esEs => 'Español',
      AppLocale.filPh => 'Filipino',
      AppLocale.ptBr => 'Português (Brasil)',
      AppLocale.ptPt => 'Português (Portugal)',
      AppLocale.srCyrl => 'Српски (ћирилица)',
      AppLocale.zhCn => '简体中文',
      AppLocale.zhHk => '繁體中文 (香港)',
      AppLocale.zhTw => '繁體中文 (台灣)',
    };
  }
}
