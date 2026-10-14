import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/util/native/tray_helper.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

final _logger = Logger('Init');

/// Shows an alternative app if the initialization failed.
void showInitErrorApp({
  required Object error,
  required StackTrace stackTrace,
}) async {
  _logger.severe('Error during init', error, stackTrace);

  if (checkPlatformIsDesktop()) {
    await WindowManager.instance.ensureInitialized();
    await WindowManager.instance.show();
  }

  runApp(
    RefenaScope(
      child: _ErrorApp(
        error: error,
        stackTrace: stackTrace,
      ),
    ),
  );

  await showFromTray();
}

class _ErrorApp extends StatefulWidget {
  final Object error;
  final StackTrace stackTrace;

  const _ErrorApp({
    required this.error,
    required this.stackTrace,
  });

  @override
  State<_ErrorApp> createState() => _ErrorAppState();
}

class _ErrorAppState extends State<_ErrorApp> {
  final _controller = TextEditingController();
  String? _version;
  bool _copied = false;

  @override
  void initState() {
    super.initState();

    _updateText();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final info = await PackageInfo.fromPlatform();
        if (mounted) {
          setState(() {
            _version = '${info.version} (${info.buildNumber})';
            _updateText();
          });
        }
      } catch (_) {}
    });
  }

  void _updateText() {
    final prefix = _version != null ? 'LocalSend $_version\n\n' : '';
    _controller.text = '${prefix}Error: ${widget.error}\n\n${widget.stackTrace}';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final errorStr = widget.error.toString();
    final isDllBlockedByPolicy = Platform.isWindows &&
        (errorStr.contains('4551') ||
            errorStr.contains('0xc0e90002') ||
            errorStr.toLowerCase().contains('blocked by policy') ||
            errorStr.toLowerCase().contains('system integrity policy'));

    final isDllMissingDependency = Platform.isWindows &&
        (errorStr.contains('126') || errorStr.toLowerCase().contains('126'));

    return MaterialApp(
      title: 'LocalSend: Error',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('LocalSend: Startup Error'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (isDllBlockedByPolicy) ...[
                    Card(
                      color: theme.colorScheme.errorContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.security,
                                  color: theme.colorScheme.onErrorContainer,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Windows Security Policy Block (Error 4551)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: theme.colorScheme.onErrorContainer,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Windows Smart App Control or Defender Application Control blocked "rust_lib_localsend_app.dll" from running because it lacks an approved digital signature.\n\n'
                              'This typically happens when LocalSend was installed from an unsigned package (such as an outdated WinGet package manifest).\n\n'
                              'How to resolve:\n'
                              '1. Uninstall the currently installed version of LocalSend.\n'
                              '2. Download and install the official signed installer from localsend.org or GitHub Releases.',
                              style: TextStyle(
                                color: theme.colorScheme.onErrorContainer,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                FilledButton.icon(
                                  onPressed: () => launchUrl(
                                    Uri.parse('https://localsend.org'),
                                    mode: LaunchMode.externalApplication,
                                  ),
                                  icon: const Icon(Icons.download),
                                  label: const Text('Open localsend.org'),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () => launchUrl(
                                    Uri.parse('https://github.com/localsend/localsend/releases'),
                                    mode: LaunchMode.externalApplication,
                                  ),
                                  icon: const Icon(Icons.open_in_browser),
                                  label: const Text('GitHub Releases'),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () async {
                                    await Clipboard.setData(ClipboardData(text: _controller.text));
                                    if (mounted) {
                                      setState(() => _copied = true);
                                    }
                                  },
                                  icon: Icon(_copied ? Icons.check : Icons.copy),
                                  label: Text(_copied ? 'Copied' : 'Copy Details'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ] else if (isDllMissingDependency) ...[
                    Card(
                      color: theme.colorScheme.errorContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: theme.colorScheme.onErrorContainer,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Missing System Dependency (Error 126)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: theme.colorScheme.onErrorContainer,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Windows could not load "rust_lib_localsend_app.dll" because a required system dependency is missing.\n\n'
                              'Please install the Microsoft Visual C++ Redistributable (x64) and try launching LocalSend again.',
                              style: TextStyle(
                                color: theme.colorScheme.onErrorContainer,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                FilledButton.icon(
                                  onPressed: () => launchUrl(
                                    Uri.parse('https://aka.ms/vs/17/release/vc_redist.x64.exe'),
                                    mode: LaunchMode.externalApplication,
                                  ),
                                  icon: const Icon(Icons.download),
                                  label: const Text('Download Visual C++ Redistributable'),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () async {
                                    await Clipboard.setData(ClipboardData(text: _controller.text));
                                    if (mounted) {
                                      setState(() => _copied = true);
                                    }
                                  },
                                  icon: Icon(_copied ? Icons.check : Icons.copy),
                                  label: Text(_copied ? 'Copied' : 'Copy Details'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ] else ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Startup Error Details',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        OutlinedButton.icon(
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: _controller.text));
                            if (mounted) {
                              setState(() => _copied = true);
                            }
                          },
                          icon: Icon(_copied ? Icons.check : Icons.copy),
                          label: Text(_copied ? 'Copied' : 'Copy Details'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      maxLines: null,
                      expands: true,
                      readOnly: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
