import 'package:vocadb_app/models.dart';
import "package:collection/collection.dart";

class ArtistLinkModel {
  String linkType;
  ArtistModel artist;

  ArtistLinkModel({this.linkType, this.artist});

  ArtistLinkModel.fromJson(Map<String, dynamic> json)
      : linkType = json['linkType'],
        artist = (json.containsKey('artist') && !(json['artist'] is int))
            ? ArtistModel.fromJson(json['artist'])
            : null;

  int get artistId => (this.artist == null) ? null : this.artist.id;

  String get artistImageUrl =>
      (this.artist == null) ? null : this.artist.imageUrl;
}

class ArtistLinkList {
  final List<ArtistLinkModel> artistLinks;

  const ArtistLinkList(this.artistLinks);

  Map<String, dynamic> get groupByLinkType =>
      groupBy(artistLinks, (ArtistLinkModel l) {
        return l.linkType;
      });
}
