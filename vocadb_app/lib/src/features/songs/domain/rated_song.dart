// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class RatedSong {
  RatedSong({
    required this.song,
    required this.rating,
  });

  final Song song;

  final String rating;
}
