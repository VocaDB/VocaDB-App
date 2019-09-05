import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/pv_tile.dart';
import 'package:vocadb/widgets/song_card.dart';
import 'dart:io';
import 'song_detail_content.dart';
import 'package:vocadb/widgets/action_bar.dart';
import 'package:vocadb/widgets/action_button.dart';
import 'package:vocadb/widgets/addition_info.dart';
import 'package:vocadb/widgets/artist_tile.dart';
import 'package:vocadb/widgets/like_action_button.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/section_divider.dart';
import 'package:vocadb/widgets/share_action_button.dart';
import 'package:vocadb/widgets/source_action_button.dart';
import 'package:vocadb/widgets/tags.dart';
import 'package:vocadb/widgets/web_link.dart';

class SongDetailPage extends StatefulWidget {
  final String thumbUrl;

  final String tag;

  const SongDetailPage({Key key, this.thumbUrl, this.tag}) : super(key: key);

  @override
  _SongDetailPageState createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  WebController webController;

  FlutterNativeWeb flutterWebView;

  List<SongCard> alternateSongList;

  List<SongCard> relatedSongList;

  List<AlbumCard> albumList;

  @override
  void initState() {
    super.initState();
    flutterWebView = new FlutterNativeWeb(
      onWebCreated: onWebCreated,
    );
    alternateSongList = mockSongs
        .map((s) => SongCard(
            key: UniqueKey(),
            title: s['name'],
            artist: s['artistString'],
            thumbUrl: s['thumbUrl']))
        .toList();
    relatedSongList = mockSongs
        .map((s) => SongCard(
            key: UniqueKey(),
            title: s['name'],
            artist: s['artistString'],
            thumbUrl: s['thumbUrl']))
        .toList();
    albumList = mockAlbums
        .map((s) => AlbumCard(
            key: UniqueKey(),
            id: s['id'],
            name: s['name'],
            artist: s['artistString'],
            thumbUrl:
                'https://vocadb.net/Album/CoverPicture/' + s['id'].toString()))
        .toList();
  }

