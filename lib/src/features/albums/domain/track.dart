import 'package:collection/collection.dart';

import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
class Track with _$Track {
  factory Track({
    required int id,
    @Default('') String name,
    @Default(0) int discNumber,
    @Default(0) int trackNumber,
    Song? song,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}

extension TrackExtended on Track {
  String? get trackName {
    if (song == null) {
      return name;
    }
    return song!.name;
  }

  String? get trackArtistString {
    if (song == null) {
      return '';
    }
    return song!.artistString;
  }
}

extension TracksList on List<Track> {
  Map<String, List<Track>> get groupByDisc => groupBy(this, (Track l) {
        return l.discNumber.toString();
      });
}
