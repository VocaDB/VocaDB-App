import 'package:vocadb_app/models.dart';

class FollowedArtistModel {
  ArtistModel artist;

  FollowedArtistModel.fromJson(Map<String, dynamic> json)
      : artist = json.containsKey('artist')
            ? ArtistModel.fromJson(json['artist'])
            : null;

  static List<FollowedArtistModel> jsonToList(List items) {
    return (items == null)
        ? []
        : items.map((i) => FollowedArtistModel.fromJson(i)).toList();
  }
}
