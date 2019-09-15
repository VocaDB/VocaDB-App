import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/artist_song_model.dart';
import 'package:vocadb/pages/artist_detail/artist_detail_page.dart';

class ArtistTile extends StatelessWidget {
  final int id;

  final String imageUrl;

  final String title;

  final String subtitle;

  final String tag;

  const ArtistTile(
      {Key key, this.id, this.title, this.subtitle, this.imageUrl, this.tag})
      : super(key: key);

  ArtistTile.artistSong(ArtistSongModel artistSong,
      {bool showRole = false, this.tag})
      : id = artistSong.artistId,
        title = artistSong.artistName,
        subtitle = (showRole) ? artistSong.artistRole : null,
        imageUrl = artistSong.artistImageUrl;

  void onTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ArtistDetailPage(
                this.id, this.title, this.imageUrl, this.tag)));
  }

  Widget buildLeading() {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipOval(
          child: Container(
        color: Colors.white,
        child: Hero(
            tag: this.tag,
            child: (this.imageUrl == null)
                ? Placeholder()
                : CachedNetworkImage(
                    imageUrl: this.imageUrl,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  )),
      )),
    );
  }

  Widget buildSingleLine(BuildContext context) {
    return ListTile(
      enabled: (this.id != null),
      onTap: () {
        onTap(context);
      },
      leading: buildLeading(),
      title: Text(this.title, overflow: TextOverflow.ellipsis),
    );
  }

  Widget buildTwoLine(BuildContext context) {
    return ListTile(
      enabled: (this.id != null),
      onTap: () {
        onTap(context);
      },
      leading: buildLeading(),
      title: Text(this.title, overflow: TextOverflow.ellipsis),
      subtitle: Text(this.subtitle, overflow: TextOverflow.ellipsis),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (this.subtitle == null)
        ? buildSingleLine(context)
        : buildTwoLine(context);
  }
}
