import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

extension AppRouteContext on BuildContext {
  void goSongDetail(Song song) {
    return GoRouter.of(this).pushNamed(AppRoute.songDetail.name,
        params: {'id': song.id.toString()});
  }

  void goAlbumDetail(Album album) {
    return GoRouter.of(this).pushNamed(AppRoute.albumDetail.name,
        params: {'id': album.id.toString()});
  }

  void goArtistDetail(Artist artist) {
    return GoRouter.of(this).pushNamed(AppRoute.artistDetail.name,
        params: {'id': artist.id.toString()});
  }

  void goTagDetail(Tag tag) {
    return GoRouter.of(this)
        .pushNamed(AppRoute.tagDetail.name, params: {'id': tag.id.toString()});
  }

  void goArtistsListFilterScreen() {
    return GoRouter.of(this).pushNamed(AppRoute.artistsListFilter.name);
  }
}
