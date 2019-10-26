import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/favorite_album_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/widgets/center_content.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/album_tile.dart';

class FavoriteAlbumScreen extends StatelessWidget {
  static const String routeName = '/user/favoriteAlbums';

  @override
  Widget build(BuildContext context) {
    return FavoriteAlbumPage();
  }
}

class FavoriteAlbumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FavoriteAlbumBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, 'label.favoriteAlbums')),
      ),
      body: StreamBuilder(
        stream: bloc.albums$,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return CenterResult.error(
              message: snapshot.error.toString(),
            );

          Map<int, AlbumModel> albumMap = snapshot.data;

          if (albumMap == null || albumMap.isEmpty) {
            return CenterResult(
                result: Result(
                    Icon(Icons.album),
                    FlutterI18n.translate(
                        context, 'error.emptyFavoriteAlbums')));
          }
          List<AlbumModel> albums = albumMap.values.toList().reversed.toList();

          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final AlbumModel album = albums[index];
              return AlbumTile.fromEntry(
                album,
                tag: 'favorite_album_${album.id}',
              );
            },
          );
        },
      ),
    );
  }
}
