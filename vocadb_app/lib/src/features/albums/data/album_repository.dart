import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';

// TODO : use real data
class AlbumsRepository {
  AlbumsRepository._();
  static AlbumsRepository instance = AlbumsRepository._();

  List<Album> getRandomAlbums() {
    return kFakeAlbumsList;
  }

  List<Album> getNewAlbums() {
    return kFakeAlbumsList;
  }
}
