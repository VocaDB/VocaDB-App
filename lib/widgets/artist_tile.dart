import 'package:flutter/material.dart';

class ArtistTile extends StatelessWidget {
  final String imageUrl;

  final String name;

  final String type;

  const ArtistTile({Key key, this.name, this.type, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: ClipOval(
            child: Container(
          color: Colors.white,
          child: Image.network(this.imageUrl),
        )),
      ),
      title: Text(this.name, overflow: TextOverflow.ellipsis),
      subtitle: Text(this.type, overflow: TextOverflow.ellipsis),
    );
  }
}
