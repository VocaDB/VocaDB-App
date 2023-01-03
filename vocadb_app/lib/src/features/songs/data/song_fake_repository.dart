import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_song_detail.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/data/song_repository.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class SongFakeRepository implements SongRepository {
  @override
  Future<Song> fetchSongId(int id) async {
    return await Future.value(kFakeSongDetail);
  }

  @override
  Future<List<Song>> fetchSongsDerived(int id, {String? lang}) async {
    return await Future.value(kFakeSongsList);
  }

  @override
  Future<List<Song>> fetchSongsHighlighted() async {
    return await Future.value(kFakeSongsList);
  }

  @override
  Future<List<Song>> fetchSongsList() async {
    return await Future.value(kFakeSongsList);
  }

  @override
  Future<List<Song>> fetchSongsRelated(int id, {String? lang}) async {
    return await Future.value(kFakeSongsList);
  }

  @override
  Future<List<Song>> fetchSongsTopRated(
      {String? lang,
      int? durationHours,
      String? filterBy,
      String? vocalist}) async {
    return await Future.value(kFakeSongsList);
  }

  @override
  Future<void> rating(int id, String rating) {
    // TODO: implement rating
    throw UnimplementedError();
  }
}

final songFakeRepositoryProvider =
    Provider.autoDispose<SongFakeRepository>((ref) {
  return SongFakeRepository();
});
