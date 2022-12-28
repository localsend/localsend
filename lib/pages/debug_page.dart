import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localsend_app/util/snackbar.dart';

const _headerStyle = TextStyle(fontWeight: FontWeight.bold);

class DebugPage extends ConsumerWidget {
  const DebugPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debugging'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          const Text('Debug Mode', style: _headerStyle),
          Text(kDebugMode.toString()),
          const SizedBox(height: 20),
          const Text('Dart SDK', style: _headerStyle),
          _CopyableText(
            name: 'Dart SDK',
            value: Platform.version,
          ),
        ],
      ),
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
      onTap: () {
        Clipboard.setData(ClipboardData(text: value));
        context.showSnackBar('Copied $name to clipboard!');
      },
      child: Text(value ?? '-'),
    );
  }
}
