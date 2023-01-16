import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artist_detail.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artists_list.dart';
import 'package:vocadb_app/src/features/artists/domain/artists_list_params.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class ArtistFakeRepository implements ArtistRepository {
  @override
  Future<List<Artist>> fetchList({ArtistsListParams? params}) {
    return Future.value(kFakeArtistList);
  }

  @override
  Future<Artist> fetchArtistID(int id, {String lang = 'Default'}) {
    return Future.value(kFakeArtistDetail);
  }
}

final artistFakeRepositoryProvider = Provider<ArtistFakeRepository>((ref) {
  return ArtistFakeRepository();
});
