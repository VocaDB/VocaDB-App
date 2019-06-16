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
        ],
      ),
    );
  }
}

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
