import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/api/data/api_query_result.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/artists/domain/artists_list_params.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class ArtistApiRepository implements ArtistRepository {
  ArtistApiRepository({required this.client});

  final ApiClient client;

  @override
  Future<List<Artist>> fetchList({
    ArtistsListParams params = const ArtistsListParams(),
  }) async {
    final response = await client.get('/api/artists', params: params.toJson());

    final queryResult = ApiQueryResult.fromMap(response);

    return Artist.fromJsonToList(queryResult.items).toList();
  }

  @override
  Future<Artist> fetchArtistID(int id, {String lang = 'Default'}) async {
    final params = {
      'fields':
          'AdditionalNames, ArtistLinks, ArtistLinksReverse, BaseVoicebank, Description, MainPicture, Tags, WebLinks',
      'relations':
          'LatestAlbums, LatestEvents, LatestSongs, PopularAlbums, PopularSongs, All',
      'lang': lang,
    };

    final response = await client.get('/api/artists/$id', params: params);

    return Artist.fromJson(response);
  }
}

final artistApiRepositoryProvider = Provider<ArtistApiRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ArtistApiRepository(client: apiClient);
});
