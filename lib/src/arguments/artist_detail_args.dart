import 'package:vocadb_app/models.dart';

class ArtistDetailArgs {
  /// An id of artist.
  final int id;

  /// Optional artist data for pre-display before fetch.
  final ArtistModel artist;

  /// A prefix hero tag string value from previous page for hero image.
  final String prefixHeroTag;

  const ArtistDetailArgs({this.id, this.artist, this.prefixHeroTag});
}
