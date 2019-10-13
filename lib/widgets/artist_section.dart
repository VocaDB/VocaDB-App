import 'package:flutter/material.dart';
import 'package:vocadb/models/artist_album_model.dart';
import 'package:vocadb/models/artist_event_model.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/artist_song_model.dart';
import 'package:vocadb/widgets/artist_tile.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/space_divider.dart';

class ArtistSection extends StatelessWidget {
  final String title;
  final List<ArtistModel> artists;
  final String prefixTag;

  const ArtistSection({Key key, this.title, this.artists, this.prefixTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (artists.length == 0) return Container();

    return Column(
      children: <Widget>[
        Section(
          title: title,
          children: artists
              .map<ArtistTile>((a) => ArtistTile.fromEntry(
                    a,
                    tag: '${prefixTag}_artist_${a.id}',
                  ))
              .toList(),
        ),
        SpaceDivider(),
      ],
    );
  }
}

class ArtistForSongSection extends StatelessWidget {
  final String title;
  final List<ArtistSongModel> artists;
  final String prefixTag;

  const ArtistForSongSection(
      {Key key, this.title, this.artists, this.prefixTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (artists.length == 0) return Container();

    return Column(
      children: <Widget>[
        Section(
          title: title,
          children: artists
              .map((a) =>
                  ArtistTile.artistSong(a, tag: '${prefixTag}_${a.artistId}'))
              .toList(),
        ),
        SpaceDivider(),
      ],
    );
  }
}

class ArtistForAlbumSection extends StatelessWidget {
  final String title;
  final List<ArtistAlbumModel> artists;
  final String prefixTag;

  const ArtistForAlbumSection(
      {Key key, this.title, this.artists, this.prefixTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (artists.length == 0) return Container();

    return Column(
      children: <Widget>[
        Section(
          title: title,
          children: artists
              .map((a) => ArtistTile.artistAlbum(
                    a,
                    tag: '${prefixTag}_${a.artistId}',
                    showRole: (a.effectiveRoles != 'Default'),
                  ))
              .toList(),
        ),
        SpaceDivider(),
      ],
    );
  }
}

class ArtistForEventSection extends StatelessWidget {
  final String title;
  final List<ArtistEventModel> artists;
  final String prefixTag;

  const ArtistForEventSection(
      {Key key, this.title, this.artists, this.prefixTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (artists.length == 0) return Container();

    return Column(
      children: <Widget>[
        Section(
          title: title,
          children: artists
              .map((a) => ArtistTile.artistEvent(
                    a,
                    tag: '${prefixTag}_${a.artistId}',
                    showRole: (a.effectiveRoles != 'Default'),
                  ))
              .toList(),
        ),
        SpaceDivider(),
      ],
    );
  }
}
