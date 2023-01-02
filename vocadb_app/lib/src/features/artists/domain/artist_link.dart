import "package:collection/collection.dart";
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_link.freezed.dart';
part 'artist_link.g.dart';

@freezed
class ArtistLink with _$ArtistLink {
  factory ArtistLink({
    required String linkType,
    required Artist artist,
  }) = _ArtistLink;

  factory ArtistLink.fromJson(Map<String, dynamic> json) =>
      _$ArtistLinkFromJson(json);
}

extension ArtistLinkList on List<ArtistLink> {
  Map<String, dynamic> get groupByLinkType => groupBy(this, (ArtistLink l) {
        return l.linkType;
      });
}
