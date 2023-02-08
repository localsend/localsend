import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/provider/app_arguments_provider.dart';
import 'package:localsend_app/provider/fingerprint_provider.dart';
import 'package:localsend_app/util/snackbar.dart';

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
        _CopyableText(
          name: name,
          value: value,
        ),
      ],
    );
  }
}

class _CopyableText extends StatelessWidget {
  final String name;
  final String? value;

  const _CopyableText({
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: value == null
          ? null
          : () {
              Clipboard.setData(ClipboardData(text: value));
              context.showSnackBar('Copied $name to clipboard!');
            },
      child: Text(value ?? '-'),
    );
  }
}
