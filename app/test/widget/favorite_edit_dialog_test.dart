import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/model/persistence/favorite_device.dart';
import 'package:localsend_app/provider/persistence_provider.dart';
import 'package:localsend_app/widget/dialogs/favorite_edit_dialog.dart';
import 'package:mockito/mockito.dart';
import 'package:refena_flutter/refena_flutter.dart';

import '../mocks.mocks.dart';

void main() {
  for (final coverEditor in [false, true]) {
    testWidgets(coverEditor ? 'Saving a favorite closes its covered editor' : 'Saving a favorite closes the current editor', (tester) async {
      final persistence = MockPersistenceService();
      final saved = Completer<void>();
      final navigator = GlobalKey<NavigatorState>();
      const favorite = FavoriteDevice(id: '1', fingerprint: 'fingerprint', ip: '192.168.1.2', port: 53317, alias: 'Original');
      when(persistence.getFavorites()).thenReturn([favorite]);
      when(persistence.setFavorites(any)).thenAnswer((_) => saved.future);

      await tester.pumpWidget(
        RefenaScope(
          overrides: [persistenceProvider.overrideWithValue(persistence)],
          child: MaterialApp(
            navigatorKey: navigator,
            home: Builder(
              builder: (context) => TextButton(
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (_) => const FavoriteEditDialog(favorite: favorite),
                ),
                child: const Text('Edit favorite'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Edit favorite'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).first, 'Changed');
      await tester.tap(find.text(t.general.confirm));
      await tester.pump();
      verify(persistence.setFavorites(argThat(predicate<List<FavoriteDevice>>((devices) => devices.single.alias == 'Changed')))).called(1);

      if (coverEditor) {
        unawaited(
          showDialog<void>(
            context: navigator.currentContext!,
            builder: (_) => const AlertDialog(title: Text('Other dialog')),
          ),
        );
        await tester.pumpAndSettle();
      }

      saved.complete();
      await tester.pumpAndSettle();

      expect(find.byType(FavoriteEditDialog, skipOffstage: false), findsNothing);
      if (coverEditor) {
        expect(find.text('Other dialog'), findsOneWidget);
      } else {
        expect(find.text('Edit favorite'), findsOneWidget);
      }
    });
  }
}
