import 'package:flutter/material.dart';
import 'package:vocadb/widgets/entry_tile.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _searching = false;

  List<Widget> _recentlyListItems;

  List<Widget> _resultListItems;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _recentlyListItems = [Headline("Recently")];
    _recentlyListItems.addAll(mockRecentlyList.map((Map<String, dynamic> item) {
      return EntryTile(item);
    }).toList());

    _resultListItems = [];
    _resultListItems.addAll(mockEntries.map((Map<String, dynamic> item) {
      return EntryTile(item);
    }).toList());
  }

  void onSearching(String text) {
    setState(() {
      _searching = (text.isEmpty) ? false : true;
    });
  }

  void onClearSearch() {
    _controller.clear();
    setState(() {
      _searching = false;
    });
  }

  ListView buildRecentlyListView() {
    return ListView.builder(
      itemCount: _recentlyListItems.length,
      itemBuilder: (BuildContext context, int index) {
        return _recentlyListItems[index];
      },
    );
  }

  ListView buildResultListView() {
    return ListView.builder(
      itemCount: _resultListItems.length,
      itemBuilder: (BuildContext context, int index) {
        return _resultListItems[index];
      },
    );
  }

  AppBar buildSearchBar(BuildContext context) {
    return AppBar(
      title: new TextField(
        autofocus: true,
        controller: _controller,
        style: Theme.of(context).primaryTextTheme.title,
        onChanged: onSearching,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: onClearSearch,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: buildSearchBar(context),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 22.0),
            children: [
              SpeedDialChild(
                child: Icon(Icons.music_note),
                backgroundColor: Colors.white,
                onTap: () => print('Song'),
              ),
              SpeedDialChild(
                child: Icon(Icons.person),
                backgroundColor: Colors.white,
                onTap: () => print('Artist'),
              ),
              SpeedDialChild(
                child: Icon(Icons.person),
                backgroundColor: Colors.white,
                onTap: () => print('Album'),
              ),
              SpeedDialChild(
                  child: Icon(Icons.close),
                  backgroundColor: Colors.white,
                  onTap: () => print('All')
              ),
            ],
          ),
          body: (_searching) ? buildResultListView() : buildRecentlyListView()),
    );
  }
}

class Headline extends StatelessWidget {
  final String text;

  const Headline(String text) : this.text = text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(this.text, style: Theme.of(context).textTheme.headline),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
    );
  }
}

class RecentlySearchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return EntryTile(mockRecentlyList[index]);
      }, childCount: mockRecentlyList.length),
    );
  }
}

class ResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return EntryTile(mockEntries[index]);
      }, childCount: mockEntries.length),
    );
  }
}

