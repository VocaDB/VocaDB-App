import 'package:vocadb_app/models.dart';

class SongDetailArgs {
  /// An id of song.
  final int id;

  /// Optional song data for pre-display before fetch.
  final SongModel song;

  /// A prefix hero tag string value from previous page for hero image.
  final String prefixHeroTag;

  const SongDetailArgs({this.id, this.song, this.prefixHeroTag});
}
