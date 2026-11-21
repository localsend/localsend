import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/pages/selected_files_page.dart';
import 'package:localsend_app/provider/selection/selected_sending_files_provider.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:refena_flutter/refena_flutter.dart';

class _TestSelection extends SelectedSendingFilesNotifier {
  final List<CrossFile> files;

  _TestSelection(this.files);

  @override
  List<CrossFile> init() => files;
}

void main() {
  Future<void> pumpSelection(WidgetTester tester, String text) async {
    final bytes = utf8.encode(text);
    await tester.pumpWidget(
      RefenaScope(
        overrides: [
          selectedSendingFilesProvider.overrideWithNotifier(
            (_) => _TestSelection([
              CrossFile(
                name: 'message.txt',
                fileType: FileType.text,
                size: bytes.length,
                thumbnail: null,
                asset: null,
                path: null,
                bytes: bytes,
                lastModified: null,
                lastAccessed: null,
              ),
            ]),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(inputDecorationTheme: const InputDecorationTheme(fillColor: Colors.grey)),
          home: const SelectedFilesPage(),
        ),
      ),
    );
  }

  testWidgets('short messages remain readable and editable', (tester) async {
    await pumpSelection(tester, '你好');
    expect(find.text('"你好"'), findsOneWidget);
    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('large clipboard text stays editable without laying out the full content', (tester) async {
    final text = 'a' * 105000;
    await pumpSelection(tester, text);
    expect(find.textContaining(text), findsNothing);
    expect(find.textContaining('"aaa'), findsOneWidget);
    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();
    expect(tester.widget<TextFormField>(find.byType(TextFormField)).controller!.text, text);
  });
}
