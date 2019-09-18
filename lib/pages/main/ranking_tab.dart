import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/result.dart';

class RankingTab extends StatefulWidget {
  @override
  _RankingTabState createState() => _RankingTabState();
}

class _RankingTabState extends State<RankingTab>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: "Daily"),
    Tab(text: "Weekly"),
    Tab(text: "Monthly"),
    Tab(text: "Overall")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: myTabs.length, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: TabBar(controller: _tabController, tabs: myTabs),
            body: TabBarView(
              controller: _tabController,
              children: [
                RankingContent(rankDuration: RankDuration.DAILY),
                RankingContent(rankDuration: RankDuration.WEEKLY),
                RankingContent(rankDuration: RankDuration.MONTHLY),
                RankingContent(rankDuration: RankDuration.OVERALL),
              ],
            )));
  }
}

class RankingContent extends StatelessWidget {
  final int rankDuration;

  const RankingContent({Key key, this.rankDuration}) : super(key: key);

  buildHasData(List<SongModel> songs) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return RankingTile.fromSong((index + 1).toString(), songs[index]);
      },
    );
  }

  buildError(Object error) {
    return Center(
      child: Result.error('Something wrong!', subtitle: error.toString()),
    );
  }

  buildDefault() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
      future: WebService().load(SongModel.topRated(rankDuration)),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return buildHasData(snapshot.data);
        else if (snapshot.hasError) {
          return buildError(snapshot.error);
        }
        return buildDefault();
      },
    );
  }
}

class RankingTile extends StatelessWidget {
  final int id;
  final String rankNumber;
  final String name;
  final String artist;
  final String thumbUrl;

  const RankingTile(
      {Key key,
      this.rankNumber,
      this.id,
      this.name,
      this.artist,
      this.thumbUrl})
      : super(key: key);

  RankingTile.fromSong(this.rankNumber, SongModel song)
      : this.id = song.id,
        this.name = song.name,
        this.artist = song.artistString,
        this.thumbUrl = song.thumbUrl;

  Widget rankNumberWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(this.rankNumber),
    );
  }

  Widget thumbnailWidget() {
    Widget thumbnail = (this.thumbUrl != null && this.thumbUrl.isNotEmpty)
        ? CachedNetworkImage(
            imageUrl: this.thumbUrl,
            placeholder: (context, url) => Container(color: Colors.grey),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          )
        : Placeholder();

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 120,
          child: thumbnail,
        ));
  }

  Widget infoWidget(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(this.name, overflow: TextOverflow.ellipsis),
            Text(this.artist,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.caption),
          ],
        ),
      ),
    );
  }

  Widget trailing() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SongDetailPage(
                    this.id, this.name, this.thumbUrl,
                    tag: 'ranking_${id}')));
      },
      child: Container(
        height: 100,
        child: Row(
          children: <Widget>[
            rankNumberWidget(),
            thumbnailWidget(),
            infoWidget(context),
          ],
        ),
      ),
    );
  }
}

