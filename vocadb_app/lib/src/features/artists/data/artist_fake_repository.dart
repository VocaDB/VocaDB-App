import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/artists/data/artist_repository.dart';
import 'package:vocadb_app/src/features/artists/domain/artists_list_params.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

class ArtistFakeRepository implements ArtistRepository {
  @override
  Future<List<Artist>> fetchList({ArtistsListParams? params}) {
    // TODO: implement fetchList
    throw UnimplementedError();
  }
}

final artistFakeRepositoryProvider = Provider<ArtistFakeRepository>((ref) {
  return ArtistFakeRepository();
});
