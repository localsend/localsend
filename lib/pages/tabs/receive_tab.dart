import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/ip_helper.dart';
import 'package:localsend_app/widget/animations/initial_fade_transition.dart';
import 'package:localsend_app/widget/custom_icon_button.dart';
import 'package:localsend_app/widget/dialogs/quick_save_notice.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_app/widget/rotating_widget.dart';

class ReceiveTab extends ConsumerStatefulWidget {
  const ReceiveTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ReceiveTab> createState() => _ReceiveTagState();
}

class _ReceiveTagState extends ConsumerState<ReceiveTab> with AutomaticKeepAliveClientMixin {
  bool _advanced = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final settings = ref.watch(settingsProvider);
    final networkInfo = ref.watch(networkInfoProvider);
    final serverState = ref.watch(serverProvider);
    return Stack(
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: ResponsiveListView.defaultMaxWidth),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InitialFadeTransition(
                                    duration: const Duration(milliseconds: 300),
                                    delay: const Duration(milliseconds: 200),
                                    child: RotatingWidget(
                                      duration: const Duration(seconds: 15),
                                      spinning: serverState != null,
                                      child: SizedBox(
                                        height: 200,
                                        child: Assets.img.logo512.image(height: 200),
                                      ),
                                    ),
                                  ),
                                  Text(serverState?.alias ?? settings.alias, style: const TextStyle(fontSize: 48)),
                                  InitialFadeTransition(
                                    duration: const Duration(milliseconds: 300),
                                    delay: const Duration(milliseconds: 500),
                                    child: Text(
                                      serverState == null ? t.general.offline : networkInfo?.localIps.map((ip) => '#${ip.visualId}').toSet().join(' ') ?? '?',
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: Center(
                      child: ElevatedButton(
                        style: settings.quickSave ? ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).buttonTheme.colorScheme!.primary,
                          foregroundColor: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
                        ) : null,
                        onPressed: () {
                          ref.read(settingsProvider.notifier).setQuickSave(!settings.quickSave);
                          if (!settings.quickSave) {
                            QuickSaveNotice.open(context);
                          }
                        },
                        child: Text('${t.general.quickSave}: ${settings.quickSave ? t.general.on : t.general.off}'),
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
          crossFadeState: _advanced ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
          firstChild: Container(),
          secondChild: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Table(
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: IntrinsicColumnWidth(),
                        2: FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: [
                            Text(t.receiveTab.infoBox.alias),
                            const SizedBox(width: 10),
                            Text(serverState?.alias ?? '-'),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(t.receiveTab.infoBox.ip),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (networkInfo?.localIps.isEmpty ?? true)
                                  Text(t.general.unknown),
                                ...?networkInfo?.localIps.map((ip) => Text(ip)),
                              ],
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(t.receiveTab.infoBox.port),
                            const SizedBox(width: 10),
                            Text(serverState?.port.toString() ?? '-'),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(t.receiveTab.infoBox.subnetMask),
                            const SizedBox(width: 10),
                            Text(networkInfo?.netMask ?? t.general.unknown),
                          ],
                        ),
                      ],
                    ),
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
            child: CustomIconButton(
              onPressed: () {
                setState(() => _advanced = !_advanced);
              },
              child: const Icon(Icons.info),
            ),
          ),
        ),
      ],
    );
  }
}
