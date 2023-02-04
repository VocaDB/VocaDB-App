import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_followed_artist.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list/artist_list_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

// TODO : need implementation
class FollowedArtistsScreen extends StatelessWidget {
  const FollowedArtistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final followedArtists = kFakeFollowedArtistsList;

    return Scaffold(
      appBar: SearchAppBar(
        titleText: 'Followed artists',
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context)
                  .goNamed(AppRoute.userFollowedArtistsFilter.name);
            },
          ),
        ],
      ),
      body: ArtistListView(
        artists: followedArtists.map((e) => e.artist).toList(),
      ),
    );
  }
}
