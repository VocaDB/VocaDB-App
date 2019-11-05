import 'package:flutter/material.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/pages/album_detail/album_detail_page.dart';

class AlbumTile extends StatelessWidget {
  final int id;

  final String imageUrl;

  final String name;

  final String artist;

  final String tag;

  const AlbumTile(
      {Key key, this.id, this.name, this.artist, this.imageUrl, this.tag})
      : super(key: key);

  AlbumTile.fromEntry(EntryModel entry, {this.tag})
      : this.id = entry.id,
        this.imageUrl = entry.imageUrl,
        this.name = entry.name,
        this.artist = entry.artistString;

  void navigateToDetail(BuildContext context) {
    AlbumDetailScreen.navigate(context, id,
        name: this.name, thumbUrl: this.imageUrl, tag: this.tag);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => navigateToDetail(context),
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Hero(
            tag: tag,
            child: Image.network(
              this.imageUrl,
              fit: BoxFit.fill,
            )),
      ),
      title: Text(this.name, overflow: TextOverflow.ellipsis),
      subtitle: Text(this.artist, overflow: TextOverflow.ellipsis),
    );
  }
}
