import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/pv_tile.dart';
import 'package:vocadb/widgets/song_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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

//  Hero(tag: widget.tag, child: Image.network(widget.thumbUrl))

  List<Widget> renderContentWidgets(BuildContext context) {
    return [
      ActionBar(actions: <ActionButton>[
        LikeActionButton(),
        ShareActionButton(),
        SourceActionButton(),
      ]),
      SectionDivider(),
      Tags([]),
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
            PVTile(name: 'livetune feat. 初音ミク 『Tell Your World』Music Video'),
            PVTile(name: 'Google Chrome : Hatsune Miku (初音ミク)'),
          ]),

      SectionDivider(),

      Section(title: 'Albums (10)', horizontal: true, children: albumList),

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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          YoutubePlayer(
            context: context,
            videoId: "PqJNc9KVIZE",
            flags: YoutubePlayerFlags(
              autoPlay: false,
              showVideoProgressIndicator: true,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: renderContentWidgets(context).length,
              itemBuilder: (BuildContext context, int index) {
                return renderContentWidgets(context)[index];
              },
            ),
          )
        ],
      ),
    ));
  }
}

class StaticHeroContent extends StatelessWidget {
  final String thumbUrl;

  final String tag;

  const StaticHeroContent({Key key, this.thumbUrl, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(tag: this.tag, child: Image.network(this.thumbUrl)),
              SizedBox(
                height: 16,
              ),
              Text("Song name", style: Theme.of(context).textTheme.title),
            ],
          ),
        )),
      ),
    );
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
