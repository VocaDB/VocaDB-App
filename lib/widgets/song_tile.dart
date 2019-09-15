import 'package:flutter/material.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';

class SongTile extends StatelessWidget {
  final int id;

  final String imageUrl;

  final String name;

  final String artist;

  const SongTile({Key key, this.id, this.name, this.artist, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tag = this.key.toString() + "_" + this.id.toString();

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
