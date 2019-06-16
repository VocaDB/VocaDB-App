import 'package:flutter/material.dart';

class SongDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                    child: Text('Song name',
                        style: Theme.of(context).textTheme.title)),
                Container(child: Icon(Icons.arrow_drop_down))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 4.0),
                  child: Chip(
                    label: Text('sad'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4.0),
                  child: Chip(
                    label: Text('depression'),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 3,
          ),
          new ArtistLine(
              name: 'wowaka',
              role: 'producer',
              imageUrl: 'https://vocadb.net/Artist/Picture/53'),
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
          Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Divider(
              height: 3,
            ),
          )
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
    return Container(
      height: 196,
      width: double.infinity,
      color: Colors.blue,
      child: Center(
        child: Text('Image or video'),
      ),
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
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: Icon(Icons.favorite)),
          Center(child: Icon(Icons.share)),
          Center(child: Icon(Icons.web))
        ],
      ),
    );
  }
}
