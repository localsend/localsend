import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';

class SettingsTab extends ConsumerStatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends ConsumerState<SettingsTab> {
  final _aliasController = TextEditingController();
  final _portController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final settings = ref.read(settingsProvider);
    _aliasController.text = settings.alias;
    _portController.text = settings.port.toString();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final serverState = ref.watch(serverProvider);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(t.settings.title, style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(t.settings.general.title, style: Theme.of(context).textTheme.subtitle1),
        ),
        const SizedBox(height: 10),
        _SettingsEntry(
          label: t.settings.general.theme,
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
          label: t.settings.general.language,
          child: DropdownButton<AppLocale?>(
            value: settings.locale,
            isExpanded: true,
            items: [
              DropdownMenuItem(
                value: null,
                alignment: Alignment.center,
                child: Text(t.settings.general.languageOptions.system),
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
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(t.settings.network.title, style: Theme.of(context).textTheme.subtitle1),
        ),
        const SizedBox(height: 10),
        if (serverState != null && (serverState.alias != settings.alias || serverState.port != settings.port))
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () async {
                  final newServerState = await ref.read(serverProvider.notifier).restartServer(
                    alias: settings.alias,
                    port: settings.port,
                  );

                  if (newServerState != null) {
                    // the new state is always valid, so we can "repair" user's setting
                    _aliasController.text = newServerState.alias;
                    _portController.text = newServerState.port.toString();
                    await ref.read(settingsProvider.notifier).setAlias(newServerState.alias);
                    await ref.read(settingsProvider.notifier).setPort(newServerState.port);
                  }
                },
                child: Text(t.settings.network.restart),
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 10),
            child: Text(t.settings.network.info),
          ),
        const SizedBox(height: 10),
        _SettingsEntry(
          label: t.settings.network.alias,
          child: TextFormField(
            controller: _aliasController,
            textAlign: TextAlign.center,
            onChanged: (s) async {
              await ref.read(settingsProvider.notifier).setAlias(s);
            },
          ),
        ),
        _SettingsEntry(
          label: t.settings.network.port,
          child: TextFormField(
            controller: _portController,
            textAlign: TextAlign.center,
            onChanged: (s) async {
              final port = int.tryParse(s);
              if (port != null) {
                await ref.read(settingsProvider.notifier).setPort(port);
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
        return t.settings.general.themeOptions.system;
      case ThemeMode.light:
        return t.settings.general.themeOptions.light;
      case ThemeMode.dark:
        return t.settings.general.themeOptions.dark;
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
