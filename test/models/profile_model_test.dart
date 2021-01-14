import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/models.dart';

main() {
  final mockJson = {
    "followedArtists": [
      {
        "id": 1,
        "name": "初音ミク",
        "mainPicture": {
          "mime": "image/png",
          "urlSmallThumb":
              "https://static.vocadb.net/img/artist/mainSmall/1.png?v=23",
          "urlThumb":
              "https://static.vocadb.net/img/artist/mainThumb/1.png?v=23",
          "urlTinyThumb":
              "https://static.vocadb.net/img/artist/mainTiny/1.png?v=23"
        },
      },
      {
        "id": 89,
        "name": "kz",
        "mainPicture": {
          "mime": "image/jpeg",
          "urlSmallThumb":
              "https://static.vocadb.net/img/artist/mainSmall/89.jpg?v=22",
          "urlThumb":
              "https://static.vocadb.net/img/artist/mainThumb/89.jpg?v=22",
          "urlTinyThumb":
              "https://static.vocadb.net/img/artist/mainTiny/89.jpg?v=22"
        },
      }
    ],
    "favoriteAlbums": [
      {
        "id": 1008,
        "name": "Tell Your World EP",
        "mainPicture": {
          "mime": "image/jpeg",
          "urlSmallThumb":
              "https://static.vocadb.net/img/album/mainSmall/1008.jpg?v=20",
          "urlThumb":
              "https://static.vocadb.net/img/album/mainThumb/1008.jpg?v=20",
          "urlTinyThumb":
              "https://static.vocadb.net/img/album/mainTiny/1008.jpg?v=20"
        }
      }
    ],
    "favoriteSongs": [
      {
        "id": 8395,
        "name": "Tell Your World",
        "artistString": "kz feat. 初音ミク",
        "songType": "Original",
        "pvServices": "Youtube, SoundCloud",
        "mainPicture": {
          "urlThumb": "https://i.ytimg.com/vi/PqJNc9KVIZE/default.jpg"
        },
        "thumbUrl": "https://i.ytimg.com/vi/PqJNc9KVIZE/default.jpg",
      },
      {
        "id": 1501,
        "name": "ローリンガール",
        "artistString": "wowaka feat. 初音ミク",
        "songType": "Original",
        "pvServices": "NicoNicoDouga, Youtube, SoundCloud",
        "mainPicture": {
          "urlThumb": "http://nicovideo.cdn.nimg.jp/thumbnails/9714351/9714351"
        },
        "thumbUrl": "http://nicovideo.cdn.nimg.jp/thumbnails/9714351/9714351",
        "createDate": "2011-11-01T22:10:01",
        "publishDate": "2010-02-14T00:00:00Z"
      }
    ],
    "settings": {
      "displayLanguage": "Default",
      "uiLanguage": "Default",
      "defaultPVService": "Default"
    }
  };

  test('should parse json correctly', () {
    ProfileModel profileModel = ProfileModel.fromJson(mockJson);

    expect(profileModel.favoriteSongs, isNotNull);
    expect(profileModel.favoriteSongs.length, 2);
    expect(profileModel.followedArtists, isNotNull);
    expect(profileModel.followedArtists.length, 2);
    expect(profileModel.favoriteAlbums, isNotNull);
    expect(profileModel.favoriteAlbums.length, 1);
  });

  test('should return json correctly', () {
    ProfileModel profileModel = ProfileModel.fromJson(mockJson);

    Map<String, dynamic> jsonResult = profileModel.toJson();

    expect(jsonResult, isNotNull);
    expect(jsonResult.containsKey('favoriteSongs'), isTrue);
    expect(jsonResult.containsKey('followedArtists'), isTrue);
    expect(jsonResult.containsKey('favoriteAlbums'), isTrue);
  });
}
