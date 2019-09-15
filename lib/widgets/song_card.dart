import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';

class SongCard extends StatelessWidget {
  final int id;
  final String title;
  final String artist;
  final String thumbUrl;
  final String tag;

  const SongCard(
      {Key key, this.id, this.title, this.artist, this.thumbUrl, this.tag})
      : super(key: key);

  SongCard.song(SongModel song, {this.tag})
      : id = song.id,
        title = song.name,
        artist = song.artistString,
        thumbUrl = song.thumbUrl;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          print('tag : $tag');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SongDetailPage(
                      this.id, this.title, this.thumbUrl,
                      tag: this.tag)));
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
                    child: Hero(
                        tag: tag,
                        child: CachedNetworkImage(
                          imageUrl: this.thumbUrl,
                          placeholder: (context, url) =>
                              Container(color: Colors.grey),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ))),
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