const mockRanking = [
  {
    "artistString": "GHOST feat. DEX",
    "createDate": "2019-08-19T01:57:22.983",
    "defaultName": "Honey I'm Home",
    "defaultNameLanguage": "English",
    "favoritedTimes": 7,
    "id": 250379,
    "lengthSeconds": 222,
    "name": "Honey I'm Home",
    "publishDate": "2019-08-18T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube, SoundCloud, Bandcamp",
    "ratingScore": 41,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/xHffjNbWmig/default.jpg",
    "version": 6
  },
  {
    "artistString": "kz feat. 初音ミク",
    "createDate": "2019-08-29T16:11:26.25",
    "defaultName": "Catch the Wave",
    "defaultNameLanguage": "English",
    "favoritedTimes": 7,
    "id": 251481,
    "lengthSeconds": 206,
    "name": "Catch the Wave",
    "publishDate": "2019-08-29T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 57,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35597753/35597753.84462410",
    "version": 5
  },
  {
    "artistString": "Mitchie M feat. 初音ミク, 鏡音リン",
    "createDate": "2019-08-27T12:58:23.187",
    "defaultName": "リングの熾天使",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 4,
    "id": 251400,
    "lengthSeconds": 229,
    "name": "リングの熾天使",
    "publishDate": "2019-08-29T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube, SoundCloud, Bilibili",
    "ratingScore": 36,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/lWuJRRCTHrg/default.jpg",
    "version": 12
  },
  {
    "artistString": "きくお feat. 初音ミク",
    "createDate": "2019-08-14T14:44:40.217",
    "defaultName": "バツ猫",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 7,
    "id": 249416,
    "lengthSeconds": 209,
    "name": "バツ猫",
    "publishDate": "2019-08-14T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 39,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35536936/35536936.20848215",
    "version": 4
  },
  {
    "artistString": "GYARI feat. 琴葉葵, 琴葉茜",
    "createDate": "2019-08-09T14:53:05.68",
    "defaultName": "絶対にチョコミントを食べるアオイチャン",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 7,
    "id": 248895,
    "lengthSeconds": 356,
    "name": "絶対にチョコミントを食べるアオイチャン",
    "publishDate": "2019-08-09T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 37,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35512935/35512935.90033100",
    "version": 5
  },
  {
    "artistString": "MARETU feat. 初音ミク",
    "createDate": "2019-08-24T14:40:12.373",
    "defaultName": "ゴキブリの味",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 6,
    "id": 251219,
    "lengthSeconds": 270,
    "name": "ゴキブリの味",
    "publishDate": "2019-08-24T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 30,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/Hmc41Zsb2Ns/default.jpg",
    "version": 4
  },
  {
    "artistString": "Mwk feat. 初音ミク",
    "createDate": "2019-08-23T14:00:20.527",
    "defaultName": "Gemini",
    "defaultNameLanguage": "English",
    "favoritedTimes": 5,
    "id": 251083,
    "lengthSeconds": 230,
    "name": "Gemini",
    "originalVersionId": 178654,
    "publishDate": "2019-08-23T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 31,
    "songType": "Remix",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/wL9esnI0CAs/default.jpg",
    "version": 2
  },
  {
    "artistString": "Clean Tears feat. 初音ミク",
    "createDate": "2019-09-01T21:32:34.373",
    "defaultName": "Lily",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 3,
    "id": 251849,
    "lengthSeconds": 216,
    "name": "Lily",
    "publishDate": "2019-09-02T00:00:00Z",
    "pvServices": "Piapro",
    "ratingScore": 31,
    "songType": "Original",
    "status": "Finished",
    "version": 4
  },
  {
    "artistString": "かいりきベア, MARETU feat. 初音ミク",
    "createDate": "2019-08-09T13:10:51.797",
    "defaultName": "失敗作少女",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 4,
    "id": 248858,
    "lengthSeconds": 190,
    "name": "失敗作少女",
    "originalVersionId": 79675,
    "publishDate": "2019-08-09T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 24,
    "songType": "Remix",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/TXfJVNqaHiM/default.jpg",
    "version": 4
  },
  {
    "artistString": "r-906 feat. 初音ミク",
    "createDate": "2019-08-17T16:35:33.9",
    "defaultName": "パノプティコン",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 5,
    "id": 249746,
    "lengthSeconds": 255,
    "name": "パノプティコン",
    "publishDate": "2019-08-17T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 25,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35553134/35553134.6969675",
    "version": 4
  },
  {
    "artistString": "八王子P feat. 初音ミク",
    "createDate": "2019-07-19T22:56:06.597",
    "defaultName": "イロドリミライ",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 3,
    "id": 246038,
    "lengthSeconds": 212,
    "name": "イロドリミライ",
    "publishDate": "2019-08-28T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 21,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/fBmgYsw-NB0/default.jpg",
    "version": 6
  },
  {
    "artistString": "みきとP feat. 初音ミク",
    "createDate": "2019-09-02T12:52:33.683",
    "defaultName": "Butter-Fly～初音ミクVersion～",
    "defaultNameLanguage": "English",
    "favoritedTimes": 5,
    "id": 251979,
    "lengthSeconds": 244,
    "name": "Butter-Fly～初音ミクVersion～",
    "originalVersionId": 251983,
    "publishDate": "2019-09-02T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 23,
    "songType": "Cover",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/4MgXOeZWu2U/default.jpg",
    "version": 7
  },
  {
    "artistString": "Aura Qualic feat. 初音ミク",
    "createDate": "2019-08-30T18:22:40.497",
    "defaultName": "Summer Memories",
    "defaultNameLanguage": "English",
    "favoritedTimes": 4,
    "id": 251564,
    "lengthSeconds": 219,
    "name": "Summer Memories",
    "publishDate": "2019-08-31T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 24,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35614770/35614770.34440037",
    "version": 2
  },
  {
    "artistString": "ATOLS feat. 初音ミク",
    "createDate": "2019-08-30T13:41:03.807",
    "defaultName": "フクロウ",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 3,
    "id": 251529,
    "lengthSeconds": 254,
    "name": "フクロウ",
    "publishDate": "2019-08-30T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 23,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35612187/35612187.83948817",
    "version": 7
  },
  {
    "artistString": "natural feat. 初音ミク, 重音テト",
    "createDate": "2019-09-03T18:14:33.313",
    "defaultName": "Vertical",
    "defaultNameLanguage": "English",
    "favoritedTimes": 4,
    "id": 252079,
    "lengthSeconds": 217,
    "name": "Vertical",
    "publishDate": "2019-09-03T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 24,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/hTiN3qstBzI/default.jpg",
    "version": 3
  },
  {
    "artistString": "ミスミ feat. 初音ミク",
    "createDate": "2019-08-16T15:59:37.103",
    "defaultName": "オルターエゴ",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 3,
    "id": 249605,
    "lengthSeconds": 224,
    "name": "オルターエゴ",
    "publishDate": "2019-08-16T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube, Bilibili",
    "ratingScore": 21,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/DlIREQyaxu8/default.jpg",
    "version": 4
  },
  {
    "artistString": "書店 feat. 巡音ルカ, 巡音ルカ V4X English (Straight)",
    "createDate": "2019-08-28T16:46:13.37",
    "defaultName": "OVER DOZER",
    "defaultNameLanguage": "English",
    "favoritedTimes": 2,
    "id": 251456,
    "lengthSeconds": 221,
    "name": "OVER DOZER",
    "publishDate": "2019-08-28T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 20,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35604623/35604623.55483",
    "version": 3
  },
  {
    "artistString": "emon feat. 初音ミク, 鏡音リン, 鏡音レン",
    "createDate": "2019-08-30T13:46:28.473",
    "defaultName": "トロピカルナイトVol.2",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 1,
    "id": 251536,
    "lengthSeconds": 203,
    "name": "トロピカルナイトVol.2",
    "publishDate": "2019-08-30T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 21,
    "songType": "Cover",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35610357/35610357.91238674",
    "version": 3
  },
  {
    "artistString": "*Luna, びび feat. 音街ウナ (Unknown), Rana",
    "createDate": "2019-08-16T17:47:09.503",
    "defaultName": "あの夏のいつかは",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 4,
    "id": 249621,
    "lengthSeconds": 253,
    "name": "あの夏のいつかは",
    "originalVersionId": 248234,
    "publishDate": "2019-08-16T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 18,
    "songType": "Cover",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35548406/35548406.4875599",
    "version": 5
  },
  {
    "artistString": "Osanzi feat. 初音ミク",
    "createDate": "2019-08-11T12:24:16.84",
    "defaultName": "World is...",
    "defaultNameLanguage": "English",
    "favoritedTimes": 2,
    "id": 249075,
    "lengthSeconds": 194,
    "name": "World is...",
    "publishDate": "2019-08-11T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube, SoundCloud",
    "ratingScore": 18,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35523239/35523239.56967855",
    "version": 5
  },
  {
    "artistString": "柊キライ feat. v flower",
    "createDate": "2019-08-19T13:46:28.233",
    "defaultName": "オートファジー",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 4,
    "id": 250551,
    "lengthSeconds": 217,
    "name": "オートファジー",
    "publishDate": "2019-08-19T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 18,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35562199/35562199.16670628",
    "version": 2
  },
  {
    "artistString": "Moni feat. 初音ミク",
    "createDate": "2019-08-30T14:22:12.253",
    "defaultName": "祭夏 -SAIKA-",
    "defaultNameLanguage": "Japanese",
    "favoritedTimes": 4,
    "id": 251542,
    "lengthSeconds": 186,
    "name": "祭夏 -SAIKA-",
    "publishDate": "2019-08-30T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube",
    "ratingScore": 20,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35609903/35609903.89851133",
    "version": 3
  },
  {
    "artistString": "mokyurin, ワカバ feat. 初音ミク",
    "createDate": "2019-08-24T23:01:29.24",
    "defaultName": "Rain",
    "defaultNameLanguage": "English",
    "favoritedTimes": 5,
    "id": 251248,
    "lengthSeconds": 513,
    "name": "Rain",
    "publishDate": "2019-08-25T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube, SoundCloud, Piapro",
    "ratingScore": 19,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl":
        "http://nicovideo.cdn.nimg.jp/thumbnails/35587635/35587635.81778278",
    "version": 3
  },
  {
    "artistString": "cillia feat. V3 GUMI (English)",
    "createDate": "2019-08-15T08:05:50.587",
    "defaultName": "Machine Gun (cillia remix)",
    "defaultNameLanguage": "English",
    "favoritedTimes": 2,
    "id": 249468,
    "lengthSeconds": 171,
    "name": "Machine Gun (cillia remix)",
    "originalVersionId": 204384,
    "publishDate": "2019-08-15T00:00:00Z",
    "pvServices": "NicoNicoDouga, Youtube, Bilibili",
    "ratingScore": 16,
    "songType": "Remix",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/4-mXZeudR48/default.jpg",
    "version": 5
  },
  {
    "artistString": "emon feat. 初音ミク V4 (English)",
    "createDate": "2019-08-23T19:31:41.14",
    "defaultName": "ShiTsuDo",
    "defaultNameLanguage": "English",
    "favoritedTimes": 2,
    "id": 251105,
    "lengthSeconds": 201,
    "name": "ShiTsuDo",
    "publishDate": "2019-08-23T00:00:00Z",
    "pvServices": "Youtube",
    "ratingScore": 18,
    "songType": "Original",
    "status": "Finished",
    "thumbUrl": "https://i.ytimg.com/vi/Hf_WcLaUSw4/default.jpg",
    "version": 2
  }
];
