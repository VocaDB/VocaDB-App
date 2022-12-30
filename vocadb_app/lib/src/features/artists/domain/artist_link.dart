// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import "package:collection/collection.dart";

class ArtistLink {
  final String linkType;

  final Artist artist;

  const ArtistLink({
    required this.linkType,
    required this.artist,
  });
}

extension ArtistLinkList on List<ArtistLink> {
  Map<String, dynamic> get groupByLinkType => groupBy(this, (ArtistLink l) {
        return l.linkType;
      });
}
