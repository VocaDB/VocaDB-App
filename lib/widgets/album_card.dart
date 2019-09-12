import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/album.dart';
import 'package:vocadb/pages/album_detail/album_detail_page.dart';

class AlbumCard extends StatelessWidget {

  final int id;
  final String name;
  final String artist;
  final String thumbUrl;

  const AlbumCard({Key key, this.id, this.name, this.artist, this.thumbUrl}) : super(key: key);

  AlbumCard.album(Album album) : id = album.id,
  name = album.name, 
  artist = album.artistString, 
  thumbUrl = album.imageurl;

  @override
  Widget build(BuildContext context) {

    String tag = this.key.toString() + "_" + this.id.toString();

    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlbumDetailPage(id: this.id, name: this.name, thumbUrl: this.thumbUrl, tag: tag)));
        },
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
                    child:
                        Hero(tag: tag, child: CachedNetworkImage(
            imageUrl: this.thumbUrl,
            placeholder: (context, url) => Container(color: Colors.grey),
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