  void onWebCreated(webController) {
    this.webController = webController;

    // Youtube
    String url = 'https://www.youtube.com/embed/PqJNc9KVIZE?playsinline=1';

    // Soundcloud
//    String url = 'https://w.soundcloud.com/player/?url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F634499643&auto_play=false&show_artwork=true&color=ff7700';

    // BB
//    String url = '"https://player.bilibili.com/player.html?aid=52990237&cid=92711286&page=1';

    this.webController.loadUrl(url);

    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  Widget build22(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          new Container(
            key: UniqueKey(),
            child: (Platform.isAndroid)
                ? flutterWebView
                : HeroContent(tag: widget.tag, thumbUrl: widget.thumbUrl),
            height: 200,
            width: double.infinity,
          ),
          Expanded(
            child: SongDetailContent(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  Hero(tag: widget.tag, child: Image.network(widget.thumbUrl)),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                ActionBar(actions: <ActionButton>[
                  LikeActionButton(),
                  ShareActionButton(),
                  SourceActionButton(),
                ]),
                SectionDivider(),
                SongName(name: 'Tell Your World'),
                SongType(songType: 'Original'),
                Tags(),
                AdditionInfo(title: 'Addition names', value: 'Test1'),
                AdditionInfo(title: 'Published', value: '12/03/2012'),
                SectionDivider(),

                // Artist list
                Section(title: 'Artists', children: <Widget>[
                  ArtistTile(
                      id: 89,
                      name: 'kz',
                      type: 'producer',
                      imageUrl: 'https://vocadb.net/Artist/Picture/89'),
                  ArtistTile(
                      id: 1,
                      name: 'Hatsune Miku',
                      type: 'vocalist',
                      imageUrl: 'https://vocadb.net/Artist/Picture/1')
                ]),

                // Divider
                SectionDivider(),

                // PVs
                Section(
                    title: 'PVs',
                    padding: EdgeInsets.only(right: 8.0, left: 8.0),
                    children: <Widget>[
                      PVTile(
                          name:
                              'livetune feat. 初音ミク 『Tell Your World』Music Video'),
                      PVTile(name: 'Google Chrome : Hatsune Miku (初音ミク)'),
                    ]),

                SectionDivider(),

                Section(
                    title: 'Albums (10)',
                    horizontal: true,
                    children: albumList),

                SectionDivider(),

                Section(
                    title: 'Alternate versions (120)',
                    horizontal: true,
                    children: alternateSongList),

                SectionDivider(),

                Section(
                    title: 'Users who liked this also liked',
                    horizontal: true,
                    children: relatedSongList),

                SectionDivider(),

                // Websites
                Section(
                    title: 'Websites',
                    padding: EdgeInsets.all(8.0),
                    children: <Widget>[
                      WebLink(name: 'Spotify'),
                      WebLink(name: 'Spotify (Re:Upload)'),
                      WebLink(name: 'MikuWiki'),
                      WebLink(name: 'MusicBrainz (recoding)'),
                      WebLink(name: 'MusicBrainz (work)'),
                    ]),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class MediaPreview extends StatelessWidget {
  const MediaPreview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.blue,
        child: Text('Image or video'));
  }
}

class HeroContent extends StatelessWidget {
  final String tag;

  final String thumbUrl;

  const HeroContent({Key key, this.tag, this.thumbUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: this.tag,
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
          width: 300,
          height: 150,
          child: Image.network(
            this.thumbUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

const mockSongs = [
  {
    "artistString": "saqwz feat. 初音ミク",
    "id": 9273,
    "name": "Tell Your World (saqwz J-Core Remix)",
    "thumbUrl": "http://tn-skr4.smilevideo.jp/smile?i=16934711",
  },
  {
    "artistString": "PandaBoY feat. 初音ミク",
    "id": 10022,
    "name": "Tell Your World (Panda BoY Remix)",
    "thumbUrl": "https://i.ytimg.com/vi/wNpIlgDjxWc/default.jpg",
  },
  {
    "artistString": "fu_mou feat. 初音ミク",
    "id": 10023,
    "name": "Tell Your World (open the scenery rmx by  fu_mou)",
    "thumbUrl": "https://i.ytimg.com/vi/LucAjw7vV7c/default.jpg",
  },
  {
    "artistString": "ゆよゆっぺ feat. 巡音ルカ",
    "id": 10067,
    "name": "Tell Your World",
    "thumbUrl": "http://tn-skr1.smilevideo.jp/smile?i=17293900",
  },
  {
    "artistString": "Farhan, rikuu-p feat. 初音ミク Append (Dark)",
    "id": 10661,
    "name": "Tell Your World",
    "thumbUrl":
        "http://i1.sndcdn.com/artworks-000020141589-d35r0z-large.jpg?5c687d0",
  },
  {
    "artistString": "REVOLUTION BOI feat. 初音ミク",
    "id": 17486,
    "name": "Tell Your World (NU VIBE NRG Remix)",
    "thumbUrl":
        "http://i1.sndcdn.com/artworks-000017458007-igrddl-large.jpg?e2f8ae2",
  },
  {
    "artistString": "大福P feat. 初音ミク Append (Unknown)",
    "id": 18924,
    "name": "Tell Your World (dfk bootleg edit)",
    "thumbUrl": "https://i.ytimg.com/vi/y8UK-gaD5uA/default.jpg",
  }
];

const mockAlbums = [
  {
    "artistString": "kz, livetune feat. 初音ミク",
    "id": 1008,
    "name": "Tell Your World EP",
  },
  {
    "artistString": "kz feat. 初音ミク",
    "id": 1027,
    "name": "Tell Your World",
  },
  {
    "artistString": "Various artists",
    "id": 1490,
    "name": "初音ミク 5thバースデー ベスト〜memories〜",
  },
  {
    "artistString": "kz, livetune feat. 初音ミク",
    "id": 2123,
    "name": "Re:Dial",
  },
  {
    "artistString": "Various artists",
    "id": 2166,
    "name": "初音ミク-Project DIVA-F Complete Collection",
  },
  {
    "artistString": "livetune, kz feat. 初音ミク",
    "id": 3548,
    "name": "Re:Upload",
  },
  {
    "artistString": "Various artists",
    "id": 9709,
    "name": "HATSUNE MIKU EXPO 2014 IN INDONESIA",
  },
  {
    "artistString": "Various artists",
    "id": 22997,
    "name": "HATSUNE MIKU 10th Anniversary Album 「Re:Start」",
  },
  {
    "artistString": "Various artists",
    "id": 23300,
    "name": "初音ミク「マジカルミライ 2014」 [Live] ",
  },
  {
    "artistString": "Various artists",
    "id": 26429,
    "name": "Miku dé Nihongo",
  }
];
