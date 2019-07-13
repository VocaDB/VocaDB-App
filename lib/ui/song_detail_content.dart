import 'package:flutter/material.dart';
import 'package:vocadb/ui/action_bar.dart';
import 'package:vocadb/ui/action_button.dart';
import 'package:vocadb/ui/album_card.dart';
import 'package:vocadb/ui/artist_list_item.dart';
import 'package:vocadb/ui/like_action_button.dart';
import 'package:vocadb/ui/lyrics_action_button.dart';
import 'package:vocadb/ui/pv_list_item.dart';
import 'package:vocadb/ui/section.dart';
import 'package:vocadb/ui/section_divider.dart';
import 'package:vocadb/ui/share_action_button.dart';
import 'package:vocadb/ui/song_card.dart';
import 'package:vocadb/ui/source_action_button.dart';
import 'package:vocadb/ui/tags.dart';
import 'package:vocadb/ui/web_link.dart';

import 'lyric_content.dart';

class SongDetailContent extends StatefulWidget {
  @override
  SongDetailContentState createState() => SongDetailContentState();

}

class SongDetailContentState extends State<SongDetailContent> {

  bool showLyrics = false;

  List<SongCard> alternateSongList;

  List<SongCard> relatedSongList;

  List<AlbumCard> albumList;

  @override
  void initState() {
    super.initState();
    alternateSongList = mockSongs.map((s) => SongCard(s['name'], s['artistString'], s['thumbUrl'])).toList();
    relatedSongList = mockSongs.map((s) => SongCard(s['name'], s['artistString'], s['thumbUrl'])).toList();
    albumList = mockAlbums.map((s) => AlbumCard(s['name'], s['artistString'], 'https://vocadb.net/Album/CoverPicture/' + s['id'].toString())).toList();
  }

  void onTapLyrics() {
    setState((){
      showLyrics = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    if(showLyrics) return LyricContent(
      onTapClose: () {
        setState((){
          showLyrics = false;
        });
      },
    );

    return Container(
      child: ListView(
        children: <Widget>[
          ActionBar(
              actions: <ActionButton> [
                LikeActionButton(),
                ShareActionButton(),
                LyricsActionButton(onTap: onTapLyrics),
                SourceActionButton(),
              ]
          ),
          SectionDivider(),
          SongName(name: 'Tell Your World'),
          SongType(songType: 'Original'),
          Tags(),
          AdditionInfo(title: 'Addition names', value: 'Test1'),
          AdditionInfo(title: 'Published', value: '12/03/2012'),
          SectionDivider(),

          // Artist list
          Section(
              title: 'Artists',
              children: <Widget> [
                ArtistLine(
                  name: 'kz',
                  role: 'producer',
                  imageUrl: 'https://vocadb.net/Artist/Picture/89'),
                ArtistLine(
                    name: 'Hatsune Miku',
                    role: 'vocalist',
                    imageUrl: 'https://vocadb.net/Artist/Picture/1')
              ]
          ),

          // Divider
          SectionDivider(),

          // PVs
          Section(
              title: 'PVs',
              padding: EdgeInsets.only(right: 8.0, left: 8.0),
              children: <Widget> [
                PVListItem(title: 'livetune feat. 初音ミク 『Tell Your World』Music Video'),
                PVListItem(title: 'Google Chrome : Hatsune Miku (初音ミク)'),
              ]
          ),

          SectionDivider(),

          Section(
              title: 'Albums (10)',
              horizontal: true,
              children: albumList
          ),

          SectionDivider(),

          Section(
              title: 'Alternate versions (120)',
              horizontal: true,
              children: alternateSongList
          ),

          SectionDivider(),

          Section(
              title: 'Users who liked this also liked',
              horizontal: true,
              children: relatedSongList
          ),

          SectionDivider(),

          // Websites
          Section(
              title: 'Websites',
              padding: EdgeInsets.all(8.0),
              children: <Widget> [
                WebLink(name: 'Spotify'),
                WebLink(name: 'Spotify (Re:Upload)'),
                WebLink(name: 'MikuWiki'),
                WebLink(name: 'MusicBrainz (recoding)'),
                WebLink(name: 'MusicBrainz (work)'),
              ]
          ),
        ],
      ),
    );
  }
}


class AdditionInfo extends StatelessWidget {

  final String title;

  final String value;

  const AdditionInfo({Key key, this.title, this.value}) : super(key :key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this.title, style: Theme.of(context).textTheme.caption),
          Text(this.value, style: Theme.of(context).textTheme.body1),
        ],
      ),
    );
  }
}


class SongName extends StatelessWidget {

  final String name;

  const SongName({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: Text(this.name,
                  style: Theme.of(context).textTheme.title)),
          Container(child: Icon(Icons.arrow_drop_down))
        ],
      ),
    );
  }
}

class SongType extends StatelessWidget {

  final String songType;

  const SongType({Key key, this.songType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      alignment: Alignment.topLeft,
      child: Text(this.songType, style: Theme.of(context).textTheme.caption),
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