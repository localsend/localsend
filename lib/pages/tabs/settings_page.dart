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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      children: [
        _SettingsEntry(
          label: t.settings.alias,
          child: SizedBox(
            width: 200,
            child: TextField(
              onChanged: (s) {},
            ),
          ),
        ),
        _SettingsEntry(
          label: t.settings.theme,
          child: DropdownButton<ThemeMode>(
            value: settings.theme,
            items: ThemeMode.values.map((theme) {
              return DropdownMenuItem(
                value: theme,
                child: Text(theme.humanName),
              );
            }).toList(),
            onChanged: (theme) {
              if (theme != null) {
                ref.read(settingsProvider.notifier).setTheme(theme);
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
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(label),
          ),
          child,
        ],
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
