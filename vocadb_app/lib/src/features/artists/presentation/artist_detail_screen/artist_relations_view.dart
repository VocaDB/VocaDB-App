import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_relations.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';

class ArtistRelationsView extends StatelessWidget {
  const ArtistRelationsView({super.key, required this.artistRelations});

  final ArtistRelations artistRelations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Section(
          title: 'Recent songs',
          child: SongListView(
            scrollDirection: Axis.horizontal,
            songs: artistRelations.latestSongs,
            onSelect: (s) {},
          ),
        ),
        const Divider(),
        Section(
          title: 'Popular songs',
          child: SongListView(
            scrollDirection: Axis.horizontal,
            songs: artistRelations.popularSongs,
            onSelect: (s) {},
          ),
        ),
        const Divider(),
        Section(
          title: 'Recent albums',
          child: AlbumListView(
            scrollDirection: Axis.horizontal,
            albums: artistRelations.latestAlbums,
            onSelect: (s) {},
          ),
        ),
        const Divider(),
        Section(
          title: 'Popular albums',
          child: AlbumListView(
            scrollDirection: Axis.horizontal,
            albums: artistRelations.latestAlbums,
            onSelect: (s) {},
          ),
        ),
        const Divider(),
      ],
    );
  }
}
