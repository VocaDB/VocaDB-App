import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';

final kFakeAlbumCollections = kFakeAlbumsList.map(
  (e) => AlbumCollection(
      mediaType: 'Other', purchaseStatus: 'Wishlisted', rating: 5, album: e),
);
