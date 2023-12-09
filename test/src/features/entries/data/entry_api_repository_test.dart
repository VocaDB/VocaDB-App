import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/entries/data/entry_api_repository.dart';
import 'package:vocadb_app/src/features/entries/data/entry_repository.dart';
import 'package:vocadb_app/src/features/entries/domain/entry.dart';

import '../../../mocks.dart';

void main() {
  group('entryApiRepository', () {
    late EntryRepository entryRepository;
    late ApiClient client;

    setUp(() {
      client = MockApiClient();
      entryRepository = EntryApiRepository(client: client);
    });

    test('fetchList success', () async {
      when(() => client
              .get('/api/entries', params: any(named: 'params', that: isMap)))
          .thenAnswer((_) async => {
                'items': [
                  {'id': 1, 'name': 'Hatsune Miku', 'entryType': 'Artist'},
                  {'id': 2, 'name': 'Melt', 'entryType': 'Song'},
                ],
                'totalCount': 2,
              });

      final result = await entryRepository.fetchEntriesList();

      verify(() => client.get('/api/entries',
          params: any(named: 'params', that: isMap)));
      expect(result, isA<List<Entry>>());
      expect(result, isNotEmpty);
      expect(result, [
        Entry(id: 1, name: 'Hatsune Miku', entryType: 'Artist'),
        Entry(id: 2, name: 'Melt', entryType: 'Song'),
      ]);
    });
  });
}
