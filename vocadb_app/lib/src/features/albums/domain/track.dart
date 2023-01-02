import 'package:collection/collection.dart';

import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
class Track with _$Track {
  factory Track({
    required int id,
    required int discNumber,
    required Song song,
    required int trackNumber,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}

extension TracksList on List<Track> {
  Map<String, List<Track>> get groupByDisc => groupBy(this, (Track l) {
        return l.discNumber.toString();
      });
}
