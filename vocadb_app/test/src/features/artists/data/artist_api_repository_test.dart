import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/artists/data/artist_api_repository.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

import '../../../mocks.dart';

void main() {
  group('artistApiRepository', () {
    late ArtistRepository artistRepository;
    late ApiClient client;

    setUp(() {
      client = MockApiClient();
      artistRepository = ArtistApiRepository(client: client);
    });

    test('fetchList returns non-empty list of artists', () async {
      when(() => client
              .get('/api/artists', params: any(named: 'params', that: isMap)))
          .thenAnswer((_) async => {
                'items': [
                  {'id': 1, 'name': 'Hatsune Miku'},
                  {'id': 2, 'name': 'Kagamine Rin'},
                ],
                'totalCount': 2,
              });

      final result = await artistRepository.fetchList();

      verify(() => client.get('/api/artists',
          params: any(named: 'params', that: isMap)));
      expect(result, isA<List<Artist>>());
      expect(result, isNotEmpty);
      expect(result, [
        Artist(id: 1, name: 'Hatsune Miku'),
        Artist(id: 2, name: 'Kagamine Rin'),
      ]);
    });

    test('fetchArtistID', () async {
      when(() => client.get('/api/artists/1',
              params: any(named: 'params', that: isMap)))
          .thenAnswer((_) => Future.value({'id': 1, 'name': 'Hatsune Miku'}));

      final result = await artistRepository.fetchArtistID(1);

      verify(() => client.get('/api/artists/1',
          params: any(named: 'params', that: isMap)));

      expect(result, Artist(id: 1, name: 'Hatsune Miku'));
    });
  });
}

final artistApiRepositoryProvider = Provider<ArtistApiRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ArtistApiRepository(client: apiClient);
});
