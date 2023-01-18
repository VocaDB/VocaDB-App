import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_song_detail.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_song_related.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';
import 'package:vocadb_app/src/features/songs/domain/songs_list_params.dart';

class SongFakeRepository implements SongRepository {
  @override
  Future<Song> fetchSongId(int id, {String lang = 'Default'}) async {
    return await Future.value(kFakeSongDetail);
  }

  @override
  Future<List<Song>> fetchSongsDerived(int id, {String? lang}) async {
    return await Future.value(kFakeSongsList);
  }

  @override
  Future<List<Song>> fetchSongsHighlighted({String lang = 'Default'}) async {
    return await Future.value(kFakeSongsList);
  }

  @override
  Future<List<Song>> fetchSongsList({
    SongsListParams params = const SongsListParams(),
  }) async {
    return await Future.value(kFakeSongsList);
  }

  @override
  Future<SongRelated> fetchSongsRelated(int id, {String? lang}) async {
    return await Future.value(kFakeSongRelated);
  }

  @override
  Future<List<Song>> fetchSongsTopRated({
    String lang = 'Default',
    int durationHours = 0,
    String filterBy = 'CreateDate',
    String vocalist = 'Nothing',
  }) async {
    return await Future.value(kFakeSongsList);
  }

  @override
  Future<void> rating(int id, String rating) {
    // TODO: implement rating
    throw UnimplementedError();
  }

  @override
  Future<List<Song>> fetchTopSongsByTagID(int tagId,
      {String lang = 'Default'}) {
    // TODO: implement fetchTopSongsByTagID
    return Future.value(kFakeSongsList);
  }
}

final songFakeRepositoryProvider = Provider<SongFakeRepository>((ref) {
  return SongFakeRepository();
});
