import 'package:flutter/material.dart';

class AlbumDetailPage extends StatefulWidget {
  @override
  _AlbumDetailPageState createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text('Album detail page')
        ],
      ),
    );
  }
}
