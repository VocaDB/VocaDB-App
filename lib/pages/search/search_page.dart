import 'package:flutter/material.dart';
import 'package:vocadb/widgets/entry_tile.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              backgroundColor: Colors.grey.shade700,
              elevation: 0.0,
              pinned: true,
              floating: false,
              title: new TextField(
                style: Theme.of(context).primaryTextTheme.title,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return EntryTile(mockEntries[index]);
              }, childCount: mockEntries.length),
            )
          ],
        ),
      ),
    );
  }
}

const mockEntries = [
  {
    "activityDate": "2015-12-21T00:00:00",
    "artistString": "Various artists",
    "createDate": "2016-01-01T10:41:24",
    "defaultName":
        "[TREKKIE TRAX × Phalanx] Hatsune Miku Dreams of Electric Sheep EP Remixes",
    "defaultNameLanguage": "Unspecified",
    "discType": "EP",
    "entryType": "Album",
    "id": 16568,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/album/mainSmall/16568.jpg?v=6",
      "urlThumb": "https://static.vocadb.net/img/album/mainThumb/16568.jpg?v=6",
      "urlTinyThumb":
          "https://static.vocadb.net/img/album/mainTiny/16568.jpg?v=6"
    },
    "name":
        "[TREKKIE TRAX × Phalanx] Hatsune Miku Dreams of Electric Sheep EP Remixes",
    "status": "Finished",
    "version": 6
  },
  {
    "activityDate": "2010-06-17T00:00:00Z",
    "artistString": "voltex feat. 初音ミク",
    "createDate": "2018-12-10T03:21:23.717",
    "defaultName": "～miku",
    "defaultNameLanguage": "Romaji",
    "entryType": "Song",
    "id": 217590,
    "mainPicture": {
      "urlSmallThumb": "https://tn.smilevideo.jp/smile?i=11094717",
      "urlThumb": "https://tn.smilevideo.jp/smile?i=11094717",
      "urlTinyThumb": "https://tn.smilevideo.jp/smile?i=11094717"
    },
    "name": "～miku",
    "songType": "Original",
    "status": "Finished",
    "version": 2
  },
  {
    "activityDate": "2018-07-19T00:00:00Z",
    "artistString": "Ankari, Maubox feat. various",
    "createDate": "2018-07-27T00:15:09.947",
    "defaultName": "¿Dónde está Miku?",
    "defaultNameLanguage": "Japanese",
    "entryType": "Song",
    "id": 198664,
    "mainPicture": {
      "urlSmallThumb": "https://i.ytimg.com/vi/35FxNdw2Ldc/default.jpg",
      "urlThumb": "https://i.ytimg.com/vi/35FxNdw2Ldc/default.jpg",
      "urlTinyThumb": "https://i.ytimg.com/vi/35FxNdw2Ldc/default.jpg"
    },
    "name": "¿Dónde está Miku?",
    "songType": "Original",
    "status": "Finished",
    "version": 5
  },
  {
    "artistType": "Illustrator",
    "createDate": "2017-10-08T09:45:09",
    "defaultName": "miku",
    "defaultNameLanguage": "Japanese",
    "entryType": "Artist",
    "id": 61432,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/artist/mainSmall/61432.jpg?v=3",
      "urlThumb":
          "https://static.vocadb.net/img/artist/mainThumb/61432.jpg?v=3",
      "urlTinyThumb":
          "https://static.vocadb.net/img/artist/mainTiny/61432.jpg?v=3"
    },
    "name": "miku",
    "status": "Finished",
    "version": 3
  },
  {
    "artistType": "Illustrator",
    "createDate": "2018-12-19T22:00:34.36",
    "defaultName": "miku_ning",
    "defaultNameLanguage": "Japanese",
    "entryType": "Artist",
    "id": 70095,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/artist/mainSmall/70095.jpg?v=2",
      "urlThumb":
          "https://static.vocadb.net/img/artist/mainThumb/70095.jpg?v=2",
      "urlTinyThumb":
          "https://static.vocadb.net/img/artist/mainTiny/70095.jpg?v=2"
    },
    "name": "miku_ning",
    "status": "Finished",
    "version": 2
  },
  {
    "activityDate": "2019-05-11T00:00:00Z",
    "createDate": "0001-01-01T00:00:00",
    "defaultName": "Miku Expo 2019 New Taipei City",
    "defaultNameLanguage": "English",
    "entryType": "ReleaseEvent",
    "eventCategory": "Concert",
    "id": 2489,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/releaseevent/mainSmall/2489.jpg?v=3",
      "urlThumb":
          "https://static.vocadb.net/img/releaseevent/mainOrig/2489.jpg?v=3",
      "urlTinyThumb":
          "https://static.vocadb.net/img/releaseevent/mainTiny/2489.jpg?v=3"
    },
    "name": "Miku Expo 2019 New Taipei City",
    "status": "Finished",
    "releaseEventSeriesName": "Miku Expo",
    "urlSlug": "miku-expo-2019-new-taipei-city",
    "version": 3
  },
  {
    "activityDate": "2015-12-21T00:00:00",
    "artistString": "Various artists",
    "createDate": "2016-01-01T10:41:24",
    "defaultName":
        "[TREKKIE TRAX × Phalanx] Hatsune Miku Dreams of Electric Sheep EP Remixes",
    "defaultNameLanguage": "Unspecified",
    "discType": "EP",
    "entryType": "Album",
    "id": 16568,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/album/mainSmall/16568.jpg?v=6",
      "urlThumb": "https://static.vocadb.net/img/album/mainThumb/16568.jpg?v=6",
      "urlTinyThumb":
          "https://static.vocadb.net/img/album/mainTiny/16568.jpg?v=6"
    },
    "name":
        "[TREKKIE TRAX × Phalanx] Hatsune Miku Dreams of Electric Sheep EP Remixes",
    "status": "Finished",
    "version": 6
  },
  {
    "activityDate": "2010-06-17T00:00:00Z",
    "artistString": "voltex feat. 初音ミク",
    "createDate": "2018-12-10T03:21:23.717",
    "defaultName": "～miku",
    "defaultNameLanguage": "Romaji",
    "entryType": "Song",
    "id": 217590,
    "mainPicture": {
      "urlSmallThumb": "https://tn.smilevideo.jp/smile?i=11094717",
      "urlThumb": "https://tn.smilevideo.jp/smile?i=11094717",
      "urlTinyThumb": "https://tn.smilevideo.jp/smile?i=11094717"
    },
    "name": "～miku",
    "songType": "Original",
    "status": "Finished",
    "version": 2
  },
  {
    "activityDate": "2018-07-19T00:00:00Z",
    "artistString": "Ankari, Maubox feat. various",
    "createDate": "2018-07-27T00:15:09.947",
    "defaultName": "¿Dónde está Miku?",
    "defaultNameLanguage": "Japanese",
    "entryType": "Song",
    "id": 198664,
    "mainPicture": {
      "urlSmallThumb": "https://i.ytimg.com/vi/35FxNdw2Ldc/default.jpg",
      "urlThumb": "https://i.ytimg.com/vi/35FxNdw2Ldc/default.jpg",
      "urlTinyThumb": "https://i.ytimg.com/vi/35FxNdw2Ldc/default.jpg"
    },
    "name": "¿Dónde está Miku?",
    "songType": "Original",
    "status": "Finished",
    "version": 5
  },
  {
    "artistType": "Illustrator",
    "createDate": "2017-10-08T09:45:09",
    "defaultName": "miku",
    "defaultNameLanguage": "Japanese",
    "entryType": "Artist",
    "id": 61432,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/artist/mainSmall/61432.jpg?v=3",
      "urlThumb":
          "https://static.vocadb.net/img/artist/mainThumb/61432.jpg?v=3",
      "urlTinyThumb":
          "https://static.vocadb.net/img/artist/mainTiny/61432.jpg?v=3"
    },
    "name": "miku",
    "status": "Finished",
    "version": 3
  },
  {
    "artistType": "Illustrator",
    "createDate": "2018-12-19T22:00:34.36",
    "defaultName": "miku_ning",
    "defaultNameLanguage": "Japanese",
    "entryType": "Artist",
    "id": 70095,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/artist/mainSmall/70095.jpg?v=2",
      "urlThumb":
          "https://static.vocadb.net/img/artist/mainThumb/70095.jpg?v=2",
      "urlTinyThumb":
          "https://static.vocadb.net/img/artist/mainTiny/70095.jpg?v=2"
    },
    "name": "miku_ning",
    "status": "Finished",
    "version": 2
  },
  {
    "activityDate": "2019-05-11T00:00:00Z",
    "createDate": "0001-01-01T00:00:00",
    "defaultName": "Miku Expo 2019 New Taipei City",
    "defaultNameLanguage": "English",
    "entryType": "ReleaseEvent",
    "eventCategory": "Concert",
    "id": 2489,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/releaseevent/mainSmall/2489.jpg?v=3",
      "urlThumb":
          "https://static.vocadb.net/img/releaseevent/mainOrig/2489.jpg?v=3",
      "urlTinyThumb":
          "https://static.vocadb.net/img/releaseevent/mainTiny/2489.jpg?v=3"
    },
    "name": "Miku Expo 2019 New Taipei City",
    "status": "Finished",
    "releaseEventSeriesName": "Miku Expo",
    "urlSlug": "miku-expo-2019-new-taipei-city",
    "version": 3
  },
];
