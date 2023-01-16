import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/section_divider.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_relations.dart';
import 'package:vocadb_app/src/features/songs/presentation/songs_list/songs_list_view.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class ArtistRelationsView extends StatelessWidget {
  const ArtistRelationsView({super.key, required this.artistRelations});

  final ArtistRelations? artistRelations;

  static const latestSongsSectionKey = Key('latest-songs-section-key');
  static const popularSongsSectionKey = Key('popular-songs-section-key');
  static const latestAlbumsSectionKey = Key('latest-albums-section-key');
  static const popularAlbumsSectionKey = Key('popular-albums-section-key');

  @override
  Widget build(BuildContext context) {
    if (artistRelations == null) {
      return Container();
    }

    return Column(
      children: [
        SectionDivider(
          key: latestSongsSectionKey,
          visible: artistRelations!.latestSongs.isNotEmpty,
          title: 'Recent songs',
          child: SongListView(
            scrollDirection: Axis.horizontal,
            songs: artistRelations!.latestSongs,
            onSelect: context.goSongDetail,
          ),
        ),
        SectionDivider(
          key: popularSongsSectionKey,
          visible: artistRelations!.popularSongs.isNotEmpty,
          title: 'Popular songs',
          child: SongListView(
            scrollDirection: Axis.horizontal,
            songs: artistRelations!.popularSongs,
            onSelect: context.goSongDetail,
          ),
        ),
        SectionDivider(
          key: latestAlbumsSectionKey,
          visible: artistRelations!.latestAlbums.isNotEmpty,
          title: 'Recent albums',
          child: AlbumListView(
            scrollDirection: Axis.horizontal,
            albums: artistRelations!.latestAlbums,
            onSelect: context.goAlbumDetail,
          ),
        ),
        SectionDivider(
          key: popularAlbumsSectionKey,
          visible: artistRelations!.popularAlbums.isNotEmpty,
          title: 'Popular albums',
          child: AlbumListView(
            scrollDirection: Axis.horizontal,
            albums: artistRelations!.popularAlbums,
            onSelect: context.goAlbumDetail,
          ),
        ),
      ],
    );
  }
}
