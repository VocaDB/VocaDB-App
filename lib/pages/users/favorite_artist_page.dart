import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/favorite_artist_bloc.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/widgets/center_content.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/artist_tile.dart';

class FavoriteArtistScreen extends StatelessWidget {
  static const String routeName = '/user/favoriteArtists';

  @override
  Widget build(BuildContext context) {
    return FavoriteArtistPage();
  }
}

class FavoriteArtistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FavoriteArtistBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Followed artists'),
      ),
      body: StreamBuilder(
        stream: bloc.artists$,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return CenterResult.error(
              message: snapshot.error.toString(),
            );

          Map<int, ArtistModel> artistMap = snapshot.data;

          if (artistMap == null || artistMap.isEmpty) {
            return CenterResult(
                result: Result(Icon(Icons.people), 'No artist'));
          }
          List<ArtistModel> artists =
              artistMap.values.toList().reversed.toList();

          return ListView.builder(
            itemCount: artists.length,
            itemBuilder: (context, index) {
              final ArtistModel artist = artists[index];
              return ArtistTile.fromEntry(
                artist,
                tag: 'favorite_artist_${artist.id}',
              );
            },
          );
        },
      ),
    );
  }
}
