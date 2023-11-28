import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:refena_flutter/refena_flutter.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final activeLocale = context.ref.watch(settingsProvider.select((s) => s.locale));
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settingsTab.general.language),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          ...[
            null,
            ...AppLocale.values,
          ].map((locale) {
            return ListTile(
              onTap: () async {
                await context.ref.notifier(settingsProvider).setLocale(locale);
                if (locale == null) {
                  LocaleSettings.useDeviceLocale();
                } else {
                  LocaleSettings.setLocale(locale);
                }
              },
              title: Row(
                children: [
                  Flexible(
                    child: Text(locale?.humanName ?? t.settingsTab.general.languageOptions.system),
                  ),
                  if (locale == activeLocale) ...[
                    const SizedBox(width: 10),
                    const Icon(Icons.check_circle, color: Colors.green),
                  ],
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

extension AppLocaleExt on AppLocale {
  String get humanName {
    return LocaleSettings.instance.translationMap[this]!.locale;
  }
}
