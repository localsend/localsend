import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/native/cmd_helper.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/widget/custom_icon_button.dart';
import 'package:localsend_app/widget/dialogs/not_available_on_platform_dialog.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:refena_flutter/refena_flutter.dart';

class TroubleshootPage extends StatelessWidget {
  const TroubleshootPage();

  @override
  Widget build(BuildContext context) {
    final settings = context.ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.troubleshootPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        children: [
          Text(t.troubleshootPage.subTitle, textAlign: TextAlign.center),
          const SizedBox(height: 5),
          _TroubleshootItem(
            symptomText: t.troubleshootPage.firewall.symptom,
            solutionText: t.troubleshootPage.firewall.solution(port: settings.port),
            primaryButton: _FixButton(
              label: t.troubleshootPage.fixButton,
              onTapMap: {
                TargetPlatform.windows: _CommandFixAction(
                  adminPrivileges: true,
                  commands: [
                    'netsh advfirewall firewall add rule name="LocalSend" dir=in action=allow protocol=TCP localport=${settings.port}',
                    'netsh advfirewall firewall add rule name="LocalSend" dir=in action=allow protocol=UDP localport=${settings.port}',
                  ],
                ),
              },
            ),
            secondaryButton: _FixButton(
              label: t.troubleshootPage.firewall.openFirewall,
              onTapMap: {
                TargetPlatform.windows: _CommandFixAction(
                  adminPrivileges: false,
                  commands: ['wf'],
                ),
              },
            ),
          ),
          _TroubleshootItem(
            symptomText: t.troubleshootPage.noConnection.symptom,
            solutionText: t.troubleshootPage.noConnection.solution,
          ),
        ],
      ),
    );
  }
}

class _TroubleshootItem extends StatefulWidget {
  final String symptomText;
  final String solutionText;
  final _FixButton? primaryButton;
  final _FixButton? secondaryButton;

  const _TroubleshootItem({
    required this.symptomText,
    required this.solutionText,
    this.primaryButton,
    this.secondaryButton,
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
              Text(widget.symptomText, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10),
              Text(t.troubleshootPage.solution),
              Text(widget.solutionText),
              if (widget.primaryButton != null) ...[
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 10,
                  children: [
                    widget.primaryButton!,
                    if (widget.secondaryButton != null) ...[
                      const SizedBox(width: 10),
                      widget.secondaryButton!,
                    ],
                    if (widget.primaryButton!.onTap?.commands != null) ...[
                      const SizedBox(width: 10),
                      CustomIconButton(
                        onPressed: () {
                          setState(() => _showCommands = !_showCommands);
                        },
                        child: const Icon(Icons.info),
                      ),
                    ],
                  ],
                ),
                AnimatedCrossFade(
                  crossFadeState: _showCommands ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                  firstChild: Container(),
                  secondChild: SelectionArea(
                    child: Column(
                      children: [
                        ...?widget.primaryButton?.onTap?.commands?.map((cmd) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(cmd, style: const TextStyle(fontFamily: 'RobotoMono')),
                          );
                        }),
                      ],
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

class _FixButton extends StatelessWidget {
  final String label;
  final Map<TargetPlatform, _FixAction> onTapMap;
  final _FixAction? onTap;

  _FixButton({
    required this.label,
    required this.onTapMap,
  }) : onTap = onTapMap[defaultTargetPlatform];

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: () async {
        if (onTap != null) {
          onTap!.runFix();
        } else {
          await showDialog(
            context: context,
            builder: (_) => NotAvailableOnPlatformDialog(platforms: onTapMap.keys.toList()),
          );
        }
      },
      child: Text(label),
    );
  }
}

abstract class _FixAction {
  void runFix();

  List<String>? get commands;
}

class _CommandFixAction extends _FixAction {
  final bool adminPrivileges;

  @override
  final List<String> commands;

  _CommandFixAction({
    required this.adminPrivileges,
    required this.commands,
  });

  @override
  void runFix() async {
    if (adminPrivileges) {
      if (checkPlatform([TargetPlatform.windows])) {
        await runWindowsCommandAsAdmin(commands);
      } else {
        throw 'Admin privileges are only implemented on Windows.';
      }
    } else {
      for (final c in commands) {
        await Process.run(c, [], runInShell: true);
      }
    }
  }
}
