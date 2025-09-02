import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/native/cmd_helper.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/widget/custom_basic_appbar.dart';
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
      appBar: basicLocalSendAppbar(t.troubleshootPage.title),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        children: [
          Text(t.troubleshootPage.subTitle, textAlign: TextAlign.center),
          const SizedBox(height: 5),
          _TroubleshootItem(
            symptomText: t.troubleshootPage.firewall.symptom,
            solutionText: '${t.troubleshootPage.firewall.solution(port: settings.port)}\n\n⚠️  Important: The LocalSend .exe and Winget packages do not automatically configure Windows Firewall rules. You must configure the firewall manually using the buttons below or through Windows Firewall settings.',
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
            additionalInfo: Platform.isWindows ? Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.security,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Windows Firewall Configuration Required',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• Use "Auto Fix" above to automatically add firewall rules (requires admin privileges)\n• Or use "Open Firewall" to manually configure Windows Defender Firewall\n• Allow LocalSend through both Private and Public networks for best compatibility',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ) : null,
          ),
          _TroubleshootItem(
            symptomText: t.troubleshootPage.noDiscovery.symptom,
            solutionText: t.troubleshootPage.noDiscovery.solution,
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
  final Widget? additionalInfo;

  const _TroubleshootItem({
    required this.symptomText,
    required this.solutionText,
    this.primaryButton,
    this.secondaryButton,
    this.additionalInfo,
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
              if (widget.additionalInfo != null) ...[
                const SizedBox(height: 10),
                widget.additionalInfo!,
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
