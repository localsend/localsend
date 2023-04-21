import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/pages/debug/discovery_debug_page.dart';
import 'package:localsend_app/pages/debug/http_logs_page.dart';
import 'package:localsend_app/provider/app_arguments_provider.dart';
import 'package:localsend_app/provider/fingerprint_provider.dart';
import 'package:localsend_app/widget/copyable_text.dart';
import 'package:routerino/routerino.dart';

const _headerStyle = TextStyle(fontWeight: FontWeight.bold);

class DebugPage extends ConsumerWidget {
  const DebugPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appArguments = ref.watch(appArgumentsProvider);
    final fingerprint = ref.watch(fingerprintProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debugging'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
        children: [
          _DebugEntry(
            name: 'Debug Mode',
            value: kDebugMode.toString(),
          ),
          _DebugEntry(
            name: 'Fingerprint (generated randomly on app start)',
            value: fingerprint,
          ),
          _DebugEntry(
            name: 'App Arguments',
            value: appArguments.isEmpty ? null : appArguments.join(' '),
          ),
          _DebugEntry(
            name: 'Dart SDK',
            value: Platform.version,
          ),
          const SizedBox(height: 20),
          const Text('More', style: _headerStyle),
          const SizedBox(height: 5),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async => context.push(() => const DiscoveryDebugPage()),
                child: const Text('Discovery Debugging'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () async => context.push(() => const HttpLogsPage()),
                child: const Text('HTTP Logs'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DebugEntry extends StatelessWidget {
  final String name;
  final String? value;

  const _DebugEntry({
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(name, style: _headerStyle),
        CopyableText(
          name: name,
          value: value,
        ),
      ],
    );
  }
}
