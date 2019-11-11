import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/pages/album_detail/album_detail_page.dart';

class AlbumCard extends StatelessWidget {
  final int id;
  final String name;
  final String artist;
  final String thumbUrl;
  final String tag;

  const AlbumCard(
      {Key key, this.id, this.name, this.artist, this.thumbUrl, this.tag})
      : super(key: key);

  AlbumCard.album(AlbumModel album, {this.tag})
      : id = album.id,
        name = album.name,
        artist = album.artistString,
        thumbUrl = album.imageUrl;

  void navigateToDetail(BuildContext context) {
    AlbumDetailScreen.navigate(context, id,
        name: this.name, thumbUrl: this.thumbUrl, tag: this.tag);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => navigateToDetail(context),
        child: Container(
          width: 130,
          margin: EdgeInsets.only(right: 8.0, left: 8.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 130,
                color: Colors.black,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Hero(
                        tag: tag,
                        child: CachedNetworkImage(
                          imageUrl: this.thumbUrl,
                          placeholder: (context, url) =>
                              Container(color: Colors.grey),
                          errorWidget: (context, url, error) => Placeholder(),
                        ))),
              ),
              Container(
                height: 4,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(this.name,
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
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
      ),
    );
  }
}

class AlbumCardPlaceholder extends StatelessWidget {
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
              height: 120,
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
