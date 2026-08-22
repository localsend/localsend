import 'package:flutter/material.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/widget/debug_entry.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:refena_flutter/refena_flutter.dart';

class SecurityDebugPage extends StatelessWidget {
  const SecurityDebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    final securityContext = context.ref.watch(securityProvider);
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
              FilledButton(
                onPressed: () async => await context.ref.redux(securityProvider).dispatchAsync(ResetSecurityContextAction()),
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
