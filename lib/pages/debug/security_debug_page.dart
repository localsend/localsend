import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/widget/debug_entry.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';

class SecurityDebugPage extends ConsumerWidget {
  const SecurityDebugPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final securityContext = ref.watch(securityProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Debugging'),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        maxWidth: 700,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () async => ref.read(securityProvider.notifier).reset(),
                child: const Text('Reset'),
              ),
            ],
          ),
          DebugEntry(
            name: 'Certificate SHA-256 (fingerprint)',
            value: securityContext.certificateHash,
          ),
          DebugEntry(
            name: 'Certificate',
            value: securityContext.certificate,
          ),
          DebugEntry(
            name: 'Private Key',
            value: securityContext.privateKey,
          ),
          DebugEntry(
            name: 'Public Key',
            value: securityContext.publicKey,
          ),
        ],
      ),
    );
  }
}
