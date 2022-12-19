import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/constants.dart';
import 'package:localsend_app/gen/assets.gen.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/network_info_provider.dart';
import 'package:localsend_app/provider/receiver_provider.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/util/ip_helper.dart';
import 'package:localsend_app/widget/rotating_widget.dart';

class ReceivePage extends ConsumerStatefulWidget {
  const ReceivePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReceivePage> createState() => _ReceivePageState();
}

class _ReceivePageState extends ConsumerState<ReceivePage> {
  bool _advanced = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(receiverProvider.notifier).startServer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final networkInfo = ref.watch(networkInfoProvider);
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
                      duration: const Duration(seconds: 10),
                      child: Assets.img.logo512.image(width: 200),
                    ),
                    Text(networkInfo?.localIp?.visualId ?? t.general.unknown, style: const TextStyle(fontSize: 48)),
                    Text(settings.alias, style: const TextStyle(fontSize: 24)),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: TextButton(
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
                        Text(t.receive.advanced.alias),
                        const SizedBox(width: 10),
                        Text(settings.alias),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(t.receive.advanced.ip),
                        const SizedBox(width: 10),
                        Text(networkInfo?.localIp ?? t.general.unknown),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(t.receive.advanced.server),
                        const SizedBox(width: 10),
                        Text(networkInfo?.localIp == null ? t.general.unknown : '${networkInfo!.localIp}:${Constants.defaultPort}/localsend'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(t.receive.advanced.subnetMask),
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
