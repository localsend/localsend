import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/about_page.dart';
import 'package:localsend_app/pages/changelog_page.dart';
import 'package:localsend_app/pages/language_page.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/provider/version_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/autostart_helper.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:localsend_app/util/snackbar.dart';
import 'package:localsend_app/widget/custom_dropdown_button.dart';
import 'package:localsend_app/widget/dialogs/encryption_disabled_notice.dart';
import 'package:localsend_app/widget/dialogs/quick_save_notice.dart';
import 'package:localsend_app/widget/local_send_logo.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:routerino/routerino.dart';

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
    return ResponsiveListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(t.settingsTab.title, style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
        ),
        const SizedBox(height: 30),
        _SettingsSection(
          title: t.settingsTab.general.title,
          children: [
            _SettingsEntry(
              label: t.settingsTab.general.theme,
              child: CustomDropdownButton<ThemeMode>(
                value: settings.theme,
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
                    await sleepAsync(500); // workaround: brightness takes some time to be updated
                    if (mounted) {
                      updateSystemOverlayStyle(context);
                    }
                  }
                },
              ),
            ),
            _SettingsEntry(
              label: t.settingsTab.general.language,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
                  shape: RoundedRectangleBorder(borderRadius: Theme.of(context).inputDecorationTheme.borderRadius),
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () {
                  context.push(() => const LanguagePage());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    settings.locale?.humanName ?? t.settingsTab.general.languageOptions.system,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
            ),
            if (checkPlatformIsDesktop()) ...[
              if (checkPlatform([TargetPlatform.windows, TargetPlatform.macOS])) ...[
                _BooleanEntry(
                  label: t.settingsTab.general.minimizeToTray,
                  value: settings.minimizeToTray,
                  onChanged: (b) async {
                    await ref.read(settingsProvider.notifier).setMinimizeToTray(b);
                  },
                ),
              ],
              if (checkPlatform([TargetPlatform.windows])) ...[
                _SettingsEntry(
                  label: t.settingsTab.general.launchAtStartup,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
                      shape: RoundedRectangleBorder(borderRadius: Theme.of(context).inputDecorationTheme.borderRadius),
                      foregroundColor: Theme.of(context).colorScheme.onSurface,
                    ),
                    onPressed: () => initAutoStartAndOpenSettings(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(t.general.settings, style: Theme.of(context).textTheme.subtitle1),
                    ),
                  ),
                ),
                _BooleanEntry(
                  label: t.settingsTab.general.launchMinimized,
                  value: settings.autoStartLaunchMinimized,
                  onChanged: (b) async {
                    await ref.read(settingsProvider.notifier).setAutoStartLaunchMinimized(b);
                  },
                ),
              ],
            ],
          ],
        ),
        _SettingsSection(
          title: t.settingsTab.receive.title,
          children: [
            _BooleanEntry(
              label: t.settingsTab.receive.quickSave,
              value: settings.quickSave,
              onChanged: (b) async {
                final old = settings.quickSave;
                await ref.read(settingsProvider.notifier).setQuickSave(b);
                if (!old && b && mounted) {
                  QuickSaveNotice.open(context);
                }
              },
            ),
            if (checkPlatform([TargetPlatform.windows, TargetPlatform.macOS, TargetPlatform.linux]))
              _SettingsEntry(
                label: t.settingsTab.receive.destination,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
                    shape: RoundedRectangleBorder(borderRadius: Theme.of(context).inputDecorationTheme.borderRadius),
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: () async {
                    if (settings.destination != null) {
                      await ref.read(settingsProvider.notifier).setDestination(null);
                      return;
                    }

                    final directory = await FilePicker.platform.getDirectoryPath();
                    if (directory != null) {
                      await ref.read(settingsProvider.notifier).setDestination(directory);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(settings.destination ?? '(Downloads)', style: Theme.of(context).textTheme.subtitle1),
                  ),
                ),
              ),
            if (checkPlatformWithGallery())
              _BooleanEntry(
                label: t.settingsTab.receive.saveToGallery,
                value: settings.saveToGallery,
                onChanged: (b) async {
                  await ref.read(settingsProvider.notifier).setSaveToGallery(b);
                },
              ),
          ],
        ),
        _SettingsSection(
          title: t.settingsTab.network.title,
          children: [
            AnimatedCrossFade(
              crossFadeState: serverState != null &&
                      (serverState.alias != settings.alias || serverState.port != settings.port || serverState.https != settings.https)
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.topLeft,
              firstChild: Container(),
              secondChild: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(t.settingsTab.network.needRestart, style: const TextStyle(color: Colors.orange)),
              ),
            ),
            _SettingsEntry(
              label: '${t.settingsTab.network.server}${serverState == null ? ' (${t.general.offline})' : ''}',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  borderRadius: Theme.of(context).inputDecorationTheme.borderRadius,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (serverState == null)
                      Tooltip(
                        message: t.general.start,
                        child: TextButton(
                          style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.onSurface),
                          onPressed: () async {
                            try {
                              await ref.read(serverProvider.notifier).startServer(
                                    alias: settings.alias,
                                    port: settings.port,
                                    https: settings.https,
                                  );
                            } catch (e) {
                              context.showSnackBar(e.toString());
                            }
                          },
                          child: const Icon(Icons.play_arrow),
                        ),
                      )
                    else
                      Tooltip(
                        message: t.general.restart,
                        child: TextButton(
                          style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.onSurface),
                          onPressed: () async {
                            try {
                              final newServerState = await ref.read(serverProvider.notifier).restartServer(
                                    alias: settings.alias,
                                    port: settings.port,
                                    https: settings.https,
                                  );

                              if (newServerState != null) {
                                // the new state is always valid, so we can "repair" user's setting
                                _aliasController.text = newServerState.alias;
                                _portController.text = newServerState.port.toString();
                                await ref.read(settingsProvider.notifier).setAlias(newServerState.alias);
                                await ref.read(settingsProvider.notifier).setPort(newServerState.port);
                              }
                            } catch (e) {
                              context.showSnackBar(e.toString());
                            }
                          },
                          child: const Icon(Icons.refresh),
                        ),
                      ),
                    Tooltip(
                      message: t.general.stop,
                      child: TextButton(
                        style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.onSurface),
                        onPressed: serverState == null
                            ? null
                            : () async {
                                await ref.read(serverProvider.notifier).stopServer();
                              },
                        child: const Icon(Icons.stop),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _SettingsEntry(
              label: t.settingsTab.network.alias,
              child: TextFormField(
                controller: _aliasController,
                textAlign: TextAlign.center,
                onChanged: (s) async {
                  await ref.read(settingsProvider.notifier).setAlias(s);
                },
              ),
            ),
            _SettingsEntry(
              label: t.settingsTab.network.port,
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
            _BooleanEntry(
              label: t.settingsTab.network.encryption,
              value: settings.https,
              onChanged: (b) async {
                final old = settings.https;
                await ref.read(settingsProvider.notifier).setHttps(b);
                if (old && !b && mounted) {
                  EncryptionDisabledNotice.open(context);
                }
              },
            ),
            AnimatedCrossFade(
              crossFadeState: settings.port != defaultPort ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.topLeft,
              firstChild: Container(),
              secondChild: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(t.settingsTab.network.portWarning(defaultPort: defaultPort), style: const TextStyle(color: Colors.grey)),
              ),
            ),
          ],
        ),
        Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () {
                  context.push(() => const AboutPage());
                },
                icon: const Icon(Icons.info),
                label: Text(t.aboutPage.title),
              ),
              TextButton.icon(
                onPressed: () {
                  context.push(() => const ChangelogPage());
                },
                icon: const Icon(Icons.history),
                label: Text(t.changelogPage.title),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        const LocalSendLogo(),
        const SizedBox(height: 5),
        ref.watch(versionProvider).maybeWhen(
              data: (version) => Text(
                'Version: $version',
                textAlign: TextAlign.center,
              ),
              orElse: () => Container(),
            ),
        Text(
          '© ${DateTime.now().year} Tien Do Nam',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 80),
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
      child: Row(
        children: [
          Expanded(
            child: Text(label),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 150,
            child: child,
          ),
        ],
      ),
    );
  }
}

/// A specialized version of [_SettingsEntry].
class _BooleanEntry extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _BooleanEntry({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SettingsEntry(
      label: label,
      child: CustomDropdownButton<bool>(
        value: value,
        items: [false, true].map((b) {
          return DropdownMenuItem(
            value: b,
            alignment: Alignment.center,
            child: Text(b ? t.general.on : t.general.off),
          );
        }).toList(),
        onChanged: (b) {
          if (b != null) {
            onChanged(b);
          }
        },
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.subtitle1),
              const SizedBox(height: 10),
              ...children,
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
        return t.settingsTab.general.themeOptions.system;
      case ThemeMode.light:
        return t.settingsTab.general.themeOptions.light;
      case ThemeMode.dark:
        return t.settingsTab.general.themeOptions.dark;
    }
  }
}
