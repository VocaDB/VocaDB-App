import 'package:vocadb_app/models.dart';

class AlbumDetailArgs {
  /// An id of album.
  final int id;

  /// Optional album data for pre-display before fetch.
  final AlbumModel album;

  const AlbumDetailArgs({this.id, this.album});
}
