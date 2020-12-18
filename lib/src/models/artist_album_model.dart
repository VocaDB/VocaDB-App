import 'package:vocadb_app/models.dart';

class ArtistAlbumModel {
  int id;
  String name;
  String roles;
  String effectiveRoles;
  String categories;
  ArtistModel artist;

  ArtistAlbumModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        roles = json['roles'],
        effectiveRoles = json['effectiveRoles'],
        categories = json['categories'],
        artist = (json.containsKey('artist'))
            ? ArtistModel.fromJson(json['artist'])
            : null;

  int get artistId => (this.artist == null) ? id : this.artist.id;

  String get artistName => (this.artist == null) ? this.name : this.artist.name;

  String get artistImageUrl =>
      (this.artist == null) ? null : this.artist.imageUrl;

  String get artistRole => (this.effectiveRoles != 'Default' &&
          !this.isProducer &&
          !this.isVocalist &&
          !this.isLabel)
      ? this.effectiveRoles
      : this.categories;

  bool get isProducer => (this.categories == 'Producer');

  bool get isVocalist => (this.categories == 'Vocalist');

  bool get isLabel => (this.categories == 'Label');
}
