import 'package:collection/collection.dart';
import 'package:common/util/network_interfaces.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/settings_provider.dart';
import 'package:localsend_app/widget/custom_basic_appbar.dart';
import 'package:localsend_app/widget/dialogs/text_field_tv.dart';
import 'package:localsend_app/widget/labeled_checkbox.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:moform/moform.dart';
import 'package:refena_flutter/refena_flutter.dart';

class NetworkInterfacesPage extends StatefulWidget {
  const NetworkInterfacesPage();

  @override
  State<NetworkInterfacesPage> createState() => _NetworkInterfacesPageState();
}

class _NetworkInterfacesPageState extends State<NetworkInterfacesPage> {
  List<(String, List<String>)> rawInterfaces = [];

  @override
  void initState() {
    super.initState();

    // ignore: discarded_futures
    getNetworkInterfaces(whitelist: null, blacklist: null).then((value) {
      if (mounted) {
        setState(() {
          rawInterfaces = value.map((e) => (e.name, e.addresses.map((a) => a.address).toList())).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch(settingsProvider);
    final currList = settings.networkWhitelist ?? settings.networkBlacklist ?? [];
    final Future<void> Function(List<String>?) updateFunction = settings.networkWhitelist != null
        ? context.notifier(settingsProvider).setNetworkWhitelist
        : context.notifier(settingsProvider).setNetworkBlacklist;
    return Scaffold(
      appBar: basicLocalSendAppbar(t.networkInterfacesPage.title),
      body: LocalHeroScope(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: ResponsiveListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          children: [
            Text(
              t.networkInterfacesPage.info,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                t.networkInterfacesPage.preview,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ScrollConfiguration(
              // By default, Flutter only allows dragging with touch devices.
              // We also allow dragging with mouse.
              behavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.stylus,
                  PointerDeviceKind.trackpad,
                  PointerDeviceKind.unknown,
                },
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: rawInterfaces.mapIndexed((i, e) {
                    final ignored = isNetworkIgnoredRaw(
                      networkWhitelist: settings.networkWhitelist,
                      networkBlacklist: settings.networkBlacklist,
                      interface: e.$2,
                    );
                    final style = ignored
                        ? const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          )
                        : null;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('[#${i + 1}] ${e.$1}', style: style),
                              ...e.$2.map((ip) => Text(ip, style: style)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LabeledCheckbox(
                  label: t.networkInterfacesPage.whitelist,
                  value: settings.networkWhitelist != null,
                  onChanged: (value) async {
                    if (value == false) {
                      await context.notifier(settingsProvider).setNetworkWhitelist(null);
                    } else {
                      await context.notifier(settingsProvider).setNetworkWhitelist(switch (currList) {
                        [] => [''],
                        _ => [...currList],
                      });
                      if (context.mounted) {
                        await context.notifier(settingsProvider).setNetworkBlacklist(null);
                      }
                    }
                  },
                ),
                LabeledCheckbox(
                  label: t.networkInterfacesPage.blacklist,
                  value: settings.networkBlacklist != null,
                  onChanged: (value) async {
                    if (value == false) {
                      await context.notifier(settingsProvider).setNetworkBlacklist(null);
                    } else {
                      await context.notifier(settingsProvider).setNetworkBlacklist(switch (currList) {
                        [] => [''],
                        _ => [...currList],
                      });
                      if (context.mounted) {
                        await context.notifier(settingsProvider).setNetworkWhitelist(null);
                      }
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...currList.mapIndexed((i, e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: StringField(
                  value: e,
                  onChanged: (value) async {
                    await updateFunction([
                      ...currList.sublist(0, i),
                      value,
                      ...currList.sublist(i + 1),
                    ]);
                  },
                  builder: (context, controller) {
                    return TextFieldTv(
                      name: t.networkInterfacesPage.whitelist,
                      controller: controller,
                      onDelete: () async {
                        if (currList.length == 1) {
                          await updateFunction(null);
                          return;
                        }
                        await updateFunction([
                          ...currList.sublist(0, i),
                          ...currList.sublist(i + 1),
                        ]);
                      },
                    );
                  },
                ),
              );
            }),
            if (settings.networkWhitelist != null || settings.networkBlacklist != null)
              LocalHero(
                tag: 'network_interfaces_bottom',
                child: Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${t.general.example}:',
                          ),
                          Text('123.123.123.123'),
                          Text('123.123.123.*'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    FilledButton.icon(
                      onPressed: () async {
                        await updateFunction([
                          ...currList,
                          '',
                        ]);
                      },
                      icon: const Icon(Icons.add),
                      label: Text(t.general.add),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
