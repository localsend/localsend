import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/home_page_controller.dart';
import 'package:localsend_app/pages/receive_history_page.dart';
import 'package:localsend_app/pages/tabs/receive_tab_vm.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/util/ip_helper.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/widget/animations/initial_fade_transition.dart';
import 'package:localsend_app/widget/column_list_view.dart';
import 'package:localsend_app/widget/custom_icon_button.dart';
import 'package:localsend_app/widget/local_send_logo.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_app/widget/rotating_widget.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

enum _QuickSaveMode {
  off,
  favorites,
  on,
}

class ReceiveTab extends StatelessWidget {
  const ReceiveTab();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch(receiveTabVmProvider);

    return Stack(
      children: [
        checkPlatform([TargetPlatform.macOS])
            ? SizedBox(height: 50, child: MoveWindow())
            : SizedBox(height: 0, width: 0), // makes the top part that's not occupied by another widget draggable
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: ResponsiveListView.defaultMaxWidth),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ColumnListView(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InitialFadeTransition(
                          duration: const Duration(milliseconds: 300),
                          delay: const Duration(milliseconds: 200),
                          child: Consumer(
                            builder: (context, ref) {
                              final animations = ref.watch(animationProvider);
                              final activeTab = ref.watch(homePageControllerProvider.select((state) => state.currentTab));
                              return RotatingWidget(
                                duration: const Duration(seconds: 15),
                                spinning: vm.serverState != null && animations && activeTab == HomeTab.receive,
                                child: const LocalSendLogo(withText: false),
                              );
                            },
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(vm.serverState?.alias ?? vm.aliasSettings, style: const TextStyle(fontSize: 48)),
                        ),
                        InitialFadeTransition(
                          duration: const Duration(milliseconds: 300),
                          delay: const Duration(milliseconds: 500),
                          child: Text(
                            vm.serverState == null ? t.general.offline : vm.localIps.map((ip) => '#${ip.visualId}').toSet().join(' '),
                            style: const TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Column(
                        children: [
                          Text(t.general.quickSave),
                          const SizedBox(height: 10),
                          SegmentedButton<_QuickSaveMode>(
                            multiSelectionEnabled: false,
                            emptySelectionAllowed: false,
                            showSelectedIcon: false,
                            onSelectionChanged: (selection) async {
                              if (selection.contains(_QuickSaveMode.off)) {
                                await vm.onSetQuickSave(context, false);
                                if (context.mounted) {
                                  await vm.onSetQuickSaveFromFavorites(context, false);
                                }
                              } else if (selection.contains(_QuickSaveMode.favorites)) {
                                await vm.onSetQuickSave(context, false);
                                if (context.mounted) {
                                  await vm.onSetQuickSaveFromFavorites(context, true);
                                }
                              } else if (selection.contains(_QuickSaveMode.on)) {
                                await vm.onSetQuickSaveFromFavorites(context, false);
                                if (context.mounted) {
                                  await vm.onSetQuickSave(context, true);
                                }
                              }
                            },
                            selected: {
                              if (!vm.quickSaveSettings && !vm.quickSaveFromFavoritesSettings) _QuickSaveMode.off,
                              if (vm.quickSaveFromFavoritesSettings) _QuickSaveMode.favorites,
                              if (vm.quickSaveSettings) _QuickSaveMode.on,
                            },
                            segments: [
                              ButtonSegment(
                                value: _QuickSaveMode.off,
                                label: Text(t.receiveTab.quickSave.off),
                              ),
                              ButtonSegment(
                                value: _QuickSaveMode.favorites,
                                label: Text(t.receiveTab.quickSave.favorites),
                              ),
                              ButtonSegment(
                                value: _QuickSaveMode.on,
                                label: Text(t.receiveTab.quickSave.on),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
        _InfoBox(vm),
        _CornerButtons(
          showAdvanced: vm.showAdvanced,
          showHistoryButton: vm.showHistoryButton,
          toggleAdvanced: vm.toggleAdvanced,
        ),
      ],
    );
  }
}

class _CornerButtons extends StatelessWidget {
  final bool showAdvanced;
  final bool showHistoryButton;
  final Future<void> Function() toggleAdvanced;

  const _CornerButtons({
    required this.showAdvanced,
    required this.showHistoryButton,
    required this.toggleAdvanced,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (!showAdvanced)
              AnimatedOpacity(
                opacity: showHistoryButton ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: CustomIconButton(
                  onPressed: () async {
                    await context.push(() => const ReceiveHistoryPage());
                  },
                  child: const Icon(Icons.history),
                ),
              ),
            CustomIconButton(
              key: const ValueKey('info-btn'),
              onPressed: toggleAdvanced,
              child: const Icon(Icons.info),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final ReceiveTabVm vm;

  const _InfoBox(this.vm);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: vm.showAdvanced ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 200),
      firstChild: Container(),
      secondChild: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Table(
                columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  1: IntrinsicColumnWidth(),
                  2: IntrinsicColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Text(t.receiveTab.infoBox.alias),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: SelectableText(vm.serverState?.alias ?? '-'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(t.receiveTab.infoBox.ip),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (vm.localIps.isEmpty) Text(t.general.unknown),
                          ...vm.localIps.map((ip) => SelectableText(ip)),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(t.receiveTab.infoBox.port),
                      const SizedBox(width: 10),
                      SelectableText(vm.serverState?.port.toString() ?? '-'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
