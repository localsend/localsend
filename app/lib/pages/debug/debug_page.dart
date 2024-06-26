import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localsend_app/pages/debug/discovery_debug_page.dart';
import 'package:localsend_app/pages/debug/http_logs_page.dart';
import 'package:localsend_app/pages/debug/security_debug_page.dart';
import 'package:localsend_app/provider/app_arguments_provider.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/widget/debug_entry.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:routerino/routerino.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appArguments = context.ref.watch(appArgumentsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debugging'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
        children: [
          DebugEntry(
            name: 'Debug Mode',
            value: kDebugMode.toString(),
          ),
          DebugEntry(
            name: 'App Arguments',
            value: appArguments.isEmpty ? null : appArguments.join(' '),
          ),
          DebugEntry(
            name: 'Dart SDK',
            value: Platform.version,
          ),
          const SizedBox(height: 20),
          const Text('More', style: DebugEntry.headerStyle),
          const SizedBox(height: 5),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FilledButton(
                onPressed: () async => context.push(() => const SecurityDebugPage()),
                child: const Text('Security'),
              ),
              FilledButton(
                onPressed: () async => context.push(() => const DiscoveryDebugPage()),
                child: const Text('Discovery'),
              ),
              FilledButton(
                onPressed: () async => context.push(() => const HttpLogsPage()),
                child: const Text('HTTP Logs'),
              ),
              if (kDebugMode)
                FilledButton(
                  onPressed: () async => context.push(() => const RefenaTracingPage()),
                  child: const Text('Refena Tracing'),
                ),
              FilledButton(
                onPressed: () async => await context.ref.read(persistenceProvider).clear(),
                child: const Text('Clear settings'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
