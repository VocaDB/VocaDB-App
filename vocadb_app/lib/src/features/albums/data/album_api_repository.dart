import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/albums_list_params.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/api/data/api_query_result.dart';

class AlbumApiRepository implements AlbumRepository {
  AlbumApiRepository({required this.client});

  final ApiClient client;

  @override
  Future<Album> fetchAlbumID(int id, {String lang = 'Default'}) async {
    final params = {
      'fields':
          'Tags,MainPicture,Tracks,AdditionalNames,Artists,Description,WebLinks,PVs',
      'songFields': 'MainPicture,PVs,ThumbUrl',
      'lang': lang,
    };
    final responseBody = await client.get('api/albums/$id', params: params);

    return Album.fromJson(responseBody);
  }

  @override
  Future<List<Album>> fetchAlbums({
    AlbumsListParams params = const AlbumsListParams(),
  }) async {
    final response = await client.get('/api/albums', params: params.toJson());

    final queryResult = ApiQueryResult.fromMap(response);

    return Album.fromJsonToList(queryResult.items).toList();
  }

  @override
  Future<List<Album>> fetchNew({String lang = 'Default'}) async {
    final params = {
      'fields': 'MainPicture',
      'languagePreference': lang,
    };
    final responseBody = await client.get('api/albums/new', params: params);

    return Album.fromJsonToList(responseBody).toList();
  }

  @override
  Future<List<Album>> fetchTop({String lang = 'Default'}) async {
    final params = {
      'fields': 'MainPicture',
      'languagePreference': lang,
    };
    final responseBody = await client.get('api/albums/top', params: params);

    return Album.fromJsonToList(responseBody).toList();
  }

  @override
  Future<List<Album>> fetchTopAlbumsByTagID(int tagID,
      {String lang = 'Default'}) {
    return fetchAlbums(
      params: AlbumsListParams(
        tagId: [tagID],
        sort: 'RatingAverage',
        lang: lang,
      ),
    );
  }
}

/// Album API Repository Provider
final albumApiRepositoryProvider =
    Provider.autoDispose<AlbumApiRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AlbumApiRepository(client: apiClient);
});
