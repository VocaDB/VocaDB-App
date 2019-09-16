import 'package:flutter/material.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';

class SongTile extends StatelessWidget {
  final int id;

  final String imageUrl;

  final String name;

  final String artist;

  final String tag;

  const SongTile(
      {Key key, this.id, this.name, this.artist, this.imageUrl, this.tag})
      : super(key: key);

  SongTile.fromEntry(EntryModel entry, {this.tag})
      : this.id = entry.id,
        this.imageUrl = entry.imageUrl,
        this.name = entry.name,
        this.artist = entry.artistString;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SongDetailPage(
                    this.id, this.name, this.imageUrl,
                    tag: tag)));
      },
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Hero(
          tag: tag,
          child: Image.network(
            this.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Text(this.name, overflow: TextOverflow.ellipsis),
      subtitle: Text(this.artist, overflow: TextOverflow.ellipsis),
    );
  }
}
