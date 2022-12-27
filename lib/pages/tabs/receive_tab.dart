import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/network/server_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/ip_helper.dart';
import 'package:localsend_app/widget/rotating_widget.dart';

class ReceiveTab extends ConsumerStatefulWidget {
  const ReceiveTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ReceiveTab> createState() => _ReceiveTagState();
}

class _ReceiveTagState extends ConsumerState<ReceiveTab> {
  bool _advanced = false;

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final networkInfo = ref.watch(networkInfoProvider);
    final serverState = ref.watch(serverProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotatingWidget(
                      duration: const Duration(seconds: 15),
                      spinning: serverState != null,
                      child: Assets.img.logo512.image(width: 200),
                    ),
                    Text(serverState?.alias ?? settings.alias, style: const TextStyle(fontSize: 48)),
                    Text(
                      serverState == null ? t.general.offline : '#${networkInfo?.localIp?.visualId ?? '?'}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: TextButton(
              key: ValueKey('toggle-$_advanced'),
              onPressed: () {
                setState(() => _advanced = !_advanced);
              },
              child: Text(_advanced ? t.general.hide : t.general.advanced),
            ),
          ),
          AnimatedCrossFade(
            crossFadeState: _advanced ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
            firstChild: Container(),
            secondChild: Card(
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
                        Text(t.receive.infoBox.alias),
                        const SizedBox(width: 10),
                        Text(serverState?.alias ?? '-'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(t.receive.infoBox.ip),
                        const SizedBox(width: 10),
                        Text(networkInfo?.localIp ?? t.general.unknown),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(t.receive.infoBox.port),
                        const SizedBox(width: 10),
                        Text(serverState?.port.toString() ?? '-'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(t.receive.infoBox.subnetMask),
                        const SizedBox(width: 10),
                        Text(networkInfo?.netMask ?? t.general.unknown),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
