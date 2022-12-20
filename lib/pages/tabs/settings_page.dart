import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/settings_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(t.settings.title, style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
        ),
        const SizedBox(height: 30),
        _SettingsEntry(
          label: t.settings.alias,
          child: TextFormField(
            initialValue: settings.alias,
            textAlign: TextAlign.center,
            onChanged: (s) async {
              await ref.read(settingsProvider.notifier).setAlias(s);
            },
          ),
        ),
        _SettingsEntry(
          label: t.settings.theme,
          child: DropdownButton<ThemeMode>(
            value: settings.theme,
            isExpanded: true,
            items: ThemeMode.values.map((theme) {
              return DropdownMenuItem(
                value: theme,
                alignment: Alignment.center,
                child: Text(theme.humanName),
              );
            }).toList(),
            onChanged: (theme) async {
              if (theme != null) {
                await ref.read(settingsProvider.notifier).setTheme(theme);
              }
            },
          ),
        ),
        _SettingsEntry(
          label: t.settings.language,
          child: DropdownButton<AppLocale?>(
            value: settings.locale,
            isExpanded: true,
            items: [
              DropdownMenuItem(
                value: null,
                alignment: Alignment.center,
                child: Text(t.settings.languageOptions.system),
              ),
              ...AppLocale.values.map((locale) {
                return DropdownMenuItem(
                  value: locale,
                  alignment: Alignment.center,
                  child: Text(locale.humanName),
                );
              }),
            ],
            onChanged: (locale) async {
              await ref.read(settingsProvider.notifier).setLocale(locale);
              if (locale == null) {
                LocaleSettings.useDeviceLocale();
              } else {
                LocaleSettings.setLocale(locale);
              }
            },
          ),
        ),
      ],
    );
  }
}

class _SettingsEntry extends StatelessWidget {
  final String label;
  final Widget child;

  const _SettingsEntry({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(label, style: const TextStyle(fontSize: 16)),
              ),
              SizedBox(
                width: 150,
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on ThemeMode {
  String get humanName {
    switch (this) {
      case ThemeMode.system:
        return t.settings.themeOptions.system;
      case ThemeMode.light:
        return t.settings.themeOptions.light;
      case ThemeMode.dark:
        return t.settings.themeOptions.dark;
    }
  }
}

extension on AppLocale {
  String get humanName {
    switch (this) {
      case AppLocale.de:
        return 'Deutsch';
      case AppLocale.en:
        return 'English';
    }
  }
}
