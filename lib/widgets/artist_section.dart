import 'package:flutter/material.dart';
import 'package:vocadb/models/artist_model.dart';
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
