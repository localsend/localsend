import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/util/fingerprint_alphabet.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:refena_flutter/refena_flutter.dart';

class CombinedFingerprint {
  final String combined;
  final List<IconData> icons;

  CombinedFingerprint({
    required this.combined,
    required this.icons,
  });

  factory CombinedFingerprint.load(BuildContext context, String fingerprint) {
    final myFingerprint = context.ref.watch(securityProvider.select((s) => s.certificateHash));
    final fingerprints = [myFingerprint, fingerprint]..sort();
    final combined = fingerprints.join();
    final icons = fingerprintToIcons(combined);
    return CombinedFingerprint(
      combined: combined,
      icons: icons,
    );
  }
}

enum VerifyMode {
  icons,
  raw,
}

/// Verifies the identity of a discovered device by comparing the fingerprints
/// of both sides.
class VerifyPage extends StatefulWidget {
  final CombinedFingerprint fingerprint;

  const VerifyPage({required this.fingerprint});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  VerifyMode _mode = VerifyMode.icons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.verifyPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          Center(
            child: SegmentedButton<VerifyMode>(
              segments: [
                ButtonSegment(value: VerifyMode.icons, label: Text(t.verifyPage.icons)),
                ButtonSegment(value: VerifyMode.raw, label: Text(t.verifyPage.raw)),
              ],
              selected: {_mode},
              onSelectionChanged: (selection) => setState(() => _mode = selection.first),
            ),
          ),
          const SizedBox(height: 20),
          VerifyWidget(
            mode: _mode,
            fingerprint: widget.fingerprint,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              t.verifyPage.question,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}

class VerifyWidget extends StatelessWidget {
  final VerifyMode mode;
  final CombinedFingerprint fingerprint;

  const VerifyWidget({
    required this.mode,
    required this.fingerprint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        switch (mode) {
          VerifyMode.icons => Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 240),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (final icon in fingerprint.icons) Icon(icon, size: 32),
                ],
              ),
            ),
          ),
          VerifyMode.raw => SelectableText(fingerprint.combined),
        },
      ],
    );
  }
}
