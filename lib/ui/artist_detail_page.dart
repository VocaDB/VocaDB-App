import 'package:flutter/material.dart';
import 'package:vocadb/ui/album_card.dart';
import 'package:vocadb/ui/section.dart';
import 'package:vocadb/ui/section_divider.dart';
import 'package:vocadb/ui/song_card.dart';
import 'package:vocadb/ui/tags.dart';
import 'package:vocadb/ui/web_link.dart';


class ArtistDetailPage extends StatefulWidget {

  final String thumbUrl;

  final String tag;

  const ArtistDetailPage({Key key, this.thumbUrl, this.tag}) : super(key: key);

  @override
  _ArtistDetailPageState createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {

  List<SongCard> latestSongs;

  List<SongCard> popularSongs;

  List<AlbumCard> latestAlbums;

  List<AlbumCard> popularAlbums;

  List<WebLink> websites;

  @override
  void initState() {
    super.initState();

    latestSongs = mockSongs.map((s) => SongCard(s['name'], s['artistString'], s['thumbUrl'])).toList();
    popularSongs = mockSongs.map((s) => SongCard(s['name'], s['artistString'], s['thumbUrl'])).toList();
    latestAlbums = mockAlbums.map((s) => AlbumCard(key: UniqueKey(), id: s['id'], name: s['name'], artist: s['artistString'], thumbUrl: 'https://vocadb.net/Album/CoverPicture/' + s['id'].toString())).toList();
    popularAlbums = mockAlbums.map((s) => AlbumCard(key: UniqueKey(), id: s['id'], name: s['name'], artist: s['artistString'], thumbUrl: 'https://vocadb.net/Album/CoverPicture/' + s['id'].toString())).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          HeroContent(tag: widget.tag, thumbUrl: widget.thumbUrl),

          Container(
              child: Column(
                children: <Widget>[
                  Text('Hatsine Miku', style: Theme.of(context).textTheme.title),
                  Text('Voicebank')
                ],
              ),
            ),

          Tags(),

           SectionDivider(), 

          Section(
              title: 'Recent Songs/PVs',
              horizontal: true,
              children: latestSongs
          ),

          SectionDivider(),

          Section(
              title: 'Popular Songs',
              horizontal: true,
              children: popularSongs
          ),

          SectionDivider(),

          Section(
              title: 'Recent albums',
              horizontal: true,
              children: latestAlbums
          ),

          SectionDivider(),

          Section(
              title: 'Popular albums',
              horizontal: true,
              children: popularAlbums
          ),
        ],
      ),
    );
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
    "thumbUrl": "http://i1.sndcdn.com/artworks-000020141589-d35r0z-large.jpg?5c687d0",
  },
  {
    "artistString": "REVOLUTION BOI feat. 初音ミク",
    "id": 17486,
    "name": "Tell Your World (NU VIBE NRG Remix)",
    "thumbUrl": "http://i1.sndcdn.com/artworks-000017458007-igrddl-large.jpg?e2f8ae2",
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