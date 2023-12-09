import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_link.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_relations.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

void main() {
  group('artist', () {
    test('parse json with all data', () {
      const raw = '''
      {
        "id": 1,
        "name": "a_name",
        "additionalNames": "add_name",
        "releaseDate": "2007-08-31T00:00:00Z",
        "artistType": "Vocaloid",
        "description": "desc",
        "mainPicture": {
          "urlOriginal": "url_ori"
        },
        "relations":    {
          "latestSongs": [
            {
              "id": 1
            }
          ],
          "popularSongs": [
            {
              "id": 2
            }
          ],
          "latestAlbums": [
            {
              "id": 3
            }
          ],
          "popularAlbums": [
            {
              "id": 4
            }
          ]
        },
        "baseVoicebank": {
          "id": 5
        },
        "tags": [
          {
            "count": 10,
            "tag": {
              "id": 1
            }
          }
        ],
        "webLinks": [
          {
            "id": 1
          }
        ],
        "artistLinksReverse": [
          {
            "linkType": "link_1",
            "artist": {
              "id": 6
            }
          }
        ],
        "artistLinks": [
          {
            "linkType": "link_2",
            "artist": {
              "id": 7
            }
          }
        ]
      }
      ''';
      final json = jsonDecode(raw);
      final expected = Artist(
        id: 1,
        name: 'a_name',
        additionalNames: 'add_name',
        releaseDate: '2007-08-31T00:00:00Z',
        artistType: 'Vocaloid',
        description: 'desc',
        mainPicture: MainPicture(urlOriginal: 'url_ori'),
        relations: ArtistRelations(
          latestSongs: [const Song(id: 1)],
          popularSongs: [const Song(id: 2)],
          latestAlbums: [Album(id: 3)],
          popularAlbums: [Album(id: 4)],
        ),
        baseVoicebank: Artist(id: 5),
        tags: [
          TagUsage(tag: Tag(id: 1), count: 10),
        ],
        webLinks: [
          const WebLink(id: 1),
        ],
        artistLinksReverse: [
          ArtistLink(linkType: 'link_1', artist: Artist(id: 6))
        ],
        artistLinks: [ArtistLink(linkType: 'link_2', artist: Artist(id: 7))],
      );

      expect(Artist.fromJson(json), expected);
    });

    test('parse json without required data', () {
      const raw = '''
      {
        "id": 1
      }
      ''';
      final json = jsonDecode(raw);
      final expected = Artist(id: 1);

      expect(Artist.fromJson(json), expected);
    });
  });
}
