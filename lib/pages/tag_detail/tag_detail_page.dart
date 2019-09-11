import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/widgets/addition_info.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/song_card.dart';

class TagDetailPage extends StatelessWidget {

  final Tag tag = Tag.fromJson(mockTagInfo);

  final List<SongCard> latestSongList = mockSongs
        .map((s) => SongCard(
            key: UniqueKey(),
            title: s['name'],
            artist: s['artistString'],
            thumbUrl: s['thumbUrl']))
        .toList();

  List<Widget> buildContentWidgets() {
    return [
      AdditionInfo(title: "About", value: tag.description),
      Section(
          title: 'Latest songs',
          horizontal: true,
          children: latestSongList),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          TagDetailHeroAppBar(name: tag.name, imageUrl: tag.imageUrl),
          SliverList(
            delegate: SliverChildListDelegate.fixed(buildContentWidgets()),
          )
        ],
      ),
    );
  }
}

class TagDetailHeroAppBar extends StatelessWidget {

  final String name;
  final String imageUrl;

  const TagDetailHeroAppBar({Key key, this.name, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             SliverAppBar(
              expandedHeight: 200.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("#" + this.name),
                background: CachedNetworkImage(
                    imageUrl: this.imageUrl,
                    placeholder: (context, url) => Container(color: Colors.grey),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
            );
  }
}

class Tag {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  Tag.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      description = json['description'],
      imageUrl = 'https://vocadb.net/EntryImg/Tag/353.png?v=11';
}

const mockTagInfo = {
  "categoryName": "Games",
  "createDate": "2016-03-04T20:49:57",
  "defaultNameLanguage": "English",
  "id": 353,
  "description": "Music related to the Hatsune Miku: Project DIVA series.",
  "mainPicture": {
    "mime": "image/png",
    "urlSmallThumb": "https://vocadb.net/EntryImg/Tag/353-st.png?v=11",
    "urlThumb": "https://vocadb.net/EntryImg/Tag/353-t.png?v=11",
    "urlTinyThumb": "https://vocadb.net/EntryImg/Tag/353-tt.png?v=11"
  },
  "name": "Project DIVA",
  "status": "Approved",
  "targets": 65,
  "urlSlug": "project-diva",
  "usageCount": 219,
  "version": 11
};


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
