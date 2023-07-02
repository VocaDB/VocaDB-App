import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/routing/app_router.dart';

extension AppRouteContext on BuildContext {
  Future<void> goSongDetail(Song song) async {
    goNamed(AppRoute.songDetail.name, pathParameters: { 'id': song.id.toString() });
  }

  Future<void> goAlbumDetail(Album album) async {
    goNamed(AppRoute.albumDetail.name, pathParameters: { 'id': album.id.toString() });
  }

  Future<void> goArtistDetail(Artist artist) async {
    goNamed(AppRoute.artistDetail.name, pathParameters: { 'id': artist.id.toString() });
  }

  Future<void> goTagDetail(Tag tag) async {
    goNamed(AppRoute.tagDetail.name, pathParameters: { 'id': tag.id.toString() });
  }

  Future<void> goReleaseEventDetail(ReleaseEvent releaseEvent) async {
    goNamed(AppRoute.releaseEventDetail.name, pathParameters: { 'id': releaseEvent.id.toString() });
  }

  Future<void> goArtistsListFilterScreen() async {
    goNamed(AppRoute.artistsListFilter.name);

  }

  Future<void> goLogin() async {
    goNamed(AppRoute.signIn.name);
  }
}
