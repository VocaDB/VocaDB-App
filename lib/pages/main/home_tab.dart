
import 'package:flutter/material.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/song_card.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  List<SongCard> highlightedSongs;

  List<AlbumCard> latestAlbums;

  List<AlbumCard> randomAlbums;

  @override
  void initState() {
    super.initState();
    highlightedSongs = mockSongs.map((s) => SongCard(key: UniqueKey(), title: s['name'], artist: s['artistString'], thumbUrl: s['thumbUrl'])).toList();
    latestAlbums = mockAlbums.map((s) => AlbumCard(key: UniqueKey(), id: s['id'], name: s['name'], artist: s['artistString'], thumbUrl: 'https://vocadb.net/Album/CoverPicture/' + s['id'].toString())).toList();
    randomAlbums = mockAlbums.map((s) => AlbumCard(key: UniqueKey(), id: s['id'], name: s['name'], artist: s['artistString'], thumbUrl: 'https://vocadb.net/Album/CoverPicture/' + s['id'].toString())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchBar(),
          ),
          Section(
              title: 'Highlighted',
              horizontal: true,
              children: highlightedSongs
          ),

          Section(
              title: 'Recent or upcoming albums',
              horizontal: true,
              children: latestAlbums
          ),

          Section(
              title: 'Random popular albums',
              horizontal: true,
              children: randomAlbums
          ),


        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      width: double.infinity,
      child: Material(
        color: Colors.white12,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[Icon(Icons.search, color: Colors.grey)],
            ),
          ),
        ),
      ),
    );
  }
}

const mockSongs = [
  {
    "artistString": "wowaka feat. 初音ミク",
    "id": 1501,
    "name": "ローリンガール",
    "thumbUrl": "http://tn-skr4.smilevideo.jp/smile?i=9714351",
  },
  {
    "artistString": "iroha(sasaki) feat. 鏡音リン",
    "id": 3022,
    "name": "炉心融解",
    "thumbUrl": "http://tn-skr2.smilevideo.jp/smile?i=8089993",
  },
  {
    "artistString": "黒うさP feat. 初音ミク",
    "id": 8394,
    "name": "千本桜",
    "thumbUrl": "http://tn-skr3.smilevideo.jp/smile?i=15630734",
  },
  {
    "artistString": "kz feat. 初音ミク",
    "id": 8395,
    "name": "Tell Your World",
    "thumbUrl": "https://i.ytimg.com/vi/PqJNc9KVIZE/default.jpg",
  },
  {
    "artistString": "Neru feat. 鏡音リン Append (Power)",
    "id": 19094,
    "name": "ロストワンの号哭",
    "thumbUrl": "http://tn-skr3.smilevideo.jp/smile?i=20244918",
  },
  {
    "artistString": "ryo feat. 初音ミク",
    "id": 15662,
    "name": "ODDS&ENDS",
    "thumbUrl": "https://i.ytimg.com/vi/6OmwKZ9r07o/default.jpg",
  },
  {
    "artistString": "ハチ feat. 初音ミク, GUMI",
    "id": 368,
    "name": "マトリョシカ",
    "thumbUrl": "https://i.ytimg.com/vi/HOz-9FzIDf0/default.jpg",
  },
  {
    "artistString": "ギガP, れをる feat. 鏡音リン Append (Power), V3 GUMI (Power)",
    "id": 49755,
    "name": "LUVORATORRRRRY!",
    "thumbUrl": "http://tn-skr4.smilevideo.jp/smile?i=22942867",
  },
  {
    "artistString": "ギガP feat. 初音ミク V3 (Solid)",
    "id": 63276,
    "name": "ヒビカセ",
    "thumbUrl": "https://i.ytimg.com/vi/TkroHwQYpFE/default.jpg",
  },
  {
    "artistString": "ryo, supercell feat. 初音ミク",
    "id": 1320,
    "name": "恋は戦争",
    "thumbUrl": "http://tn-skr1.smilevideo.jp/smile?i=2397344",
  },
  {
    "artistString": "wowaka feat. 初音ミク, 巡音ルカ",
    "id": 20,
    "name": "ワールズエンド・ダンスホール",
    "thumbUrl": "http://tn-skr4.smilevideo.jp/smile?i=10759623",
  },
  {
    "artistString": "DECO＊27 feat. GUMI",
    "id": 1381,
    "name": "モザイクロール",
    "thumbUrl": "https://i.ytimg.com/vi/DnLFVUi3oOU/default.jpg",
  },
  {
    "artistString": "ryo feat. 初音ミク",
    "id": 1322,
    "name": "メルト",
    "thumbUrl": "http://tn-skr4.smilevideo.jp/smile?i=1715919",
  },
  {
    "artistString": "ryo, supercell feat. 初音ミク",
    "id": 1326,
    "name": "ワールドイズマイン",
    "thumbUrl": "http://tn-skr4.smilevideo.jp/smile?i=3504435",
  },
  {
    "artistString":
        "Neru, おればななP feat. 鏡音リン Append (Sweet), 鏡音リン Append (Power)",
    "id": 555,
    "name": "東京テディベア",
    "thumbUrl": "http://tn-skr3.smilevideo.jp/smile?i=15308214",
  },
  {
    "artistString": "doriko feat. 初音ミク",
    "id": 1032,
    "name": "ロミオとシンデレラ",
    "thumbUrl": "http://tn-skr1.smilevideo.jp/smile?i=6666016",
  },
  {
    "artistString": "CrusherP, CIRCRUSH feat. V3 GUMI (English)",
    "id": 68814,
    "name": "ECHO",
    "thumbUrl": "http://tn-skr3.smilevideo.jp/smile?i=24643818",
  },
  {
    "artistString": "うたたP feat. 初音ミク",
    "id": 13260,
    "name": "こちら、幸福安心委員会です。",
    "thumbUrl": "http://tn-skr2.smilevideo.jp/smile?i=18100389",
  },
  {
    "artistString": "kemu feat. IA",
    "id": 11219,
    "name": "六兆年と一夜物語",
    "thumbUrl": "http://tn-skr4.smilevideo.jp/smile?i=17520775",
  },
  {
    "artistString": "kz feat. 初音ミク",
    "id": 2443,
    "name": "Last Night, Good Night",
    "thumbUrl": "https://i.ytimg.com/vi/T6mMMYSqlM4/default.jpg",
  },
  {
    "artistString": "40mP feat. 初音ミク",
    "id": 1363,
    "name": "からくりピエロ",
    "thumbUrl": "http://tn-skr2.smilevideo.jp/smile?i=15022913",
  },
  {
    "artistString": "Mitchie M feat. 初音ミク",
    "id": 35603,
    "name": "ビバハピ",
    "thumbUrl": "https://i.ytimg.com/vi/WiUjG9fF3zw/default.jpg",
  },
  {
    "artistString": "Dixie Flatline feat. 巡音ルカ",
    "id": 1360,
    "name": "Just Be Friends",
    "thumbUrl": "http://tn-skr2.smilevideo.jp/smile?i=7528841",
  },
  {
    "artistString": "ピノキオピー feat. 初音ミク Append (Dark)",
    "id": 13351,
    "name": "ありふれたせかいせいふく",
    "thumbUrl": "https://i.ytimg.com/vi/8Z3TbMBfDM0/default.jpg",
  },
  {
    "artistString": "ハチ feat. 初音ミク",
    "id": 2982,
    "name": "結ンデ開イテ羅刹ト骸",
    "thumbUrl": "https://i.ytimg.com/vi/AKffZySqQts/default.jpg",
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