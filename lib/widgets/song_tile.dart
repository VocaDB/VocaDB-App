import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {

  final String imageUrl;

  final String name;

  final String artist;

  const SongTile({Key key, this.name, this.artist, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: Image.network(
              this.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(this.name, overflow: TextOverflow.ellipsis),
          subtitle: Text(this.artist, overflow: TextOverflow.ellipsis),
        );
  }
}