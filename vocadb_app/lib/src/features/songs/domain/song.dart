// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/songs/domain/lyric.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

part 'song.freezed.dart';

part 'song.g.dart';

@freezed
class Song with _$Song {
  const factory Song({
    required int id,
    String? name,
    String? artistString,
    String? imageUrl,
    String? songType,
    String? pvServices,
    String? additionalNames,
    DateTime? createDate,
    MainPicture? mainPicture,
    @Default(0) int favoritedTimes,
    @Default(0) int lengthSeconds,
    DateTime? publishDate,
    @Default(0) int ratingScore,
    @Default([]) List<TagUsage> tags,
    @Default([]) List<ArtistRole> artists,
    @Default([]) List<Album> albums,
    @Default([]) List<Lyric> lyrics,
    @Default([]) List<PV> pvs,
    @Default([]) List<WebLink> webLinks,
  }) = _Song;

  factory Song.fromJson(Map<String, Object?> json) => _$SongFromJson(json);
}

extension SongPV on Song {
  String get pvSearchQuery =>
      (pvs!.isNotEmpty) ? pvs![0].name : '$artistString+$name';
}
