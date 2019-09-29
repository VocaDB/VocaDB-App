import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/search_bloc.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/entry_service.dart';

class MockEntryService extends Mock implements EntryService {}

main() {
  MockEntryService mockEntryService;

  final List<EntryModel> mockResults = [
    EntryModel.fromJson({'id': 1, 'name': 'A'}),
    EntryModel.fromJson({'id': 2, 'name': 'B'}),
    EntryModel.fromJson({'id': 3, 'name': 'C'}),
    EntryModel.fromJson({'id': 4, 'name': 'D'}),
  ];

  setUp(() {
    mockEntryService = MockEntryService();
    when(mockEntryService.search(any, any, params: anyNamed('params')))
        .thenAnswer((_) => Future.value(mockResults));
  });
  test('should emits query when update query', () async {
    final bloc = SearchBloc(entryService: mockEntryService);

    bloc.updateQuery('abc');

    await expectLater(bloc.queryStream, emits('abc'));
  });

  test('should emits empty query when clear query', () async {
    final bloc = SearchBloc(entryService: mockEntryService);

    bloc.updateQuery('abc');

    await expectLater(bloc.queryStream, emits('abc'));

    bloc.clearQuery();

    await expectLater(bloc.queryStream, emits(''));
  });

  test('should emits empty query when clear query', () async {
    final bloc = SearchBloc(entryService: mockEntryService);

    bloc.updateQuery('abc');

    await expectLater(bloc.queryStream, emits('abc'));

    bloc.clearQuery();

    await expectLater(bloc.queryStream, emits(''));
  });

  test('should trigger fetch when song filter updated', () async {
    final bloc = SearchBloc(entryService: mockEntryService);

    await bloc.updateQuery('abc');

    verify(mockEntryService.search('abc', EntryType.Undefined, params: {}))
        .called(1);

    await expectLater(bloc.isSearching$, emits(true));

    bloc.updateQuery('de');

    await expectLater(bloc.queryStream, emits('de'));

    verify(mockEntryService.search('de', EntryType.Undefined, params: {}))
        .called(1);

    bloc.updateEntryType(EntryType.Song);

    await expectLater(bloc.entryTypeStream, emits(EntryType.Song));

    verify(mockEntryService
        .search('de', EntryType.Song, params: {'sort': 'Name'})).called(1);

    await bloc.songFilterBloc
        .addTag(TagModel.fromJson({'id': 1, 'name': 'tag_01'}));

    verify(mockEntryService.search('de', EntryType.Song,
        params: {'sort': 'Name', 'tagId': '1'})).called(1);
  });
}
