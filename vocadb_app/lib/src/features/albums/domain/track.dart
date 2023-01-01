// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';

class Track {
  final int id;
  final int discNumber;
  final Song song;
  final int trackNumber;
  Track({
    required this.id,
    required this.discNumber,
    required this.song,
    required this.trackNumber,
  });
}

extension TracksList on List<Track> {
  Map<String, List<Track>> get groupByDisc => groupBy(this, (Track l) {
        return l.discNumber.toString();
      });
}