const mockRecentlyList = [
  {
    "activityDate": "2019-05-24T00:00:00Z",
    "artistString": "hakaru feat. 鏡音レン",
    "createDate": "2019-09-05T10:27:18.707",
    "defaultName": "あわよくばきみの眷属になりたいな (Swing Arrange ver.)",
    "defaultNameLanguage": "Japanese",
    "entryType": "Song",
    "id": 252188,
    "mainPicture": {
      "urlSmallThumb": "https://i.ytimg.com/vi/Zu4-AhYWosQ/default.jpg",
      "urlThumb": "https://i.ytimg.com/vi/Zu4-AhYWosQ/default.jpg",
      "urlTinyThumb": "https://i.ytimg.com/vi/Zu4-AhYWosQ/default.jpg"
    },
    "name": "あわよくばきみの眷属になりたいな (Swing Arrange ver.)",
    "songType": "Cover",
    "status": "Finished",
    "version": 3
  },
  {
    "activityDate": "2019-08-30T00:00:00",
    "artistString": "ライブP",
    "createDate": "2019-09-04T23:33:05.7",
    "defaultName": "The Yellow Card Vol. 3",
    "defaultNameLanguage": "Japanese",
    "discType": "Other",
    "entryType": "Album",
    "id": 27195,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/album/mainSmall/27195.jpg?v=3",
      "urlThumb": "https://static.vocadb.net/img/album/mainThumb/27195.jpg?v=3",
      "urlTinyThumb":
          "https://static.vocadb.net/img/album/mainTiny/27195.jpg?v=3"
    },
    "name": "The Yellow Card Vol. 3",
    "status": "Draft",
    "version": 3
  },
  {
    "artistString": "ライブP",
    "createDate": "2019-09-04T23:28:06.407",
    "defaultName": "The Yellow Card Vol. 2",
    "defaultNameLanguage": "Japanese",
    "discType": "Other",
    "entryType": "Album",
    "id": 27194,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/album/mainSmall/27194.jpg?v=2",
      "urlThumb": "https://static.vocadb.net/img/album/mainThumb/27194.jpg?v=2",
      "urlTinyThumb":
          "https://static.vocadb.net/img/album/mainTiny/27194.jpg?v=2"
    },
    "name": "The Yellow Card Vol. 2",
    "status": "Draft",
    "version": 2
  },
  {
    "activityDate": "2017-09-02T00:00:00",
    "artistString": "ライブP",
    "createDate": "2019-09-04T23:13:20.007",
    "defaultName": "The Yellow Card Vol. 1",
    "defaultNameLanguage": "Japanese",
    "discType": "Other",
    "entryType": "Album",
    "id": 27193,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/album/mainSmall/27193.jpg?v=4",
      "urlThumb": "https://static.vocadb.net/img/album/mainThumb/27193.jpg?v=4",
      "urlTinyThumb":
          "https://static.vocadb.net/img/album/mainTiny/27193.jpg?v=4"
    },
    "name": "The Yellow Card Vol. 1",
    "status": "Draft",
    "version": 4
  },
  {
    "activityDate": "2019-08-12T00:00:00",
    "artistString": "西沢さんP, 友達募集P feat. various",
    "createDate": "2019-09-04T23:08:10.28",
    "defaultName": "キッチン五ツ星",
    "defaultNameLanguage": "Japanese",
    "discType": "Album",
    "entryType": "Album",
    "id": 27192,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/album/mainSmall/27192.jpg?v=4",
      "urlThumb": "https://static.vocadb.net/img/album/mainThumb/27192.jpg?v=4",
      "urlTinyThumb":
          "https://static.vocadb.net/img/album/mainTiny/27192.jpg?v=4"
    },
    "name": "キッチン五ツ星",
    "status": "Draft",
    "version": 4
  },
  {
    "activityDate": "2018-12-30T00:00:00",
    "artistString":
        "SCARLET., WILD CAT RECORD feat. 巡音ルカ V4X English (Straight)",
    "createDate": "2019-09-04T12:09:43.783",
    "defaultName": "Flowering in the dark",
    "defaultNameLanguage": "English",
    "discType": "Single",
    "entryType": "Album",
    "id": 27190,
    "mainPicture": {
      "mime": "image/png",
      "urlSmallThumb":
          "https://static.vocadb.net/img/album/mainSmall/27190.png?v=3",
      "urlThumb": "https://static.vocadb.net/img/album/mainThumb/27190.png?v=3",
      "urlTinyThumb":
          "https://static.vocadb.net/img/album/mainTiny/27190.png?v=3"
    },
    "name": "Flowering in the dark",
    "status": "Finished",
    "version": 3
  },
  {
    "activityDate": "2019-09-03T00:00:00",
    "artistString":
        "ArtDavidAlternativeMusic feat. KAITO V3 (English), MEIKO V3 (English)",
    "createDate": "2019-09-03T13:01:49.163",
    "defaultName": "Love My Movie",
    "defaultNameLanguage": "English",
    "discType": "Single",
    "entryType": "Album",
    "id": 27189,
    "mainPicture": {
      "mime": "image/png",
      "urlSmallThumb":
          "https://static.vocadb.net/img/album/mainSmall/27189.png?v=2",
      "urlThumb": "https://static.vocadb.net/img/album/mainThumb/27189.png?v=2",
      "urlTinyThumb":
          "https://static.vocadb.net/img/album/mainTiny/27189.png?v=2"
    },
    "name": "Love My Movie",
    "status": "Finished",
    "version": 2
  },
  {
    "artistString": "Baker CarterG feat. 初音ミク V4 (English)",
    "createDate": "2019-09-03T00:09:52.807",
    "defaultName": "NEET~Night!!!",
    "defaultNameLanguage": "English",
    "discType": "Single",
    "entryType": "Album",
    "id": 27188,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/album/mainSmall/27188.jpg?v=2",
      "urlThumb": "https://static.vocadb.net/img/album/mainThumb/27188.jpg?v=2",
      "urlTinyThumb":
          "https://static.vocadb.net/img/album/mainTiny/27188.jpg?v=2"
    },
    "name": "NEET~Night!!!",
    "status": "Finished",
    "version": 2
  },
  {
    "activityDate": "2019-07-04T00:00:00Z",
    "createDate": "0001-01-01T00:00:00",
    "defaultName": "Anime Expo 2019",
    "defaultNameLanguage": "Unspecified",
    "entryType": "ReleaseEvent",
    "eventCategory": "Convention",
    "id": 2752,
    "name": "Anime Expo 2019",
    "status": "Draft",
    "urlSlug": "anime-expo-2019",
    "version": 1
  },
  {
    "activityDate": "2019-07-30T00:00:00Z",
    "createDate": "0001-01-01T00:00:00",
    "defaultName":
        "Hatsune Miku x Magatsu Wahrheit Collaboration Music Contest",
    "defaultNameLanguage": "English",
    "entryType": "ReleaseEvent",
    "eventCategory": "Contest",
    "id": 2757,
    "mainPicture": {
      "mime": "image/jpeg",
      "urlSmallThumb":
          "https://static.vocadb.net/img/releaseevent/mainSmall/2757.jpg?v=4",
      "urlThumb":
          "https://static.vocadb.net/img/releaseevent/mainOrig/2757.jpg?v=4",
      "urlTinyThumb":
          "https://static.vocadb.net/img/releaseevent/mainTiny/2757.jpg?v=4"
    },
    "name": "Hatsune Miku x Magatsu Wahrheit Collaboration Music Contest",
    "status": "Finished",
    "urlSlug": "hatsune-miku-x-magatsu-wahrhei",
    "version": 4
  }
];

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
];
