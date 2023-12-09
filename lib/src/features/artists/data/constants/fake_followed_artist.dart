import 'package:vocadb_app/src/features/artists/data/constants/fake_artists_list.dart';
import 'package:vocadb_app/src/features/artists/domain/followed_artist.dart';

final kFakeFollowedArtistsList =
    kFakeArtistList.map((e) => FollowedArtist(id: e.id, artist: e)).toList();
