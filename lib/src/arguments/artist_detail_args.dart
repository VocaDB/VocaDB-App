import 'package:vocadb_app/models.dart';

class ArtistDetailArgs {
  /// An id of artist.
  final int id;

  /// Optional artist data for pre-display before fetch.
  final ArtistModel artist;

  const ArtistDetailArgs({this.id, this.artist});
}
