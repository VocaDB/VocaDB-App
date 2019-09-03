import 'package:flutter/material.dart';
import 'package:vocadb/pages/artist_detail/artist_detail_page.dart';

class ArtistTile extends StatelessWidget {

  final int id;

  final String imageUrl;

  final String name;

  final String type;

  const ArtistTile({Key key, this.id, this.name, this.type, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    String tag = this.key.toString() + "_" + this.id.toString();

    return ListTile(
      onTap: () {
         Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArtistDetailPage(thumbUrl: this.imageUrl, tag: tag)));
      },
      leading: SizedBox(
        width: 50,
        height: 50,
        child: ClipOval(
            child: Container(
          color: Colors.white,
          child: Hero(tag: tag, child: Image.network(this.imageUrl)),
        )),
      ),
      title: Text(this.name, overflow: TextOverflow.ellipsis),
      subtitle: Text(this.type, overflow: TextOverflow.ellipsis),
    );
  }
}
