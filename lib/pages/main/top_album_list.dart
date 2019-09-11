import 'package:flutter/material.dart';
import 'package:vocadb/models/album.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/section.dart';

class TopAlbumList extends StatefulWidget {
  @override
  _TopAlbumListState createState() => _TopAlbumListState();
}

class _TopAlbumListState extends State<TopAlbumList> {

  List<Album> _albums = List<Album>(); 

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() {
    WebService().load(Album.top).then((albums) => {
      setState(() => {
        _albums = albums
      })
    });
  }

  List<Widget> _buildAlbumCardList() {
    return _albums.map((album) => AlbumCard.album(album)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
              title: 'Recent or upcoming albums',
              horizontal: true,
              children: _buildAlbumCardList()
    );
  }
}
