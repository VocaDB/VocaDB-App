import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/models.dart';
import 'package:vocadb/shared_widgets/shared_widgets.dart';
import 'package:vocadb/views/views.dart';

class SongCard extends StatelessWidget {
  final SongModel song;
  final String tag;

  SongCard.song(this.song, {this.tag});

  void navigateToSongDetail(BuildContext context) {
    SongDetailPage.navigate(context, song, tag: tag);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => navigateToSongDetail(context),
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
                      child: (song.thumbUrl == null)
                          ? Placeholder()
                          : CachedNetworkImage(
                              imageUrl: song.thumbUrl,
                              placeholder: (context, url) =>
                                  Container(color: Colors.grey),
                              errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                            )),
                ),
              ),
              Container(
                height: 4,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(song.name,
                      style: Theme.of(context).textTheme.body1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
              Container(
                height: 4,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(song.artistString,
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
              Container(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  SongTypeSymbol(
                    songType: song.songType,
                  ),
                  (song.youtubePV != null)
                      ? Icon(Icons.local_movies)
                      : Container()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
