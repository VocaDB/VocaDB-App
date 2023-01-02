import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/albums/domain/disc.dart';
import 'package:vocadb_app/src/features/albums/domain/release_date.dart';
import 'package:vocadb_app/src/features/albums/domain/track.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  factory Album({
    required int id,
    String? name,
    String? artistString,
    String? discType,
    String? catalogNumber,
    String? description,
    @Default([]) List<Disc> discs,
    MainPicture? mainPicture,
    @Default([]) List<ArtistRole> artists,
    @Default([]) List<PV> pvs,
    @Default(0.00) double ratingAverage,
    @Default(0) int ratingCount,
    ReleaseDate? releaseDate,
    @Default([]) List<TagUsage> tags,
    @Default([]) List<Track> tracks,
    @Default([]) List<WebLink> webLinks,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}

extension AlbumExtended on Album {
  String? get imageUrl => (mainPicture?.urlOriginal != null)
      ? mainPicture!.urlOriginal
      : kPlaceholderImageUrl;
}
