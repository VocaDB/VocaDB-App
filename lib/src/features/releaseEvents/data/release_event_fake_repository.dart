import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/constants/fake_release_event_detail.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/constants/fake_release_events_list.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event_repository.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_events_list_params.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class ReleaseEventFakeRepository implements ReleaseEventRepository {
  @override
  Future<List<ReleaseEvent>> fetchReleaseEventsList(
      {ReleaseEventsListParams params = const ReleaseEventsListParams()}) {
    return Future.value(kFakeReleaseEventsList);
  }

  @override
  Future<List<ReleaseEvent>> fetchRecentEvents({String lang = 'Default'}) {
    return fetchReleaseEventsList();
  }

  @override
  Future<ReleaseEvent> fetchReleaseEventByID(int id,
      {String lang = 'Default'}) {
    return Future.value(kFakeReleaseEventDetail);
  }

  @override
  Future<List<Album>> fetchAlbums(int id, {String lang = 'Default'}) {
    return Future.value(kFakeAlbumsList);
  }

  @override
  Future<List<Song>> fetchPublishedSongs(int id, {String lang = 'Default'}) {
    return Future.value(kFakeSongsList);
  }
}

final releaseEventFakeRepositoryProvider =
    Provider<ReleaseEventFakeRepository>((ref) {
  return ReleaseEventFakeRepository();
});
