import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

extension AppRouteContext on BuildContext {
  void goSong(int songID) {
    return GoRouter.of(this)
        .pushNamed(AppRoute.songDetail.name, params: {'id': songID.toString()});
  }

  void goAlbum(int albumID) {
    return GoRouter.of(this).pushNamed(AppRoute.albumDetail.name,
        params: {'id': albumID.toString()});
  }

  void goArtist(int artistID) {
    return GoRouter.of(this).pushNamed(AppRoute.artistDetail.name,
        params: {'id': artistID.toString()});
  }

  void goArtistsListFilterScreen() {
    return GoRouter.of(this).pushNamed(AppRoute.artistsListFilter.name);
  }
}
