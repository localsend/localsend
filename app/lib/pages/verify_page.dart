import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/provider/security_provider.dart';
import 'package:localsend_app/util/fingerprint_alphabet.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:refena_flutter/refena_flutter.dart';

enum _VerifyMode {
  icons,
  raw,
}

/// Verifies the identity of a discovered device by comparing the fingerprints
/// of both sides.
class VerifyPage extends StatefulWidget {
  final Device device;

  const VerifyPage({required this.device});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  _VerifyMode _mode = _VerifyMode.icons;

  @override
  Widget build(BuildContext context) {
    final myFingerprint = context.ref.watch(securityProvider.select((s) => s.certificateHash));
    final fingerprints = [myFingerprint, widget.device.fingerprint]..sort();
    final combined = fingerprints.join();
    return Scaffold(
      appBar: AppBar(
        title: Text(t.verifyPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          Center(
            child: SegmentedButton<_VerifyMode>(
              segments: [
                ButtonSegment(value: _VerifyMode.icons, label: Text(t.verifyPage.icons)),
                ButtonSegment(value: _VerifyMode.raw, label: Text(t.verifyPage.raw)),
              ],
              selected: {_mode},
              onSelectionChanged: (selection) => setState(() => _mode = selection.first),
            ),
          ),
          const SizedBox(height: 20),
          switch (_mode) {
            _VerifyMode.icons => Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 240),
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (final icon in fingerprintToIcons(combined)) Icon(icon, size: 32),
                  ],
                ),
              ),
            ),
            _VerifyMode.raw => SelectableText(combined),
          },
        ],
      ),
    );
  }
}
