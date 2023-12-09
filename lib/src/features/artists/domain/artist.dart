import 'package:intl/intl.dart';

import 'package:vocadb_app/src/features/artists/domain/artist_link.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_relations.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist.freezed.dart';
part 'artist.g.dart';

@freezed
class Artist with _$Artist {
  factory Artist({
    required int id,
    String? name,
    String? additionalNames,
    String? releaseDate,
    String? artistType,
    String? description,
    MainPicture? mainPicture,
    ArtistRelations? relations,
    Artist? baseVoicebank,
    @Default([]) List<TagUsage> tags,
    @Default([]) List<WebLink> webLinks,
    @Default([]) List<ArtistLink> artistLinksReverse,
    @Default([]) List<ArtistLink> artistLinks,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  static List<Artist> fromJsonToList(List<dynamic> source) {
    return source.map((e) => Artist.fromJson(e)).toList();
  }
}

extension ArtistExtended on Artist {
  String? get releaseDateFormatted => (releaseDate == null)
      ? null
      : DateFormat('yyyy-MM-dd').format(DateTime.parse(releaseDate!));

  String? get imageUrl {
    if (mainPicture == null) return null;

    return mainPicture!.urlOriginal;
  }
}
