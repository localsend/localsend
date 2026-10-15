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
  testWidgets('rejects invalid ports and saves a corrected port', (tester) async {
    final persistence = MockPersistenceService();
    final favorite = FavoriteDevice(
      id: 'device-id',
      fingerprint: 'fingerprint',
      ip: '192.168.1.2',
      port: 53317,
      alias: 'Nearby device',
    );
    when(persistence.getFavorites()).thenReturn([favorite]);
    when(persistence.setFavorites(any)).thenAnswer((_) async {});
    await tester.pumpWidget(
      RefenaScope(
        overrides: [persistenceProvider.overrideWithValue(persistence)],
        child: MaterialApp(home: FavoriteEditDialog(favorite: favorite)),
      ),
    );

    final portField = find.byType(TextFormField).at(2);
    final confirm = find.byType(FilledButton);
    final error = find.text(t.dialogs.favoriteEditDialog.invalidPort);
    for (final port in ['abc', '0', '65536', '']) {
      await tester.enterText(portField, port);
      await tester.tap(confirm);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(error, findsOneWidget);
      verifyNever(persistence.setFavorites(any));
    }

    for (final port in [1, 65535]) {
      await tester.enterText(portField, '$port');
      await tester.tap(confirm);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(error, findsNothing);
      verify(persistence.setFavorites([favorite.copyWith(port: port)])).called(1);
    }
  });
}
