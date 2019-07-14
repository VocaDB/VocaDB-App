import 'package:flutter/material.dart';

class AlbumDetailPage extends StatefulWidget {

  final String thumbUrl;

  final String tag;

  const AlbumDetailPage({Key key, this.thumbUrl, this.tag}) : super(key: key);

  @override
  _AlbumDetailPageState createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Container(
        // The blue background emphasizes that it's a new route.
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.topLeft,
        child: Hero(
          tag: widget.tag,
          child: Image.network(
            widget.thumbUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
