import 'package:flutter/material.dart';

class PVTile extends StatelessWidget {

  final int id;

  final String imageUrl;

  final String name;

  final String artist;

  const PVTile({Key key, this.id, this.name, this.artist, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ListTile(
          onTap: () {},
          leading: SizedBox(
            child: Icon(Icons.ondemand_video),
          ),
          title: Text(this.name, overflow: TextOverflow.ellipsis),
        );
  }
}