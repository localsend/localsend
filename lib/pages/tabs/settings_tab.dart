import 'package:flutter/material.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/device.dart';
import 'package:localsend_app/model/persistence/color_mode.dart';
import 'package:localsend_app/pages/about_page.dart';
import 'package:localsend_app/pages/changelog_page.dart';
import 'package:localsend_app/pages/language_page.dart';
import 'package:localsend_app/provider/device_info_provider.dart';
import 'package:localsend_app/provider/network/server/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/provider/version_provider.dart';
import 'package:localsend_app/theme.dart';
import 'package:localsend_app/util/native/autostart_helper.dart';
import 'package:localsend_app/util/native/pick_directory_path.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/sleep.dart';
import 'package:localsend_app/util/ui/dynamic_colors.dart';
import 'package:localsend_app/util/ui/snackbar.dart';
import 'package:localsend_app/widget/custom_dropdown_button.dart';
import 'package:localsend_app/widget/dialogs/encryption_disabled_notice.dart';
import 'package:localsend_app/widget/dialogs/quick_save_notice.dart';
import 'package:localsend_app/widget/dialogs/text_field_tv.dart';
import 'package:localsend_app/widget/labeled_checkbox.dart';
import 'package:localsend_app/widget/local_send_logo.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:riverpie_flutter/riverpie_flutter.dart';
import 'package:routerino/routerino.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> with Riverpie {
  final _isLinux = checkPlatform([TargetPlatform.linux]);
  final _isWindows = checkPlatform([TargetPlatform.windows]);
  final _aliasController = TextEditingController();
  final _deviceModelController = TextEditingController();
  final _portController = TextEditingController();
  final _multicastController = TextEditingController();
  bool _advanced = false;

  @override
  void initState() {
    super.initState();
    ensureRef((ref) {
      final settings = ref.read(settingsProvider);
      _aliasController.text = settings.alias;
      _deviceModelController.text = ref.read(deviceInfoProvider).deviceModel ?? '';
      _portController.text = settings.port.toString();
      _multicastController.text = settings.multicastGroup;
    });
  }

  @override
  void dispose() {
    _aliasController.dispose();
    _deviceModelController.dispose();
    _portController.dispose();
    _multicastController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final serverState = ref.watch(serverProvider);
    final deviceInfo = ref.watch(deviceInfoProvider);
    return ResponsiveListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(t.settingsTab.title, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
        ),
        const SizedBox(height: 30),
        _SettingsSection(
          title: t.settingsTab.general.title,
          children: [
            _SettingsEntry(
              label: t.settingsTab.general.brightness,
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
                    await ref.notifier(settingsProvider).setTheme(theme);
                    await sleepAsync(500); // workaround: brightness takes some time to be updated
                    if (mounted) {
                      await updateSystemOverlayStyle(context);
                    }
                  }
                },
              ),
            ),
            if (ref.watch(dynamicColorsProvider) != null)
              _SettingsEntry(
                label: t.settingsTab.general.color,
                child: CustomDropdownButton<ColorMode>(
                  value: settings.colorMode,
                  items: ColorMode.values.map((colorMode) {
                    return DropdownMenuItem(
                      value: colorMode,
                      alignment: Alignment.center,
                      child: Text(colorMode.humanName),
                    );
                  }).toList(),
                  onChanged: (colorMode) async {
                    if (colorMode != null) {
                      await ref.notifier(settingsProvider).setColorMode(colorMode);
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
                onPressed: () async {
                  await context.push(() => const LanguagePage());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    settings.locale?.humanName ?? t.settingsTab.general.languageOptions.system,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            if (checkPlatformIsDesktop()) ...[
              /// Wayland does window position handling, so there's no need for it. See [https://github.com/localsend/localsend/issues/544]
              if (_advanced && checkPlatformIsNotWaylandDesktop())
                _BooleanEntry(
                  label: t.settingsTab.general.saveWindowPlacement,
                  value: settings.saveWindowPlacement,
                  onChanged: (b) async {
                    await ref.notifier(settingsProvider).setSaveWindowPlacement(b);
                  },
                ),
              if (checkPlatformHasTray()) ...[
                _BooleanEntry(
                  label: t.settingsTab.general.minimizeToTray,
                  value: settings.minimizeToTray,
                  onChanged: (b) async {
                    await ref.notifier(settingsProvider).setMinimizeToTray(b);
                  },
                ),
              ],
              // Linux autostart is simpler, so a boolean entry is used
              if (_isLinux)
                _BooleanEntry(
                  label: t.settingsTab.general.launchAtStartup,
                  value: settings.launchAtStartup,
                  onChanged: (b) async {
                    late bool result;
                    if (await isLinuxLaunchAtStartEnabled()) {
                      result = await initDisableAutoStart(settings);
                    } else {
                      result = await initEnableAutoStartAndOpenSettings(settings);
                    }
                    if (result) {
                      await ref.notifier(settingsProvider).setLaunchAtStartup(b);
                    }
                  },
                ),
              // Windows requires a manual action, so this settings entry is required
              if (_isWindows)
                _SettingsEntry(
                  label: t.settingsTab.general.launchAtStartup,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
                      shape: RoundedRectangleBorder(borderRadius: Theme.of(context).inputDecorationTheme.borderRadius),
                      foregroundColor: Theme.of(context).colorScheme.onSurface,
                    ),
                    onPressed: () async {
                      await initDisableAutoStart(settings);
                      await initEnableAutoStartAndOpenSettings(settings, _isWindows);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(t.general.settings, style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ),
                ),
              if (_isWindows || _isLinux)
                Visibility(
                    visible: settings.launchAtStartup || _isWindows,
                    maintainAnimation: true,
                    maintainState: true,
                    child: AnimatedOpacity(
                      opacity: settings.launchAtStartup || _isWindows ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: _BooleanEntry(
                        label: t.settingsTab.general.launchMinimized,
                        value: settings.autoStartLaunchMinimized,
                        onChanged: (b) async {
                          await initDisableAutoStart(settings);
                          await ref.notifier(settingsProvider).setAutoStartLaunchMinimized(b);
                          await initEnableAutoStartAndOpenSettings(settings, _isWindows);
                        },
                      ),
                    )),
            ],
            if (_advanced)
              _BooleanEntry(
                label: t.settingsTab.general.animations,
                value: settings.enableAnimations,
                onChanged: (b) async {
                  await ref.notifier(settingsProvider).setEnableAnimations(b);
                },
              ),
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
                await ref.notifier(settingsProvider).setQuickSave(b);
                if (!old && b && mounted) {
                  await QuickSaveNotice.open(context);
                }
              },
            ),
            if (checkPlatformWithFileSystem())
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
                      await ref.notifier(settingsProvider).setDestination(null);
                      return;
                    }

                    final directory = await pickDirectoryPath();
                    if (directory != null) {
                      await ref.notifier(settingsProvider).setDestination(directory);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(settings.destination ?? t.settingsTab.receive.downloads, style: Theme.of(context).textTheme.titleMedium),
                  ),
                ),
              ),
            if (checkPlatformWithGallery())
              _BooleanEntry(
                label: t.settingsTab.receive.saveToGallery,
                value: settings.saveToGallery,
                onChanged: (b) async {
                  await ref.notifier(settingsProvider).setSaveToGallery(b);
                },
              ),
            _BooleanEntry(
              label: t.settingsTab.receive.saveToHistory,
              value: settings.saveToHistory,
              onChanged: (b) async {
                await ref.notifier(settingsProvider).setSaveToHistory(b);
              },
            ),
          ],
        ),
        _SettingsSection(
          title: t.settingsTab.network.title,
          padding: const EdgeInsets.only(bottom: 0),
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
                child: Text(t.settingsTab.network.needRestart, style: TextStyle(color: Theme.of(context).colorScheme.warning)),
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
                              await ref.notifier(serverProvider).startServerFromSettings();
                            } catch (e) {
                              // ignore: use_build_context_synchronously
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
                              final newServerState = await ref.notifier(serverProvider).restartServer(
                                    alias: settings.alias,
                                    port: settings.port,
                                    https: settings.https,
                                  );

                              if (newServerState != null) {
                                // the new state is always valid, so we can "repair" user's setting
                                _aliasController.text = newServerState.alias;
                                _portController.text = newServerState.port.toString();
                                await ref.notifier(settingsProvider).setAlias(newServerState.alias);
                                await ref.notifier(settingsProvider).setPort(newServerState.port);
                              }
                            } catch (e) {
                              // ignore: use_build_context_synchronously
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
                                await ref.notifier(serverProvider).stopServer();
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
              child: TextFieldTv(
                name: t.settingsTab.network.alias,
                controller: _aliasController,
                onChanged: (s) async {
                  await ref.notifier(settingsProvider).setAlias(s);
                },
              ),
            ),
            if (_advanced)
              _SettingsEntry(
                label: t.settingsTab.network.deviceType,
                child: CustomDropdownButton<DeviceType>(
                  value: deviceInfo.deviceType,
                  items: DeviceType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      alignment: Alignment.center,
                      child: Icon(type.icon),
                    );
                  }).toList(),
                  onChanged: (type) async {
                    if (type != null) {
                      await ref.notifier(settingsProvider).setDeviceType(type);
                    }
                  },
                ),
              ),
            if (_advanced)
              _SettingsEntry(
                label: t.settingsTab.network.deviceModel,
                child: TextFieldTv(
                  name: t.settingsTab.network.deviceModel,
                  controller: _deviceModelController,
                  onChanged: (s) async {
                    await ref.notifier(settingsProvider).setDeviceModel(s);
                  },
                ),
              ),
            if (_advanced)
              _SettingsEntry(
                label: t.settingsTab.network.port,
                child: TextFieldTv(
                  name: t.settingsTab.network.port,
                  controller: _portController,
                  onChanged: (s) async {
                    final port = int.tryParse(s);
                    if (port != null) {
                      await ref.notifier(settingsProvider).setPort(port);
                    }
                  },
                ),
              ),
            if (_advanced)
              _BooleanEntry(
                label: t.settingsTab.network.encryption,
                value: settings.https,
                onChanged: (b) async {
                  final old = settings.https;
                  await ref.notifier(settingsProvider).setHttps(b);
                  if (old && !b && mounted) {
                    await EncryptionDisabledNotice.open(context);
                  }
                },
              ),
            if (_advanced)
              _SettingsEntry(
                label: t.settingsTab.network.multicastGroup,
                child: TextFieldTv(
                  name: t.settingsTab.network.multicastGroup,
                  controller: _multicastController,
                  onChanged: (s) async {
                    await ref.notifier(settingsProvider).setMulticastGroup(s);
                  },
                ),
              ),
            AnimatedCrossFade(
              crossFadeState: settings.port != defaultPort ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.topLeft,
              firstChild: Container(),
              secondChild: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  t.settingsTab.network.portWarning(defaultPort: defaultPort),
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
            AnimatedCrossFade(
              crossFadeState: settings.multicastGroup != defaultMulticastGroup ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.topLeft,
              firstChild: Container(),
              secondChild: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  t.settingsTab.network.multicastGroupWarning(defaultMulticast: defaultMulticastGroup),
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LabeledCheckbox(
              label: t.settingsTab.advancedSettings,
              value: _advanced,
              labelFirst: true,
              onChanged: (b) {
                setState(() => _advanced = b == true);
              },
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 20),
        const LocalSendLogo(withText: true),
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
        const SizedBox(height: 30),
        Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () async {
                  await context.push(() => const AboutPage());
                },
                icon: const Icon(Icons.info),
                label: Text(t.aboutPage.title),
              ),
              TextButton.icon(
                onPressed: () async {
                  await context.push(() => const ChangelogPage());
                },
                icon: const Icon(Icons.history),
                label: Text(t.changelogPage.title),
              ),
            ],
          ),
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
    final theme = Theme.of(context);
    return _SettingsEntry(
      label: label,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: theme.inputDecorationTheme.fillColor,
              borderRadius: theme.inputDecorationTheme.borderRadius,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeTrackColor: theme.colorScheme.primary,
                activeColor: theme.colorScheme.onPrimary,
                inactiveThumbColor: theme.colorScheme.outline,
                inactiveTrackColor: theme.colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final EdgeInsets padding;

  const _SettingsSection({
    required this.title,
    required this.children,
    this.padding = const EdgeInsets.only(bottom: 15),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
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
        return t.settingsTab.general.brightnessOptions.system;
      case ThemeMode.light:
        return t.settingsTab.general.brightnessOptions.light;
      case ThemeMode.dark:
        return t.settingsTab.general.brightnessOptions.dark;
    }
  }
}

extension on ColorMode {
  String get humanName {
    switch (this) {
      case ColorMode.system:
        return t.settingsTab.general.colorOptions.system;
      case ColorMode.localsend:
        return t.appName;
    }
  }
}
