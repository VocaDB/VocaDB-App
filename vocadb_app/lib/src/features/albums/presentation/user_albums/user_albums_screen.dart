import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/common_widgets/search_appbar.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_album_collections.dart';
import 'package:vocadb_app/src/features/albums/presentation/albums_list/album_list_view.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

// TODO : need implementation
class UserAlbumsScreen extends StatelessWidget {
  const UserAlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final albumCollections = kFakeAlbumCollections;
    return Scaffold(
      appBar: SearchAppBar(
        titleText: 'My Collections',
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              GoRouter.of(context).goNamed(AppRoute.userAlbumsFilter.name);
            },
          ),
        ],
      ),
      body: AlbumListView(
        albums: albumCollections.map((e) => e.album).toList(),
        onSelect: (a) {},
      ),
    );
  }
}
