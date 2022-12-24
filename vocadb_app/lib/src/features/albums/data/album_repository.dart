import 'package:vocadb_app/src/features/albums/data/test_albums.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';

class AlbumsRepository {
  AlbumsRepository._();
  static AlbumsRepository instance = AlbumsRepository._();

  List<Album> getRandomAlbums() {
    return kTestAlbums;
  }

  List<Album> getNewAlbums() {
    return kTestAlbums;
  }
}
