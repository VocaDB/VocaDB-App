import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';

part 'album_detail_state.freezed.dart';

@freezed
class AlbumDetailState with _$AlbumDetailState {
  const factory AlbumDetailState({
    required AsyncValue<Album> album,
    @Default(AlbumCollection(rating: 0)) AlbumCollection albumCollection,
  }) = _AlbumDetailState;
}
