import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';
import 'package:vocadb/widgets/song_type_symbol.dart';

class SongCard extends StatelessWidget {
  final SongModel song;
  final String tag;

  SongCard.song(this.song, {this.tag});

  void navigateToSongDetail(BuildContext context) {
    SongDetailScreen.navigate(context, song.id,
        name: song.name, thumbUrl: song.thumbUrl, tag: tag);
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

class SongCardPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 130,
              height: 80,
              color: Colors.white,
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: 130,
              height: 8,
              color: Colors.white,
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: 80,
              height: 8,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
