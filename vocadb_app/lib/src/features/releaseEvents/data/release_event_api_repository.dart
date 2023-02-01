import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/api/data/api_query_result.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_events_list_params.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class ReleaseEventApiRepository implements ReleaseEventRepository {
  final ApiClient client;

  ReleaseEventApiRepository({
    required this.client,
  });

  @override
  Future<List<ReleaseEvent>> fetchReleaseEventsList(
      {ReleaseEventsListParams params =
          const ReleaseEventsListParams()}) async {
    final response =
        await client.get('/api/releaseEvents', params: params.toJson());

    final queryResult = ApiQueryResult.fromMap(response);

    return ReleaseEvent.fromJsonToList(queryResult.items).toList();
  }

  @override
  Future<List<ReleaseEvent>> fetchRecentEvents({String lang = 'Default'}) {
    return fetchReleaseEventsList(
        params: ReleaseEventsListParams(
      sort: 'Date',
      lang: lang,
      afterDate: DateTime.now().subtract(const Duration(days: 3)),
      beforeDate: DateTime.now().add(const Duration(days: 12)),
    ));
  }

  @override
  Future<ReleaseEvent> fetchReleaseEventByID(int id,
      {String lang = 'Default'}) async {
    final params = {
      'fields':
          'AdditionalNames, Artists, Description, MainPicture, Names, Series, SongList, Tags, Venue, WebLinks, PVs',
      'lang': lang,
    };
    final response = await client.get('/api/releaseEvents/$id', params: params);

    return ReleaseEvent.fromJson(response);
  }

  @override
  Future<List<Album>> fetchAlbums(int id, {String lang = 'Default'}) async {
    final params = {
      'fields': 'MainPicture',
      'lang': lang,
    };

    final response =
        await client.get('/api/releaseEvents/$id/albums', params: params);

    return Album.fromJsonToList(response);
  }

  @override
  Future<List<Song>> fetchPublishedSongs(int id,
      {String lang = 'Default'}) async {
    final params = {
      'fields': 'ThumbUrl,MainPicture,PVs',
      'lang': lang,
    };

    final response = await client.get('/api/releaseEvents/$id/published-songs',
        params: params);

    return Song.fromJsonToList(response);
  }
}

final releaseEventApiRepositoryProvider =
    Provider.autoDispose<ReleaseEventApiRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ReleaseEventApiRepository(client: apiClient);
});
