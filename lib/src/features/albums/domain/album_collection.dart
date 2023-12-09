import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_collection.freezed.dart';
part 'album_collection.g.dart';

@freezed
class AlbumCollection with _$AlbumCollection {
  const factory AlbumCollection({
    String? mediaType,
    String? purchaseStatus,
    required int rating,
    Album? album,
  }) = _AlbumCollection;

  factory AlbumCollection.fromJson(Map<String, dynamic> json) =>
      _$AlbumCollectionFromJson(json);

  static List<AlbumCollection> fromJsonToList(List<dynamic> source) {
    return source.map((e) => AlbumCollection.fromJson(e)).toList();
  }
}
