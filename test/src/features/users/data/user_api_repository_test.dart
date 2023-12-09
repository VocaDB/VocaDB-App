import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';
import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/followed_artist.dart';
import 'package:vocadb_app/src/features/songs/domain/rated_song.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/users/data/user_api_repository.dart';
import 'package:vocadb_app/src/features/users/domain/followed_artists_list_params.dart';
import 'package:vocadb_app/src/features/users/domain/rated_songs_list_params.dart';
import 'package:vocadb_app/src/features/users/domain/user_albums_list_params.dart';

import '../../../mocks.dart';

void main() {
  group('userApiRepository', () {
    late UserApiRepository userApiRepository;
    late ApiClient client;

    setUp(() {
      client = MockApiClient();
      userApiRepository = UserApiRepository(client: client);
    });

    test('fetchRatedSongID success', () async {
      const userID = 1;
      const songID = 1;
      clientCallGet() =>
          client.get('/api/users/$userID/ratedSongs/$songID', json: false);

      when(clientCallGet).thenAnswer((_) => Future.value('Favorite'));

      final response = await userApiRepository.fetchRatedSongID(userID, songID);

      expect(response, 'Favorite');
    });

    test('fetchRatedSongsList success', () async {
      const userID = 1;
      const responseBody = {
        "items": [
          {
            "rating": "Favorite",
            "song": {"id": 1, "name": "Song_A"}
          },
          {
            "rating": "Like",
            "song": {"id": 2, "name": "Song_B"}
          }
        ],
        "totalCount": 2
      };

      clientCallGet() => client.get(any(),
          params: any(named: 'params', that: isMap), cache: false);

      when(clientCallGet).thenAnswer((_) => Future.value(responseBody));

      final response = await userApiRepository.fetchRatedSongsList(
          userID, const RatedSongsListParams(query: 'Song'));

      final expected = [
        RatedSong(rating: 'Favorite', song: const Song(id: 1, name: 'Song_A')),
        RatedSong(rating: 'Like', song: const Song(id: 2, name: 'Song_B'))
      ];

      expect(response, expected);

      // Capture arguments
      final captured = verify(() => client.get(captureAny(),
          params: captureAny(named: 'params'), cache: false)).captured;

      expect(captured[0], '/api/users/$userID/ratedSongs');

      expect(captured[1], {
        'query': 'Song',
        'start': 0,
        'maxResults': 10,
        'sort': 'RatingDate',
        'fields': 'MainPicture,PVs',
        'lang': 'Default',
        'rating': 'Nothing'
      });
    });

    test('fetchFollowedArtistsList success', () async {
      const userID = 1;
      const responseBody = {
        "items": [
          {
            "id": 1,
            "artist": {"id": 2, "name": "Artist_A"}
          },
          {
            "id": 3,
            "artist": {"id": 4, "name": "Artist_B"}
          }
        ],
        "totalCount": 2
      };

      clientCallGet() => client.get(any(),
          params: any(named: 'params', that: isMap), cache: false);

      when(clientCallGet).thenAnswer((_) => Future.value(responseBody));

      final response = await userApiRepository.fetchFollowedArtistsList(
          userID, const FollowedArtistsListParams(query: 'Miku'));

      final expected = [
        FollowedArtist(id: 1, artist: Artist(id: 2, name: 'Artist_A')),
        FollowedArtist(id: 3, artist: Artist(id: 4, name: 'Artist_B'))
      ];

      expect(response, expected);

      // Capture arguments
      final captured = verify(() => client.get(captureAny(),
          params: captureAny(named: 'params'), cache: false)).captured;

      expect(captured[0], '/api/users/$userID/followedArtists');

      expect(captured[1], {
        'query': 'Miku',
        'start': 0,
        'maxResults': 10,
        'sort': 'Name',
        'fields': 'MainPicture',
        'lang': 'Default',
      });
    });

    test('fetchUserAlbum success', () async {
      const userID = 1;
      const responseBody = {
        "items": [
          {
            "rating": 5,
            "mediaType": "Other",
            "purchaseStatus": "Wishlisted",
            "album": {"id": 1, "name": "Album_A"}
          },
          {
            "rating": 4,
            "mediaType": "DigitalDownload",
            "purchaseStatus": "Owned",
            "album": {"id": 2, "name": "Album_B"}
          }
        ],
        "totalCount": 2
      };

      clientCallGet() => client.get(any(),
          params: any(named: 'params', that: isMap), cache: false);

      when(clientCallGet).thenAnswer((_) => Future.value(responseBody));

      final response = await userApiRepository.fetchAlbums(
          userID, const UserAlbumsListParams(query: 'Supercell'));

      final expected = [
        AlbumCollection(
          rating: 5,
          mediaType: 'Other',
          purchaseStatus: 'Wishlisted',
          album: Album(
            id: 1,
            name: 'Album_A',
          ),
        ),
        AlbumCollection(
          rating: 4,
          mediaType: 'DigitalDownload',
          purchaseStatus: 'Owned',
          album: Album(
            id: 2,
            name: 'Album_B',
          ),
        ),
      ];

      expect(response, expected);

      // Capture arguments
      final captured = verify(() => client.get(captureAny(),
          params: captureAny(named: 'params'), cache: false)).captured;

      expect(captured[0], '/api/users/$userID/albums');

      expect(captured[1], {
        'query': 'Supercell',
        'start': 0,
        'maxResults': 10,
        'albumTypes': 'Unknown',
        'sort': 'Name',
        'fields': 'MainPicture',
        'lang': 'Default',
        'nameMatchMode': 'Auto',
        'purchaseStatuses': 'All'
      });
    });
  });
}
