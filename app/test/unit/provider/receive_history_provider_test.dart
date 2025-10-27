import 'package:common/model/file_type.dart';
import 'package:localsend_app/model/persistence/receive_history_entry.dart';
import 'package:localsend_app/provider/receive_history_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:refena_flutter/refena_flutter.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockPersistenceService persistenceService;

  setUp(() {
    persistenceService = MockPersistenceService();
    when(persistenceService.isSaveToHistory()).thenReturn(true);
  });

  test('Should add an entry', () async {
    final service = ReduxNotifier.test(
      redux: ReceiveHistoryService(persistenceService),
    );

    final entry = _createEntry('1');

    await service.dispatchAsync(
      AddHistoryEntryAction(
        entryId: entry.id,
        fileName: entry.fileName,
        fileType: entry.fileType,
        path: entry.path,
        savedToGallery: entry.savedToGallery,
        isMessage: entry.isMessage,
        fileSize: entry.fileSize,
        senderAlias: entry.senderAlias,
        timestamp: entry.timestamp,
      ),
    );

    expect(service.state, [entry]);
    verify(persistenceService.setReceiveHistory([entry]));
  });

  test('Should not add an entry if disabled', () async {
    when(persistenceService.isSaveToHistory()).thenReturn(false);

    final service = ReduxNotifier.test(
      redux: ReceiveHistoryService(persistenceService),
    );

    final entry = _createEntry('1');

    await service.dispatchAsync(
      AddHistoryEntryAction(
        entryId: entry.id,
        fileName: entry.fileName,
        fileType: entry.fileType,
        path: entry.path,
        savedToGallery: entry.savedToGallery,
        isMessage: entry.isMessage,
        fileSize: entry.fileSize,
        senderAlias: entry.senderAlias,
        timestamp: entry.timestamp,
      ),
    );

    expect(service.state, []);
    verifyNever(persistenceService.setReceiveHistory(any));
  });

  test('Should remove the 30th entry when adding another', () async {
    final service = ReduxNotifier.test(
      redux: ReceiveHistoryService(persistenceService),
      initialState: List.generate(30, (index) => _createEntry(index.toString())),
    );

    expect(service.state.length, 30);
    expect(service.state.first, _createEntry('0'));
    expect(service.state.last, _createEntry('29'));

    final entry = _createEntry('AAA');

    await service.dispatchAsync(
      AddHistoryEntryAction(
        entryId: entry.id,
        fileName: entry.fileName,
        fileType: entry.fileType,
        path: entry.path,
        savedToGallery: entry.savedToGallery,
        isMessage: entry.isMessage,
        fileSize: entry.fileSize,
        senderAlias: entry.senderAlias,
        timestamp: entry.timestamp,
      ),
    );

    expect(service.state.length, 30);
    expect(service.state.first, entry);
    expect(service.state.first, _createEntry('AAA'));
    expect(service.state[1], _createEntry('0'));
    expect(service.state.last, _createEntry('28'));
  });

  test('Should remove an entry', () async {
    final service = ReduxNotifier.test(
      redux: ReceiveHistoryService(persistenceService),
      initialState: [
        _createEntry('1'),
        _createEntry('2'),
        _createEntry('3'),
      ],
    );

    expect(service.state.length, 3);

    await service.dispatchAsync(RemoveHistoryEntryAction('2'));

    expect(service.state.length, 2);
    expect(service.state, [
      _createEntry('1'),
      _createEntry('3'),
    ]);
    verify(
      persistenceService.setReceiveHistory([
        _createEntry('1'),
        _createEntry('3'),
      ]),
    );
  });

  test('Should not remove an entry if not found', () async {
    final service = ReduxNotifier.test(
      redux: ReceiveHistoryService(persistenceService),
      initialState: [
        _createEntry('1'),
        _createEntry('2'),
        _createEntry('3'),
      ],
    );

    expect(service.state.length, 3);

    await service.dispatchAsync(RemoveHistoryEntryAction('4'));

    expect(service.state.length, 3);
    expect(service.state, [
      _createEntry('1'),
      _createEntry('2'),
      _createEntry('3'),
    ]);
    verifyNever(persistenceService.setReceiveHistory(any));
  });

  test('Should remove all entries', () async {
    final service = ReduxNotifier.test(
      redux: ReceiveHistoryService(persistenceService),
      initialState: [
        _createEntry('1'),
        _createEntry('2'),
        _createEntry('3'),
      ],
    );

    expect(service.state.length, 3);

    await service.dispatchAsync(RemoveAllHistoryEntriesAction());

    expect(service.state.length, 0);
    verify(persistenceService.setReceiveHistory([]));
  });
}

ReceiveHistoryEntry _createEntry(String id) {
  return ReceiveHistoryEntry(
    id: id,
    fileName: 'fileName',
    fileType: FileType.image,
    path: 'path',
    savedToGallery: true,
    isMessage: false,
    fileSize: 123,
    senderAlias: 'senderAlias',
    timestamp: DateTime(2021, 1, 1),
  );
}
