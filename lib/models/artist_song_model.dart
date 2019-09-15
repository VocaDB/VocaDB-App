import 'package:vocadb/models/artist_model.dart';

class ArtistSongModel {
  int id;
  String name;
  String roles;
  String effectiveRoles;
  String categories;
  ArtistModel artist;

  ArtistSongModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        roles = json['roles'],
        effectiveRoles = json['effectiveRoles'],
        categories = json['categories'],
        artist = (json.containsKey('artist'))
            ? ArtistModel.fromJson(json['artist'])
            : null;

  int get artistId => (this.artist == null) ? null : this.artist.id;

  String get artistName => (this.artist == null) ? this.name : this.artist.name;
}
