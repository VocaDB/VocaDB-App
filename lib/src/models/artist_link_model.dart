import 'package:vocadb_app/models.dart';

class ArtistLinkModel {
  String linkType;
  ArtistModel artist;

  ArtistLinkModel.fromJson(Map<String, dynamic> json)
      : linkType = json['linkType'],
        artist = (json.containsKey('artist') && !(json['artist'] is int))
            ? ArtistModel.fromJson(json['artist'])
            : null;

  int get artistId => (this.artist == null) ? null : this.artist.id;

  String get artistImageUrl =>
      (this.artist == null) ? null : this.artist.imageUrl;
}
