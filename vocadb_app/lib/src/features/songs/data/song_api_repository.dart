import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/api/data/api_query_result.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';
import 'package:vocadb_app/src/features/songs/domain/songs_list_params.dart';

class SongApiRepository implements SongRepository {
  SongApiRepository({required this.client});

  final ApiClient client;

  @override
  Future<Song> fetchSongId(int id, {String lang = 'Default'}) async {
    final params = {
      'fields':
          'MainPicture,PVs,ThumbUrl,Albums,Artists,Tags,WebLinks,AdditionalNames,WebLinks,Lyrics',
      'lang': lang
    };
    final responseBody = await client.get('api/songs/$id', params: params);

    return Song.fromJson(responseBody);
  }

  @override
  Future<List<Song>> fetchSongsDerived(int id,
      {String lang = 'Default'}) async {
    final params = {
      'fields': 'ThumbUrl,MainPicture,PVs',
      'languagePreference': lang,
    };
    final responseBody =
        await client.get('api/songs/$id/derived', params: params);

    return Song.fromJsonToList(responseBody).toList();
  }

  @override
  Future<List<Song>> fetchSongsHighlighted({String lang = 'Default'}) async {
    final params = {
      'fields': 'ThumbUrl,MainPicture,PVs',
      'languagePreference': lang,
    };
    final responseBody =
        await client.get('api/songs/highlighted', params: params);

    return Song.fromJsonToList(responseBody).toList();
  }

  @override
  Future<List<Song>> fetchSongsList({
    SongsListParams params = const SongsListParams(),
  }) async {
    final responseBody = await client.get('api/songs', params: params.toJson());

    final queryResult = ApiQueryResult.fromMap(responseBody);

    return Song.fromJsonToList(queryResult.items).toList();
  }

  @override
  Future<SongRelated> fetchSongsRelated(int id,
      {String lang = 'Default'}) async {
    final params = {
      'fields': 'ThumbUrl,MainPicture,PVs',
      'languagePreference': lang,
    };
    final responseBody =
        await client.get('api/songs/$id/related', params: params);

    return SongRelated.fromJson(responseBody);
  }

  @override
  Future<List<Song>> fetchSongsTopRated({
    String lang = 'Default',
    int durationHours = 0,
    String filterBy = 'CreateDate',
    String vocalist = 'Nothing',
  }) async {
    final params = {
      'filterBy': filterBy,
      'vocalist': vocalist,
      'fields': 'ThumbUrl,MainPicture,PVs',
      'languagePreference': lang,
    };

    if (durationHours > 0) {
      params['durationHours'] = durationHours.toString();
    }

    final responseBody =
        await client.get('api/songs/top-rated', params: params);

    return Song.fromJsonToList(responseBody).toList();
  }

  @override
  Future<void> rating(int id, String rating) {
    // TODO: implement rating
    throw UnimplementedError();
  }

  @override
  Future<List<Song>> fetchTopSongsByTagID(int tagId,
      {String lang = 'Default'}) {
    return fetchSongsList(
      params: SongsListParams(
        tagId: [tagId],
        sort: 'RatingScore',
        lang: lang,
      ),
    );
  }
}

final songApiRepositoryProvider =
    Provider.autoDispose<SongApiRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return SongApiRepository(client: apiClient);
});
