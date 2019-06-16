import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class SongDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.only(bottom: 8),
        children: <Widget>[
          new MediaPreview(),
          new ButtonBar(),
          Divider(
            height: 3,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Text('Tell Your World',
                        style: Theme.of(context).textTheme.title)),
                Container(child: Icon(Icons.arrow_drop_down))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8.0),
            alignment: Alignment.topLeft,
            child: Text('Original', style: Theme.of(context).textTheme.caption),
          ),
          new Tags(),
          Divider(
            height: 3,
          ),

          // Artist list
          new ArtistLine(
              name: 'kz',
              role: 'producer',
              imageUrl: 'https://vocadb.net/Artist/Picture/89'),
          new ArtistLine(
              name: 'Hatsune Miku',
              role: 'vocalist',
              imageUrl: 'https://vocadb.net/Artist/Picture/1'),
          Container(
            height: 38,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text('More', style: Theme.of(context).textTheme.subhead),
              ),
            ),
          ),

          // Divider
          Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Divider(
              height: 3,
            ),
          ),

          // PVs
          Container(
            padding: EdgeInsets.only(right: 8.0, left: 8.0),
            child: Column(
              children: <Widget>[
                new PVListItem(title: 'livetune feat. 初音ミク 『Tell Your World』Music Video'),
                new PVListItem(title: 'Google Chrome : Hatsune Miku (初音ミク)'),
              ],
            ),
          ),

          Divider(
            height: 3,
          ),

          Section(
            title: 'Alternate versions (120)',
            items: mockSongs
          ),
          Divider(
            height: 3,
          ),

          Section(
              title: 'Users who liked this also liked',
              items: mockSongs
          ),

          Divider(
            height: 3,
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {

  final String title;

  final List items;

  Section({
    this.title,
    this.items
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      this.title,
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    FlatButton(
                      child: Text('More'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              // Horizontal ListView
              height: 170,
              child: ListView.builder(
                itemCount: this.items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var s = this.items[index];
                  return SongCard(s['name'], s['artistString'], s['thumbUrl']);
                },
              ),
            ),
          ],
        ));
  }
}

class SongCard extends StatelessWidget {
  final String _title;
  final String _artist;
  final String _thumbUrl;

  SongCard(title, artist, thumbUrl) :
        this._title = title,
        this._artist = artist,
        this._thumbUrl = thumbUrl;


  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SongDetail()));
        },
        child: Container(
          width: 130,
          margin: EdgeInsets.only(right: 8.0, left: 8.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.black,
                child: FittedBox(
                    fit: BoxFit.fitWidth, child: Image.network(_thumbUrl)),
              ),
              Container(
                height: 4,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(_title,
                      style: Theme.of(context).textTheme.body1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
              Container(
                height: 4,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(_artist,
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis))
            ],
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


class PVListItem extends StatelessWidget {

  final String title;

  const PVListItem({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(Icons.ondemand_video),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                child: Text(this.title, maxLines: 2, overflow: TextOverflow.ellipsis)
            ),
          ),
          Container(
              child: Icon(Icons.more_vert)
          )
        ],
      ),
    );
  }
}

class Tags extends StatelessWidget {
  const Tags({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 4.0),
            child: Chip(
              label: Text('electropop'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 4.0),
            child: Chip(
              label: Text('MMD'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 4.0),
            child: Chip(
              label: Text('More (18)'),
            ),
          ),
        ],
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
//    return Container(
//      height: 196,
//      width: double.infinity,
//      color: Colors.blue,
//      child: YoutubePlayer(
//        context: context,
//        videoId: "iLnmTe5Q2Qw",
//        isLive: true,
//        liveUIColor: Colors.amber,
//      ),
//    );

    return YoutubePlayer(
      context: context,
      showThumbnail: true,
      autoPlay: true,
      quality: YoutubeQuality.MEDIUM,
      source: "PqJNc9KVIZE",
    );
  }
}

class ArtistLine extends StatelessWidget {
  final String imageUrl;

  final String name;

  final String role;

  const ArtistLine({Key key, this.imageUrl, this.name, this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: <Widget>[
            Container(
                height: 38,
                width: 38,
                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                child: ClipOval(
                    child: Container(
                  color: Colors.white,
                  child: Image.network(this.imageUrl),
                ))),
            Container(
              height: 38,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.name, style: Theme.of(context).textTheme.subhead),
                  Container(
                    height: 2,
                  ),
                  Text(this.role, style: Theme.of(context).textTheme.caption),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonBar extends StatelessWidget {
  const ButtonBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.blueAccent,
      width: double.infinity,
      height: 58,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new ActionButton(icon: Icons.favorite, label: '39k'),
          new ActionButton(icon: Icons.share, label: 'Share'),
          new ActionButton(icon: Icons.note, label: 'Lyrics'),
          new ActionButton(icon: Icons.info, label: 'VocaDB'),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;

  final IconData icon;

  const ActionButton({Key key, this.label, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.white70),
        Text(label, style: Theme.of(context).textTheme.caption)
      ],
    ));
  }
}
