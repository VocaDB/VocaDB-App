import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/albums/data/album_repository.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_album_detail.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';

class AlbumFakeRepository implements AlbumRepository {
  @override
  Future<Album> fetchAlbumID(int id, {String lang = 'Default'}) {
    return Future.value(kFakeAlbumDetailSingleDisc);
  }

  @override
  Future<List<Album>> fetchAlbums({String lang = 'Default'}) {
    return Future.value(kFakeAlbumsList);
  }

  @override
  Future<List<Album>> fetchNew({String lang = 'Default'}) {
    return Future.value(kFakeAlbumsList);
  }

  @override
  Future<List<Album>> fetchTop({String lang = 'Default'}) {
    return Future.value(kFakeAlbumsList);
  }
}

/// Album Fake Repository Provider
final albumFakeRepositoryProvider = Provider<AlbumFakeRepository>((ref) {
  return AlbumFakeRepository();
});
