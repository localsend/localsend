import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/pages/home_page.dart';
import 'package:localsend_app/pages/receive_history_page.dart';
import 'package:localsend_app/pages/tabs/receive_tab_vm.dart';
import 'package:localsend_app/provider/animation_provider.dart';
import 'package:localsend_app/provider/ui/home_tab_provider.dart';
import 'package:localsend_app/util/ip_helper.dart';
import 'package:localsend_app/widget/animations/initial_fade_transition.dart';
import 'package:localsend_app/widget/custom_icon_button.dart';
import 'package:localsend_app/widget/local_send_logo.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_app/widget/rotating_widget.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

class ReceiveTab extends StatelessWidget {
  const ReceiveTab();

  @override
  Widget build(BuildContext context) {
    final vm = context.ref.watch(receiveTabVmProvider);

    return Stack(
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: ResponsiveListView.defaultMaxWidth),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InitialFadeTransition(
                                duration: const Duration(milliseconds: 300),
                                delay: const Duration(milliseconds: 200),
                                child: Consumer(builder: (context, ref) {
                                  final animations = ref.watch(animationProvider);
                                  final activeTab = ref.watch(homeTabProvider);
                                  return RotatingWidget(
                                    duration: const Duration(seconds: 15),
                                    spinning: vm.serverState != null && animations && activeTab == HomeTab.receive,
                                    child: const LocalSendLogo(withText: false),
                                  );
                                }),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: vm.quickSaveSettings
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                              ),
                              onPressed: () async => vm.onSetQuickSave(context, false),
                              child: Text('${t.general.quickSave}: ${t.general.on}'),
                            )
                          : TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey,
                              ),
                              onPressed: () async => vm.onSetQuickSave(context, true),
                              child: Text('${t.general.quickSave}: ${t.general.off}'),
                            ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
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
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!vm.showAdvanced)
                  AnimatedOpacity(
                    opacity: vm.showHistoryButton ? 1 : 0,
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
                  onPressed: vm.toggleAdvanced,
                  child: const Icon(Icons.info),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
