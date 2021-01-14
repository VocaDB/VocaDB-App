class ArtistRoleModel {
  final int id;

  final String name;

  final String role;

  final String imageUrl;

  const ArtistRoleModel({this.id, this.name, this.role, this.imageUrl});

  bool get isProducer => (this.role == 'Producer');

  bool get isVocalist => (this.role == 'Vocalist');

  bool get isOtherRole => (!isProducer && !isVocalist);
}
