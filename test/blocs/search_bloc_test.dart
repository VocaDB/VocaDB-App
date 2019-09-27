import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vocadb/blocs/search_bloc.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/entry_service.dart';

class MockEntryService extends Mock implements EntryService {}

main() {
  final MockEntryService mockEntryService = MockEntryService();

  final List<EntryModel> mockResults = [
    EntryModel.fromJson({'id': 1, 'name': 'A'}),
    EntryModel.fromJson({'id': 2, 'name': 'B'}),
    EntryModel.fromJson({'id': 3, 'name': 'C'}),
    EntryModel.fromJson({'id': 4, 'name': 'D'}),
  ];

  setUp(() {
    when(mockEntryService.search(any, any))
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
}
