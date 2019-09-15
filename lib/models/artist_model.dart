class ArtistModel {
  int id;
  String name;
  String artistType;
  String additionalNames;

  ArtistModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        artistType = json['artistType'],
        additionalNames = json['additionalNames'];

  String get imageUrl => 'https://vocadb.net/Artist/Picture/$id';
}
