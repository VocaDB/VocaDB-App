import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/artist_song_model.dart';
import 'package:vocadb/pages/artist_detail/artist_detail_page.dart';

class ArtistTile extends StatelessWidget {
  final int id;

  final String imageUrl;

  final String title;

  final String subtitle;

  const ArtistTile({Key key, this.id, this.title, this.subtitle, this.imageUrl})
      : super(key: key);

  ArtistTile.artistSong(ArtistSongModel artistSong, {bool showRole = false})
      : id = artistSong.artistId,
        title = artistSong.artistName,
        subtitle = (showRole) ? artistSong.artistRole : null,
        imageUrl = artistSong.artistImageUrl;

  void onTap(BuildContext context, String tag) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ArtistDetailPage(thumbUrl: this.imageUrl, tag: tag)));
  }

  Widget buildLeading(String tag) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipOval(
          child: Container(
        color: Colors.white,
        child: Hero(
            tag: tag,
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

  Widget buildSingleLine(BuildContext context, String tag) {
    return ListTile(
      enabled: (this.id != null),
      onTap: () {
        onTap(context, tag);
      },
      leading: buildLeading(tag),
      title: Text(this.title, overflow: TextOverflow.ellipsis),
    );
  }

  Widget buildTwoLine(BuildContext context, String tag) {
    return ListTile(
      enabled: (this.id != null),
      onTap: () {
        onTap(context, tag);
      },
      leading: buildLeading(tag),
      title: Text(this.title, overflow: TextOverflow.ellipsis),
      subtitle: Text(this.subtitle, overflow: TextOverflow.ellipsis),
    );
  }

  @override
  Widget build(BuildContext context) {
    String tag = this.key.toString() + "_" + this.id.toString();

    return (this.subtitle == null)
        ? buildSingleLine(context, tag)
        : buildTwoLine(context, tag);
  }
}
