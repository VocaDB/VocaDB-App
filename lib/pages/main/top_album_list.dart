import 'package:flutter/material.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/providers/global_provider.dart';
import 'package:vocadb/widgets/album_card.dart';
import 'package:vocadb/widgets/section.dart';

class TopAlbumList extends StatefulWidget {
  @override
  _TopAlbumListState createState() => _TopAlbumListState();
}

class _TopAlbumListState extends State<TopAlbumList> {
  buildHasData(List<AlbumModel> albums) {
    List<AlbumCard> albumCards = albums
        .map(
            (album) => AlbumCard.album(album, tag: 'popular_album_${album.id}'))
        .toList();
    return Section(
        title: 'Random popular album', horizontal: true, children: albumCards);
  }

  buildDefault() {
    return Section(
        title: 'Random popular album',
        horizontal: true,
        children: [0, 1, 2].map((i) => AlbumCardPlaceholder()).toList());
  }

  @override
  Widget build(BuildContext context) {
    final albumService = GlobalProvider.of(context).albumService;

    return FutureBuilder<List<AlbumModel>>(
      future: albumService.top(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return buildHasData(snapshot.data);
        else if (snapshot.hasError) {
          print(snapshot.error);
        }

        return buildDefault();
      },
    );
  }
}
