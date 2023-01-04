import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class SongApiRepository implements SongRepository {
  SongApiRepository({required this.client});

  final ApiClient client;

  @override
  Future<Song> fetchSongId(int id) async {
    final responseBody = await client.get('api/songs/$id', params: {
      'fields': 'ThumbUrl,MainPicture,PVs',
    });

    return Song.fromJson(responseBody);
  }

  @override
  Future<List<Song>> fetchSongsDerived(int id, {String? lang}) {
    // TODO: implement fetchSongsDerived
    throw UnimplementedError();
  }

  @override
  Future<List<Song>> fetchSongsHighlighted({String lang = 'Default'}) async {
    final responseBody = await client.get('api/songs/highlighted', params: {
      'fields': 'ThumbUrl,MainPicture,PVs',
      'languagePreference': lang,
    });
    return Song.fromJsonToList(responseBody).toList();
  }

  @override
  Future<List<Song>> fetchSongsList() {
    // TODO: implement fetchSongsList
    throw UnimplementedError();
  }

  @override
  Future<List<Song>> fetchSongsRelated(int id, {String? lang}) {
    // TODO: implement fetchSongsRelated
    throw UnimplementedError();
  }

  @override
  Future<List<Song>> fetchSongsTopRated(
      {String? lang, int? durationHours, String? filterBy, String? vocalist}) {
    // TODO: implement fetchSongsTopRated
    throw UnimplementedError();
  }

  @override
  Future<void> rating(int id, String rating) {
    // TODO: implement rating
    throw UnimplementedError();
  }
}

final songApiRepositoryProvider =
    Provider.autoDispose<SongApiRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return SongApiRepository(client: apiClient);
});
