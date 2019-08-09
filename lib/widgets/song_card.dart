import 'package:flutter/material.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';

class SongCard extends StatelessWidget {

  final String title;
  final String artist;
  final String thumbUrl;

  const SongCard({Key key, this.title, this.artist, this.thumbUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String tag = this.key.toString();

    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SongDetailPage(thumbUrl: this.thumbUrl, tag: tag)));
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
                    fit: BoxFit.fitWidth,
                    child:
                        Hero(tag: tag, child: Image.network(this.thumbUrl))),
              ),
              Container(
                height: 4,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(this.title,
                      style: Theme.of(context).textTheme.body1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
              Container(
                height: 4,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(this.artist,
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