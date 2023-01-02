import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_role_card.dart';

//TODO Change to horizontal view
class ArtistRolesHorizontalListView extends StatelessWidget {
  const ArtistRolesHorizontalListView({
    super.key,
    required this.artists,
    this.onSelect,
  });

  /// List of artists to display.
  final List<ArtistRole> artists;

  final Function(ArtistRole)? onSelect;

  @override
  Widget build(BuildContext context) {
    final children = artists
        .map<Widget>(
          (e) => ArtistRoleCard(
            artistRole: e,
          ),
        )
        .toList();

    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: children.length,
        itemBuilder: ((context, index) {
          return children[index];
        }),
      ),
    );
  }
}
