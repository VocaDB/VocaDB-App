import 'package:flutter/material.dart';
import 'package:vocadb/ui/song_detail_page.dart';

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => SongDetailPage()));
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