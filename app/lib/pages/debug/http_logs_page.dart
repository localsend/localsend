import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:localsend_app/provider/logging/http_logs_provider.dart';
import 'package:localsend_app/util/ui/snackbar.dart';
import 'package:localsend_app/widget/copyable_text.dart';
import 'package:localsend_app/widget/responsive_list_view.dart';
import 'package:refena_flutter/refena_flutter.dart';

final _dateFormat = DateFormat.Hms();

class HttpLogsPage extends StatelessWidget {
  const HttpLogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logs = context.ref.watch(httpLogsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Logs'),
        actions: [
          IconButton(
            tooltip: 'Copy all logs',
            icon: const Icon(Icons.copy),
            onPressed: logs.isEmpty
                ? null
                : () async {
                    try {
                      await Clipboard.setData(
                        ClipboardData(
                          text: logs.map((log) => '[${_dateFormat.format(log.timestamp)}] ${log.log}').join('\n'),
                        ),
                      );
                      if (context.mounted) {
                        context.showSnackBar('Copied HTTP logs to clipboard');
                      }
                    } catch (e) {
                      if (context.mounted) {
                        context.showSnackBar('Failed to copy logs: $e');
                      }
                    }
                  },
          ),
        ],
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () => context.ref.notifier(httpLogsProvider).clear(),
                child: const Text('Clear'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...logs.map(
            (log) => CopyableText(
              prefix: TextSpan(
                text: '[${_dateFormat.format(log.timestamp)}] ',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              name: log.log,
              value: log.log,
            ),
          ),
        ],
      ),
    );
  }
}
