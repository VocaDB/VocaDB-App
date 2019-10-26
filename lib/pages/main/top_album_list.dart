import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/home_bloc.dart';
import 'package:vocadb/models/album_model.dart';
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
        title: FlutterI18n.translate(context, 'label.randomPopularAlbums'),
        horizontal: true,
        children: albumCards);
  }

  buildDefault() {
    return Section(
        title: FlutterI18n.translate(context, 'label.randomPopularAlbums'),
        horizontal: true,
        children: [0, 1, 2].map((i) => AlbumCardPlaceholder()).toList());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);

    return StreamBuilder(
      stream: bloc.topAlbums$,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildHasData(snapshot.data);
        } else if (snapshot.hasError) {
          print(snapshot.error.toString());
        }
        return buildDefault();
      },
    );
  }
}
