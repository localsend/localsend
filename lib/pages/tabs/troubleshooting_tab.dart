import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/cmd_helper.dart';
import 'package:localsend_app/util/platform_check.dart';
import 'package:localsend_app/widget/custom_icon_button.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';

class TroubleshootingTab extends ConsumerWidget {
  const TroubleshootingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return ResponsiveListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      children: [
        Text(t.troubleshootTab.title, style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
        const SizedBox(height: 20),
        Text(t.troubleshootTab.subTitle, textAlign: TextAlign.center),
        const SizedBox(height: 5),
        _TroubleshootItem(
          symptomText: t.troubleshootTab.firewall.symptom,
          solutionText: t.troubleshootTab.firewall.solution(port: settings.port),
          platforms: const [TargetPlatform.windows, TargetPlatform.linux],
          commands: checkPlatform([TargetPlatform.windows]) ? [
            'netsh advfirewall firewall add rule name="LocalSend" dir=in action=allow protocol=TCP localport=${settings.port}',
            'netsh advfirewall firewall add rule name="LocalSend" dir=in action=allow protocol=UDP localport=${settings.port}',
          ] : null,
          secondaryButton: checkPlatform([TargetPlatform.windows]) ? t.troubleshootTab.firewall.openFirewall : null,
          secondaryAction: checkPlatform([TargetPlatform.windows]) ? () async {
            await Process.run('wf', [], runInShell: true);
          } : null,
        ),
        _TroubleshootItem(
          symptomText: t.troubleshootTab.noConnection.symptom,
          solutionText: t.troubleshootTab.noConnection.solution,
        ),
      ],
    );
  }
}

class _TroubleshootItem extends StatefulWidget {
  final String symptomText;
  final String solutionText;
  final List<TargetPlatform>? platforms;
  final List<String>? commands;
  final String? secondaryButton;
  final VoidCallback? secondaryAction;

  const _TroubleshootItem({
    required this.symptomText,
    required this.solutionText,
    this.platforms,
    this.commands,
    this.secondaryButton,
    this.secondaryAction,
  });

  @override
  State<_TroubleshootItem> createState() => _TroubleshootItemState();
}

class _TroubleshootItemState extends State<_TroubleshootItem> {
  bool _showCommands = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.platforms != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Wrap(
                    children: widget.platforms!.map((p) {
                      return [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(p.humanName, style: const TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 10),
                      ];
                    }).expand((element) => element).toList(),
                  ),
                ),
              Wrap(
                children: [
                  Text(widget.symptomText, style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
              const SizedBox(height: 10),
              Text(t.troubleshootTab.solution),
              Text(widget.solutionText),
              if (widget.commands != null)
                ...[
                  const SizedBox(height: 10),
                  Wrap(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).buttonTheme.colorScheme!.primary,
                          foregroundColor: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                        ),
                        onPressed: () async {
                          if (checkPlatform([TargetPlatform.windows])) {
                            await runWindowsCommandAsAdmin(widget.commands!);
                          }
                        },
                        child: Text(t.troubleshootTab.fixButton),
                      ),
                      if (widget.secondaryButton != null)
                        ...[
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).buttonTheme.colorScheme!.primary,
                              foregroundColor: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                            ),
                            onPressed: widget.secondaryAction!,
                            child: Text(widget.secondaryButton!),
                          ),
                        ],
                      const SizedBox(width: 10),
                      CustomIconButton(
                        onPressed: () {
                          setState(() => _showCommands = !_showCommands);
                        },
                        child: const Icon(Icons.info),
                      ),
                    ],
                  ),
                  AnimatedCrossFade(
                    crossFadeState: _showCommands ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 200),
                    firstChild: Container(),
                    secondChild: SelectionArea(
                      child: Column(
                        children: widget.commands!.map((cmd) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(cmd, style: const TextStyle(fontFamily: 'RobotoMono')),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
            ],
          ),
        ),
      ),
    );
  }
}

extension on TargetPlatform {
  String get humanName {
    switch (this) {
      case TargetPlatform.android:
        return 'Android';
      case TargetPlatform.fuchsia:
        return 'Fuchsia';
      case TargetPlatform.iOS:
        return 'iOS';
      case TargetPlatform.linux:
        return 'Linux';
      case TargetPlatform.macOS:
        return 'MacOS';
      case TargetPlatform.windows:
        return 'Windows';
    }
  }
}
